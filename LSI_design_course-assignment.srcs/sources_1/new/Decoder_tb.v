`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Le Loc Quoc Thinh
// 
// Create Date: 05/03/2025
// Design Name: Decoder Testbench
// Module Name: Decoder_tb
// Project Name: Design a 8-bits RISC architecture CPU
// Target Devices: 
// Tool Versions: 
// Description: 
// Testbench for the Decoder module to verify opcode and address extraction
//
// Dependencies: 
// Decoder.v
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// Tests various instruction inputs for correct opcode_out and address_out decoding.
// 
//////////////////////////////////////////////////////////////////////////////////

module Decoder_tb;

    // Parameters
    parameter WIDTH_ADDRESS_BIT = 5;
    parameter WIDTH_OPCODE_BIT = 3;
    parameter WIDTH_REG_BIT = 8;

    // Inputs
    reg [WIDTH_REG_BIT-1:0] instruction_in;

    // Outputs
    wire [WIDTH_OPCODE_BIT-1:0] opcode_out;
    wire [WIDTH_ADDRESS_BIT-1:0] address_out;

    // Instantiate the Unit Under Test (UUT)
    Decoder #(.WIDTH_ADDRESS_BIT(WIDTH_ADDRESS_BIT), .WIDTH_OPCODE_BIT(WIDTH_OPCODE_BIT), .WIDTH_REG_BIT(WIDTH_REG_BIT)) uut (
        .opcode_out(opcode_out),
        .address_out(address_out),
        .instruction_in(instruction_in)
    );

    // Test stimulus
    initial begin
        // Initialize input
        instruction_in = 0;

        // Wait for initial setup
        #10;

        // Test Case 1: Minimum value (all zeros)
        instruction_in = 8'b00000000; // opcode = 000, address = 00000
        #10;
        if (opcode_out !== 3'b000 || address_out !== 5'b00000)
            $display("Test Case 1 Failed: opcode_out = %b, address_out = %b, expected 000 and 00000", opcode_out, address_out);
        else
            $display("Test Case 1 Passed: opcode_out = %b, address_out = %b", opcode_out, address_out);

        // Test Case 2: HLT instruction (opcode = 000, address = 00101)
        instruction_in = 8'b00000101; // HLT with address 5
        #10;
        if (opcode_out !== 3'b000 || address_out !== 5'b00101)
            $display("Test Case 2 Failed: opcode_out = %b, address_out = %b, expected 000 and 00101", opcode_out, address_out);
        else
            $display("Test Case 2 Passed: opcode_out = %b, address_out = %b", opcode_out, address_out);

        // Test Case 3: ADD instruction (opcode = 010, address = 11111)
        instruction_in = 8'b01011111; // ADD with address 31
        #10;
        if (opcode_out !== 3'b010 || address_out !== 5'b11111)
            $display("Test Case 3 Failed: opcode_out = %b, address_out = %b, expected 010 and 11111", opcode_out, address_out);
        else
            $display("Test Case 3 Passed: opcode_out = %b, address_out = %b", opcode_out, address_out);

        // Test Case 4: AND instruction (opcode = 011, address = 00010)
        instruction_in = 8'b01100010; // AND with address 2
        #10;
        if (opcode_out !== 3'b011 || address_out !== 5'b00010)
            $display("Test Case 4 Failed: opcode_out = %b, address_out = %b, expected 011 and 00010", opcode_out, address_out);
        else
            $display("Test Case 4 Passed: opcode_out = %b, address_out = %b", opcode_out, address_out);

        // Test Case 5: XOR instruction (opcode = 100, address = 10101)
        instruction_in = 8'b10010101; // XOR with address 21
        #10;
        if (opcode_out !== 3'b100 || address_out !== 5'b10101)
            $display("Test Case 5 Failed: opcode_out = %b, address_out = %b, expected 100 and 10101", opcode_out, address_out);
        else
            $display("Test Case 5 Passed: opcode_out = %b, address_out = %b", opcode_out, address_out);

        // Test Case 6: LDA instruction (opcode = 101, address = 01010)
        instruction_in = 8'b10101010; // LDA with address 10
        #10;
        if (opcode_out !== 3'b101 || address_out !== 5'b01010)
            $display("Test Case 6 Failed: opcode_out = %b, address_out = %b, expected 101 and 01010", opcode_out, address_out);
        else
            $display("Test Case 6 Passed: opcode_out = %b, address_out = %b", opcode_out, address_out);

        // Test Case 7: STO instruction (opcode = 110, address = 11000)
        instruction_in = 8'b11011000; // STO with address 24
        #10;
        if (opcode_out !== 3'b110 || address_out !== 5'b11000)
            $display("Test Case 7 Failed: opcode_out = %b, address_out = %b, expected 110 and 11000", opcode_out, address_out);
        else
            $display("Test Case 7 Passed: opcode_out = %b, address_out = %b", opcode_out, address_out);

        // Test Case 8: JMP instruction (opcode = 111, address = 01111)
        instruction_in = 8'b11101111; // JMP with address 15
        #10;
        if (opcode_out !== 3'b111 || address_out !== 5'b01111)
            $display("Test Case 8 Failed: opcode_out = %b, address_out = %b, expected 111 and 01111", opcode_out, address_out);
        else
            $display("Test Case 8 Passed: opcode_out = %b, address_out = %b", opcode_out, address_out);

        // Test Case 9: Maximum value
        instruction_in = 8'b11111111; // opcode = 111, address = 11111
        #10;
        if (opcode_out !== 3'b111 || address_out !== 5'b11111)
            $display("Test Case 9 Failed: opcode_out = %b, address_out = %b, expected 111 and 11111", opcode_out, address_out);
        else
            $display("Test Case 9 Passed: opcode_out = %b, address_out = %b", opcode_out, address_out);

        // End simulation
        #100;
        $display("Simulation Completed");
        $finish;
    end

    // Monitor signals
    initial begin
        $monitor("Time=%0t instruction_in=%b opcode_out=%b address_out=%b",
                 $time, instruction_in, opcode_out, address_out);
    end

endmodule