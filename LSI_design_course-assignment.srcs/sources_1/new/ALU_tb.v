`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/03/2025
// Design Name: ALU Testbench
// Module Name: ALU_tb
// Project Name: Design a 8-bits RISC architecture CPU
// Target Devices: 
// Tool Versions: 
// Description: 
// Testbench for the updated ALU module with reset functionality
//
// Dependencies: 
// ALU.v
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// Tests reset, enable control, and all operations (HLT, SKZ, ADD, AND, XOR, LDA, STO, JMP).
// 
//////////////////////////////////////////////////////////////////////////////////

module ALU_tb;

    // Parameters
    parameter WIDTH_ADDRESS_BIT = 5;
    parameter WIDTH_REG_BIT = 8;
    parameter WIDTH_OPCODE_BIT = 3;
    parameter CLK_PERIOD = 10; // 10ns clock period

    // Inputs
    reg [WIDTH_REG_BIT-1:0] inA;
    reg [WIDTH_REG_BIT-1:0] inB;
    reg [WIDTH_OPCODE_BIT-1:0] opcode;
    reg clk;
    reg enable;
    reg rst;

    // Outputs
    wire [WIDTH_REG_BIT-1:0] ALU_out;
    wire is_zero;

    // Instantiate the Unit Under Test (UUT)
    ALU #(.WIDTH_ADDRESS_BIT(WIDTH_ADDRESS_BIT), .WIDTH_REG_BIT(WIDTH_REG_BIT), .WIDTH_OPCODE_BIT(WIDTH_OPCODE_BIT)) uut (
        .ALU_out(ALU_out),
        .is_zero(is_zero),
        .inA(inA),
        .inB(inB),
        .opcode(opcode),
        .clk(clk),
        .enable(enable),
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
        inA = 0;
        inB = 0;
        opcode = 0;
        enable = 0;
        rst = 0;

        // Wait for global reset
        #100;

        // Test Case 1: Reset
        rst = 1;
        #10;
        if (ALU_out !== 0)
            $display("Test Case 1 Failed: ALU_out not 0 after reset");
        else
            $display("Test Case 1 Passed: ALU_out = 0 after reset");
        @(posedge clk);
        rst = 0;
        #1;

        // Test Case 2: Disable with enable = 0 (no change)
        inA = 8'h05;
        enable = 0;
        @(posedge clk);
        #1;
        if (ALU_out !== 0)
            $display("Test Case 2 Failed: ALU_out changed with enable = 0, got %h", ALU_out);
        else
            $display("Test Case 2 Passed: ALU_out held at 0 with enable = 0");
        if (is_zero !== 0)
            $display("Test Case 2 Failed: is_zero = %b, expected 0", is_zero);
        else
            $display("Test Case 2 Passed: is_zero = %b", is_zero);

        // Test Case 3: HLT (opcode = 000) with inA = 5
        enable = 1;
        inA = 8'h05; // 5
        inB = 8'h00;
        opcode = 3'b000; // HLT
        @(posedge clk);
        #1;
        if (ALU_out !== 8'h05)
            $display("Test Case 3 Failed: HLT ALU_out = %h, expected %h", ALU_out, 8'h05);
        else
            $display("Test Case 3 Passed: HLT ALU_out = %h", ALU_out);
        if (is_zero !== 0)
            $display("Test Case 3 Failed: is_zero = %b, expected 0", is_zero);
        else
            $display("Test Case 3 Passed: is_zero = %b", is_zero);

        // Test Case 4: SKZ (opcode = 001) with inA = 0
        inA = 8'h00;
        inB = 8'h00;
        opcode = 3'b001; // SKZ
        @(posedge clk);
        #1;
        if (ALU_out !== 8'h00)
            $display("Test Case 4 Failed: SKZ ALU_out = %h, expected %h", ALU_out, 8'h00);
        else
            $display("Test Case 4 Passed: SKZ ALU_out = %h", ALU_out);
        if (is_zero !== 1)
            $display("Test Case 4 Failed: is_zero = %b, expected 1", is_zero);
        else
            $display("Test Case 4 Passed: is_zero = %b", is_zero);

        // Test Case 5: ADD (opcode = 010) with inA = 3, inB = 4
        inA = 8'h03; // 3
        inB = 8'h04; // 4
        opcode = 3'b010; // ADD
        @(posedge clk);
        #1;
        if (ALU_out !== 8'h07)
            $display("Test Case 5 Failed: ADD ALU_out = %h, expected %h", ALU_out, 8'h07);
        else
            $display("Test Case 5 Passed: ADD ALU_out = %h", ALU_out);
        if (is_zero !== 0)
            $display("Test Case 5 Failed: is_zero = %b, expected 0", is_zero);
        else
            $display("Test Case 5 Passed: is_zero = %b", is_zero);

        // Test Case 6: AND (opcode = 011) with inA = 5, inB = 3
        inA = 8'h05; // 5 (00000101)
        inB = 8'h03; // 3 (00000011)
        opcode = 3'b011; // AND
        @(posedge clk);
        #1;
        if (ALU_out !== 8'h01)
            $display("Test Case 6 Failed: AND ALU_out = %h, expected %h", ALU_out, 8'h01);
        else
            $display("Test Case 6 Passed: AND ALU_out = %h", ALU_out);
        if (is_zero !== 0)
            $display("Test Case 6 Failed: is_zero = %b, expected 0", is_zero);
        else
            $display("Test Case 6 Passed: is_zero = %b", is_zero);

        // Test Case 7: XOR (opcode = 100) with inA = 5, inB = 3
        inA = 8'h05; // 5 (00000101)
        inB = 8'h03; // 3 (00000011)
        opcode = 3'b100; // XOR
        @(posedge clk);
        #1;
        if (ALU_out !== 8'h06)
            $display("Test Case 7 Failed: XOR ALU_out = %h, expected %h", ALU_out, 8'h06);
        else
            $display("Test Case 7 Passed: XOR ALU_out = %h", ALU_out);
        if (is_zero !== 0)
            $display("Test Case 7 Failed: is_zero = %b, expected 0", is_zero);
        else
            $display("Test Case 7 Passed: is_zero = %b", is_zero);

        // Test Case 8: LDA (opcode = 101) with inB = 7
        inA = 8'h00;
        inB = 8'h07; // 7
        opcode = 3'b101; // LDA
        @(posedge clk);
        #1;
        if (ALU_out !== 8'h07)
            $display("Test Case 8 Failed: LDA ALU_out = %h, expected %h", ALU_out, 8'h07);
        else
            $display("Test Case 8 Passed: LDA ALU_out = %h", ALU_out);
        if (is_zero !== 1)
            $display("Test Case 8 Failed: is_zero = %b, expected 1", is_zero);
        else
            $display("Test Case 8 Passed: is_zero = %b", is_zero);

        // Test Case 9: STO (opcode = 110) with inA = 9
        inA = 8'h09; // 9
        inB = 8'h00;
        opcode = 3'b110; // STO
        @(posedge clk);
        #1;
        if (ALU_out !== 8'h09)
            $display("Test Case 9 Failed: STO ALU_out = %h, expected %h", ALU_out, 8'h09);
        else
            $display("Test Case 9 Passed: STO ALU_out = %h", ALU_out);
        if (is_zero !== 0)
            $display("Test Case 9 Failed: is_zero = %b, expected 0", is_zero);
        else
            $display("Test Case 9 Passed: is_zero = %b", is_zero);

        // Test Case 10: JMP (opcode = 111) with inA = 10
        inA = 8'h0A; // 10
        inB = 8'h00;
        opcode = 3'b111; // JMP
        @(posedge clk);
        #1;
        if (ALU_out !== 8'h0A)
            $display("Test Case 10 Failed: JMP ALU_out = %h, expected %h", ALU_out, 8'h0A);
        else
            $display("Test Case 10 Passed: JMP ALU_out = %h", ALU_out);
        if (is_zero !== 0)
            $display("Test Case 10 Failed: is_zero = %b, expected 0", is_zero);
        else
            $display("Test Case 10 Passed: is_zero = %b", is_zero);

        // End simulation
        #100;
        $display("Simulation Completed");
        $finish;
    end

    // Monitor signals
    initial begin
        $monitor("Time=%0t clk=%b rst=%b enable=%b opcode=%b inA=%h inB=%h ALU_out=%h is_zero=%b",
                 $time, clk, rst, enable, opcode, inA, inB, ALU_out, is_zero);
    end

endmodule