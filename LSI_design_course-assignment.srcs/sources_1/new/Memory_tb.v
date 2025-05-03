`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/03/2025
// Design Name: Memory Testbench
// Module Name: Memory_tb
// Project Name: Design a 8-bits RISC architecture CPU
// Target Devices: 
// Tool Versions: 
// Description: 
// Testbench for the Memory module to verify read, write, and reset functionality
//
// Dependencies: 
// Memory.v
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// Tests memory initialization, read, and write operations
// 
//////////////////////////////////////////////////////////////////////////////////

module Memory_tb;

    // Parameters
    parameter WIDTH_ADDRESS_BIT = 5;
    parameter WIDTH_REG_BIT = 8;
    parameter CLK_PERIOD = 10; // 10ns clock period (100 MHz)

    // Inputs
    reg [WIDTH_REG_BIT-1:0] DATA_in;
    reg [WIDTH_ADDRESS_BIT-1:0] ADDRESS;
    reg read;
    reg write;
    reg rst;
    reg clk;

    // Outputs
    wire [WIDTH_REG_BIT-1:0] DATA_out;

    // Instantiate the Unit Under Test (UUT)
    Memory #(.WIDTH_ADDRESS_BIT(WIDTH_ADDRESS_BIT), .WIDTH_REG_BIT(WIDTH_REG_BIT))
    uut (
        .DATA_out(DATA_out),
        .DATA_in(DATA_in),
        .ADDRESS(ADDRESS),
        .read(read),
        .write(write),
        .rst(rst),
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
        read = 0;
        write = 0;
        rst = 0;

        // Wait for initial setup
        #100;

        // Test Case 1: Reset
        rst = 1;
        #10;
        if (DATA_out !== 0)
            $display("Test Case 1 Failed: DATA_out=%h, expected 0x00", DATA_out);
        else
            $display("Test Case 1 Passed: DATA_out=%h", DATA_out);
        rst = 0;
        #10;

        // Test Case 2: Read from initialized memory
        // Check address 0x00 (JMP 0x1E = 8'b111_11110)
        ADDRESS = 5'h00;
        read = 1;
        write = 0;
        @(posedge clk);
        #1;
        if (DATA_out !== 8'b11111110)
            $display("Test Case 2 Failed: DATA_out=%h at ADDRESS=0x00, expected 0xFE", DATA_out);
        else
            $display("Test Case 2 Passed: DATA_out=%h at ADDRESS=0x00", DATA_out);

        // Check address 0x1A (DATA_1 = 0x00)
        ADDRESS = 5'h1A;
        @(posedge clk);
        #1;
        if (DATA_out !== 8'h00)
            $display("Test Case 2 Failed: DATA_out=%h at ADDRESS=0x1A, expected 0x00", DATA_out);
        else
            $display("Test Case 2 Passed: DATA_out=%h at ADDRESS=0x1A", DATA_out);

        // Test Case 3: Write to memory
        // Write 0x55 to address 0x1C (TEMP, originally 0xAA)
        ADDRESS = 5'h1C;
        DATA_in = 8'h55;
        read = 0;
        write = 1;
        @(posedge clk);
        #1;
        // Read back to verify
        read = 1;
        write = 0;
        @(posedge clk);
        #1;
        if (DATA_out !== 8'h55)
            $display("Test Case 3 Failed: DATA_out=%h at ADDRESS=0x1C, expected 0x55", DATA_out);
        else
            $display("Test Case 3 Passed: DATA_out=%h at ADDRESS=0x1C", DATA_out);

      
        // End simulation
        #100;
        $display("Simulation Completed");
        $finish;
    end

    // Monitor signals
    initial begin
        $monitor("Time=%0t clk=%b rst=%b ADDRESS=%h read=%b write=%b DATA_in=%h DATA_out=%h",
                 $time, clk, rst, ADDRESS, read, write, DATA_in, DATA_out);
    end

endmodule