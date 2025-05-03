`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Le Loc Quoc Thinh
// 
// Create Date: 05/03/2025
// Design Name: Program Counter Testbench
// Module Name: PC_tb
// Project Name: Design a 8-bits RISC architecture CPU
// Target Devices: 
// Tool Versions: 
// Description: 
// Testbench for the PC module to verify reset, load, and increment functionality
//
// Dependencies: 
// PC.v
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// Tests reset, load, increment, and stop conditions for a 5-bit Program Counter
// 
//////////////////////////////////////////////////////////////////////////////////

module PC_tb;

    // Parameters
    parameter WIDTH_ADDRESS_BIT = 5;
    parameter CLK_PERIOD = 10; // 10ns clock period (100 MHz)

    // Inputs
    reg [WIDTH_ADDRESS_BIT-1:0] PC_in;
    reg clk;
    reg rst;
    reg load;
    reg increase;
    reg stop;

    // Outputs
    wire [WIDTH_ADDRESS_BIT-1:0] PC_out;

    // Instantiate the Unit Under Test (UUT)
    PC #(.WIDTH_ADDRESS_BIT(WIDTH_ADDRESS_BIT))
    uut (
        .PC_out(PC_out),
        .PC_in(PC_in),
        .clk(clk),
        .rst(rst),
        .load(load),
        .increase(increase),
        .stop(stop)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #(CLK_PERIOD/2) clk = ~clk;
    end

    // Test stimulus
    initial begin
        // Initialize inputs
        PC_in = 0;
        rst = 0;
        load = 0;
        increase = 0;
        stop = 0;

        // Wait for initial setup
        #100;

        // Test Case 1: Reset
        rst = 1;
        @(posedge clk);
        #1;
        if (PC_out !== 0)
            $display("Test Case 1 Failed: PC_out=%h, expected 0x00", PC_out);
        else
            $display("Test Case 1 Passed: PC_out=%h", PC_out);
        rst = 0;
        #10;

        // Test Case 2: Load Operation
        PC_in = 5'h0A; // Load value 0x0A
        load = 1;
        increase = 0;
        stop = 0;
        @(posedge clk);
        #1;
        if (PC_out !== 5'h0A)
            $display("Test Case 2 Failed: PC_out=%h after load, expected 0x0A", PC_out);
        else
            $display("Test Case 2 Passed: PC_out=%h after load", PC_out);
        load = 0;
        #10;

        // Test Case 3: Increment Operation
        increase = 1;
        stop = 0;
        repeat(5) @(posedge clk); // Increment 5 times
        #1;
        if (PC_out !== 5'h0F)
            $display("Test Case 3 Failed: PC_out=%h after 5 increments, expected 0x0F", PC_out);
        else
            $display("Test Case 3 Passed: PC_out=%h after 5 increments", PC_out);
        increase = 0;
        #10;

        // Test Case 4: Stop Condition (Prevent Increment)
        increase = 1;
        stop = 1;
        @(posedge clk);
        #1;
        if (PC_out !== 5'h0F)
            $display("Test Case 4 Failed: PC_out=%h with stop, expected 0x0F", PC_out);
        else
            $display("Test Case 4 Passed: PC_out=%h with stop", PC_out);
        stop = 0;
        #10;

        // Test Case 5: Load During Stop
        PC_in = 5'h05;
        load = 1;
        stop = 1;
        @(posedge clk);
        #1;
        if (PC_out !== 5'h0F)
            $display("Test Case 5 Failed: PC_out=%h with stop and load, expected 0x0F", PC_out);
        else
            $display("Test Case 5 Passed: PC_out=%h with stop and load", PC_out);
        stop = 0;
        load = 1;
        @(posedge clk);
        #1;
        if (PC_out !== 5'h05)
            $display("Test Case 5 Failed: PC_out=%h after load with stop off, expected 0x05", PC_out);
        else
            $display("Test Case 5 Passed: PC_out=%h after load with stop off", PC_out);
        load = 0;
        #10;

        // Test Case 6: Boundary Test (Increment to Max)
        PC_in = 5'h1E; // Set near max value
        load = 1;
        @(posedge clk);
        #1;
        if (PC_out !== 5'h1E)
            $display("Test Case 6 Failed: PC_out=%h after load to 0x1E, expected 0x1E", PC_out);
        else
            $display("Test Case 6 Passed: PC_out=%h after load to 0x1E", PC_out);
        load = 0;
        increase = 1;
        @(posedge clk);
        #1;
        if (PC_out !== 5'h1F)
            $display("Test Case 6 Failed: PC_out=%h after increment to max, expected 0x1F", PC_out);
        else
            $display("Test Case 6 Passed: PC_out=%h after increment to max", PC_out);
        @(posedge clk);
        #1;
        if (PC_out !== 0) // Check for wrap-around or hold (code holds due to no overflow handling)
            $display("Test Case 6 Failed: PC_out=%h after overflow, expected 0x00 or 0x1F", PC_out);
        else
            $display("Test Case 6 Passed: PC_out=%h after overflow", PC_out);
        increase = 0;

        // End simulation
        #100;
        $display("Simulation Completed");
        $finish;
    end

    // Monitor signals
    initial begin
        $monitor("Time=%0t clk=%b rst=%b load=%b increase=%b stop=%b PC_in=%h PC_out=%h",
                 $time, clk, rst, load, increase, stop, PC_in, PC_out);
    end

endmodule