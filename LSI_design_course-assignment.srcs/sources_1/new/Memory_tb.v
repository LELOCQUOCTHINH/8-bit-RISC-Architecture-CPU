`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Le Loc Quoc Thinh
// 
// Create Date: 05/01/2025
// Design Name: Memory Testbench
// Module Name: Memory_tb
// Project Name: Design a 8-bits RISC architecture CPU
// Target Devices: 
// Tool Versions: 
// Description: 
// Testbench for the Memory module
//
// Dependencies: 
// Memory.v
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module Memory_tb;

    // Parameters
    parameter WIDTH_ADDRESS_BIT = 5;
    parameter WIDTH_REG = 8;
    parameter CLK_PERIOD = 10; // 10ns clock period

    // Inputs
    reg [WIDTH_REG-1:0] DATA_in;
    reg [WIDTH_ADDRESS_BIT-1:0] ADDRESS;
    reg read_write;
    reg clk;

    // Outputs
    wire [WIDTH_REG-1:0] DATA_out;

    // Instantiate the Unit Under Test (UUT)
    Memory #(.WIDTH_ADDRESS_BIT(WIDTH_ADDRESS_BIT), .WIDTH_REG(WIDTH_REG)) uut (
        .DATA_out(DATA_out),
        .DATA_in(DATA_in),
        .ADDRESS(ADDRESS),
        .read_write(read_write),
        .clk(clk)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #(CLK_PERIOD/2) clk = ~clk;
    end

    // Test stimulus
    initial begin
        // Initialize inputs
        DATA_in = 0;
        ADDRESS = 0;
        read_write = 0;

        // Wait for global reset
        #100;

        // Test Case 1: Write to memory
        @(posedge clk);
        ADDRESS = 5'h0A;
        DATA_in = 8'h55;
        read_write = 0; // Write
        #10;

        // Test Case 2: Read from memory
        @(posedge clk);
        read_write = 1; // Read
        #10;
        if (DATA_out !== 8'h55)
            $display("Test Case 2 Failed: Expected DATA_out = 8'h55, Got %h", DATA_out);
        else
            $display("Test Case 2 Passed: DATA_out = %h", DATA_out);

        // Test Case 3: Write to another address
        @(posedge clk);
        ADDRESS = 5'h1F;
        DATA_in = 8'hAA;
        read_write = 0; // Write
        #10;

        // Test Case 4: Read from the new address
        @(posedge clk);
        read_write = 1; // Read
        #10;
        if (DATA_out !== 8'hAA)
            $display("Test Case 4 Failed: Expected DATA_out = 8'hAA, Got %h", DATA_out);
        else
            $display("Test Case 4 Passed: DATA_out = %h", DATA_out);

        // Test Case 5: Write and read immediately
        @(posedge clk);
        ADDRESS = 5'h00;
        DATA_in = 8'hFF;
        read_write = 0; // Write
        #10;
        @(posedge clk);
        read_write = 1; // Read
        #10;
        if (DATA_out !== 8'hFF)
            $display("Test Case 5 Failed: Expected DATA_out = 8'hFF, Got %h", DATA_out);
        else
            $display("Test Case 5 Passed: DATA_out = %h", DATA_out);

        // End simulation
        #100;
        $display("Simulation Completed");
        $finish;
    end

    // Monitor signals
    initial begin
        $monitor("Time=%0t clk=%b ADDRESS=%h read_write=%b DATA_in=%h DATA_out=%h",
                 $time, clk, ADDRESS, read_write, DATA_in, DATA_out);
    end

endmodule