`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Le Loc Quoc Thinh
// 
// Create Date: 05/03/2025
// Design Name: Clock Divider Testbench
// Module Name: CLK_divider_tb
// Project Name: Design a 8-bits RISC architecture CPU
// Target Devices: 
// Tool Versions: 
// Description: 
// Testbench for the CLK_divider module to verify clock division, reset, and stop functionality
//
// Dependencies: 
// CLK_divider.v
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// Uses adjusted parameters for simulation: CLOCK_FREQUENCY = 100, WANTED_FREQUENCY = 1.
// 
//////////////////////////////////////////////////////////////////////////////////

module CLK_divider_tb;

    // Parameters
    parameter CLOCK_FREQUENCY = 100; // Adjusted for simulation
    parameter WANTED_FREQUENCY = 1;  // Adjusted for simulation
    parameter CLK_PERIOD = 10;       // 10ns clock period (100 MHz)

    // Inputs
    reg clk;
    reg rst;
    reg stop;

    // Outputs
    wire divided_clk;

    // Internal counter for monitoring (accessing UUT's counter)
    wire [$clog2(CLOCK_FREQUENCY/WANTED_FREQUENCY)-1:0] counter;

    // Instantiate the Unit Under Test (UUT)
    CLK_divider #(.CLOCK_FREQUENCY(CLOCK_FREQUENCY), .WANTED_FREQUENCY(WANTED_FREQUENCY)) uut (
        .divided_clk(divided_clk),
        .clk(clk),
        .rst(rst),
        .stop(stop)
    );

    // Access internal counter for monitoring
    assign counter = uut.counter;

    // Clock generation
    initial begin
        clk = 0;
        forever #(CLK_PERIOD/2) clk = ~clk;
    end

    // Test stimulus
    initial begin
        // Initialize inputs
        rst = 0;
        stop = 0;

        // Wait for initial setup
        #100;

        // Test Case 1: Reset
        rst = 1;
        #10;
        if (divided_clk !== 0 || counter !== 0)
            $display("Test Case 1 Failed: divided_clk = %b, counter = %d, expected 0 and 0", divided_clk, counter);
        else
            $display("Test Case 1 Passed: divided_clk = %b, counter = %d", divided_clk, counter);
        rst = 0;
        #10;

        // Test Case 2: Clock Division (count to 100 cycles)
        // With COUNTER_THRESHOLD = 100, divided_clk should toggle every 100 input clocks
        // Input clock period = 10ns, so toggle every 1000ns (1us)
        stop = 0;
        repeat(50) @(posedge clk); // Wait 50 cycles (500ns)
        if (counter !== 50)
            $display("Test Case 2 Failed: counter = %d, expected 50 after 50 cycles", counter);
        else
            $display("Test Case 2 Passed: counter = %d after 50 cycles", counter);
        repeat(50) @(posedge clk); // Reach 100 cycles (1000ns)
        #1;
        if (counter !== 0 || divided_clk !== 1)
            $display("Test Case 2 Failed: counter = %d, divided_clk = %b, expected 0 and 1 after 100 cycles", counter, divided_clk);
        else
            $display("Test Case 2 Passed: counter = %d, divided_clk = %b after 100 cycles", counter, divided_clk);
        repeat(100) @(posedge clk); // Reach 200 cycles (2000ns)
        #1;
        if (counter !== 0 || divided_clk !== 0)
            $display("Test Case 2 Failed: counter = %d, divided_clk = %b, expected 0 and 0 after 200 cycles", counter, divided_clk);
        else
            $display("Test Case 2 Passed: counter = %d, divided_clk = %b after 200 cycles", counter, divided_clk);

        // Test Case 3: Stop Functionality
        stop = 1;
        #10;
        @(posedge clk);
        #1;
        if (counter !== 1)
            $display("Test Case 3 Failed: counter = %d, expected 1 when stop = 1", counter);
        else
            $display("Test Case 3 Passed: counter = %d when stop = 1", counter);
        repeat(100) @(posedge clk); // Wait 100 cycles
        #1;
        if (counter !== 1 || divided_clk !== 0)
            $display("Test Case 3 Failed: counter = %d, divided_clk = %b, expected 1 and 0 when stop = 1", counter, divided_clk);
        else
            $display("Test Case 3 Passed: counter = %d, divided_clk = %b after 100 cycles with stop = 1", counter, divided_clk);
        stop = 0;
        #10;

        // Test Case 4: Resume Clock Division
        repeat(99) @(posedge clk); // Reach 100 cycles since stop = 0
        #1;
        if (counter !== 0 || divided_clk !== 1)
            $display("Test Case 4 Failed: counter = %d, divided_clk = %b, expected 0 and 1 after resuming", counter, divided_clk);
        else
            $display("Test Case 4 Passed: counter = %d, divided_clk = %b after resuming", counter, divided_clk);

        // End simulation
        #100;
        $display("Simulation Completed");
        $finish;
    end

    // Monitor signals
    initial begin
        $monitor("Time=%0t clk=%b rst=%b stop=%b counter=%d divided_clk=%b",
                 $time, clk, rst, stop, counter, divided_clk);
    end

endmodule