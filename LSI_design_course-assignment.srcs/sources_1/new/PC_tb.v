`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Le Loc Quoc Thinh
// 
// Create Date: 05/01/2025
// Design Name: Program Counter Testbench
// Module Name: PC_tb
// Project Name: Design a 8-bits RISC architecture CPU
// Target Devices: 
// Tool Versions: 
// Description: 
// Testbench for the Program Counter module
//
// Dependencies: 
// PC.v
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module PC_tb;

    // Parameters
    parameter WIDTH_ADDRESS_BIT = 5;
    parameter CLK_PERIOD = 10; // 10ns clock period

    // Inputs
    reg [WIDTH_ADDRESS_BIT-1:0] PC_in;
    reg clk;
    reg rst;
    reg load;
    reg enable;

    // Output
    wire [WIDTH_ADDRESS_BIT-1:0] PC_out;

    // Instantiate the Unit Under Test (UUT)
    PC #(.WIDTH_ADDRESS_BIT(WIDTH_ADDRESS_BIT)) uut (
        .PC_out(PC_out),
        .PC_in(PC_in),
        .clk(clk),
        .rst(rst),
        .load(load),
        .enable(enable)
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
        enable = 0;

        // Wait for global reset
        #100;

        // Test Case 1: Reset
        rst = 1;
        #10;
        rst = 0;
        #10;
        if (PC_out !== 5'h00)
            $display("Test Case 1 Failed: Expected PC_out = 5'h00, Got %h", PC_out);
        else
            $display("Test Case 1 Passed: PC_out = %h", PC_out);

        // Test Case 2: Enable = 0, no change in PC_out
        enable = 0;
        @(posedge clk);
        #10;
        if (PC_out !== 5'h00)
            $display("Test Case 2 Failed: Expected PC_out = 5'h00, Got %h", PC_out);
        else
            $display("Test Case 2 Passed: PC_out = %h", PC_out);

        // Test Case 3: Enable = 1, Load = 0, increment PC
        enable = 1;
        load = 0;
        @(posedge clk);
        #10;
        if (PC_out !== 5'h01)
            $display("Test Case 3 Failed: Expected PC_out = 5'h01, Got %h", PC_out);
        else
            $display("Test Case 3 Passed: PC_out = %h", PC_out);

        // Test Case 4: Enable = 1, Load = 1, load PC_in
        PC_in = 5'h1A;
        enable = 1;
        load = 1;
        @(posedge clk);
        #10;
        if (PC_out !== 5'h1A)
            $display("Test Case 4 Failed: Expected PC_out = 5'h1A, Got %h", PC_out);
        else
            $display("Test Case 4 Passed: PC_out = %h", PC_out);

        // Test Case 5: Enable = 1, Load = 0, increment from loaded value
        load = 0;
        @(posedge clk);
        #10;
        if (PC_out !== 5'h1B)
            $display("Test Case 5 Failed: Expected PC_out = 5'h1B, Got %h", PC_out);
        else
            $display("Test Case 5 Passed: PC_out = %h", PC_out);

        // Test Case 6: Reset during operation
        rst = 1;
        @(posedge clk);
        rst = 0;
        #10;
        if (PC_out !== 5'h00)
            $display("Test Case 6 Failed: Expected PC_out = 5'h00, Got %h", PC_out);
        else
            $display("Test Case 6 Passed: PC_out = %h", PC_out);

        // End simulation
        #100;
        $display("Simulation Completed");
        $finish;
    end

    // Monitor signals
    initial begin
        $monitor("Time=%0t clk=%b rst=%b enable=%b load=%b PC_in=%h PC_out=%h",
                 $time, clk, rst, enable, load, PC_in, PC_out);
    end

endmodule