`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/03/2025
// Design Name: RISC CPU Testbench
// Module Name: RISC_CPU_tb
// Project Name: Design a 8-bits RISC architecture CPU
// Target Devices: 
// Tool Versions: 
// Description: 
// Testbench for the RISC_CPU module with 2 inputs (clk, rst) and 2 outputs (accumulator_register, is_zero)
// 
// Dependencies: 
// RISC_CPU.v, Controller.v, ALU.v, Memory.v, Mux.v, PC.v, Register.v, Decoder.v
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// Tests the execution of the preloaded memory program (JMP, LDA, SKZ, STO, XOR, HLT).
// 
//////////////////////////////////////////////////////////////////////////////////

module RISC_CPU_tb;

    // Parameters
    parameter WIDTH_ADDRESS_BIT = 5;
    parameter WIDTH_REG_BIT = 8;
    parameter WIDTH_OPCODE_BIT = 3;
    parameter CONTROLLER_PHASE_BIT = 3;
    parameter CLK_PERIOD = 2; // 1ns clock period 

    // Inputs
    reg clk;
    reg rst;

    // Outputs
    wire [WIDTH_REG_BIT-1:0] accumulator_register;
    wire is_zero;

    // Instantiate the Unit Under Test (UUT)
    RISC_CPU #(.WIDTH_ADDRESS_BIT(WIDTH_ADDRESS_BIT), .WIDTH_REG_BIT(WIDTH_REG_BIT),
               .WIDTH_OPCODE_BIT(WIDTH_OPCODE_BIT), .CONTROLLER_PHASE_BIT(CONTROLLER_PHASE_BIT))
    uut (
        .accumulator_register(accumulator_register),
        .is_zero(is_zero),
        .clk(clk),
        .rst(rst)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #(CLK_PERIOD/2) clk = ~clk;
    end

    // Test stimulus
    initial begin
        // Initialize inputs
        rst = 0;

        // Wait for initial setup
        #100;

        // Test Case 1: Reset
        rst = 1;
        repeat(2) @(posedge clk);
        
        if (accumulator_register !== 0 || is_zero !== 1)
            $display("Test Case 1 Failed: accumulator_register=%h, is_zero=%b, expected 0x00, 1", accumulator_register, is_zero);
        else
            $display("Test Case 1 Passed: accumulator_register=%h, is_zero=%b", accumulator_register, is_zero);
        rst = 0;
        

        // Test Case 2: Execute Program
        // Program starts at 0x00 (JMP 0x1E), jumps to 0x1E (JMP 0x03), then executes from 0x03
        // Expected sequence: LDA 0x1A (0x00), SKZ (skip), LDA 0x1B (0xFF), SKZ (no skip), JMP 0x0A, STO 0x1C, XOR 0x1B
        repeat(100) @(posedge clk); // Allow 100 cycles to reach JMP_OK (0x03)
        
        // LDA 0x1A (DATA_1 = 0x00) at address 0x03
        repeat(8) @(posedge clk); // 8 cycles to complete LDA
        
        if (accumulator_register !== 8'h00)
            $display("Test Case 2 Failed: accumulator_register=%h after LDA 0x1A, expected 0x00", accumulator_register);
        else
            $display("Test Case 2 Passed: accumulator_register=%h after LDA 0x1A", accumulator_register);
        if (is_zero !== 1)
            $display("Test Case 2 Failed: is_zero=%b, expected 1", is_zero);
        else
            $display("Test Case 2 Passed: is_zero=%b", is_zero);

        // SKZ at address 0x04 (skip to 0x06 due to zero)
        repeat(8) @(posedge clk); // 8 cycles to complete SKZ
        
        // LDA 0x1B (DATA_2 = 0xFF) at address 0x06
        repeat(8) @(posedge clk);
        
        if (accumulator_register !== 8'hFF)
            $display("Test Case 2 Failed: accumulator_register=%h after LDA 0x1B, expected 0xFF", accumulator_register);
        else
            $display("Test Case 2 Passed: accumulator_register=%h after LDA 0x1B", accumulator_register);
        if (is_zero !== 0)
            $display("Test Case 2 Failed: is_zero=%b, expected 0", is_zero);
        else
            $display("Test Case 2 Passed: is_zero=%b", is_zero);

        // SKZ at address 0x07 (no skip since not zero)
        repeat(8) @(posedge clk);
        
        // JMP 0x0A at address 0x08
        repeat(8) @(posedge clk);
        
        // STO 0x1C (TEMP) at address 0x0A (stores 0xFF)
        repeat(8) @(posedge clk);
        
        if (accumulator_register !== 8'hFF)
            $display("Test Case 2 Failed: accumulator_register=%h after STO 0x1C, expected 0xFF", accumulator_register);
        else
            $display("Test Case 2 Passed: accumulator_register=%h after STO 0x1C", accumulator_register);

        // XOR 0x1B (0xFF XOR 0xFF = 0x00) at address 0x14
        repeat(32) @(posedge clk); // Advance to XOR_OK (0x14)
        
        repeat(8) @(posedge clk);
        
        if (accumulator_register !== 8'h00)
            $display("Test Case 2 Failed: accumulator_register=%h after XOR 0x1B, expected 0x00", accumulator_register);
        else
            $display("Test Case 2 Passed: accumulator_register=%h after XOR 0x1B", accumulator_register);
        if (is_zero !== 1)
            $display("Test Case 2 Failed: is_zero=%b, expected 1", is_zero);
        else
            $display("Test Case 2 Passed: is_zero=%b", is_zero);

        // Run until HLT (e.g., at 0x22 or loop back)
        repeat(50) @(posedge clk);
        

        // End simulation
        #100;
        $display("Simulation Completed");
        $finish;
    end

    // Monitor signals
    initial begin
        $monitor("Time=%0t clk=%b rst=%b Controller_phase=%d accumulator_register=%b is_zero=%b PC=%h halt=%b memory_out=%b",
                 $time, clk, rst, uut.controller.controller_phase, accumulator_register, is_zero, uut.program_counter, uut.halt, uut.memory_out);
    end

endmodule