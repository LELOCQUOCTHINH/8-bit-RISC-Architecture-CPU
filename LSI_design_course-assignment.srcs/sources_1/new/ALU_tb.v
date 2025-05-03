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
// Testbench for the ALU module to verify all operations and is_zero functionality
//
// Dependencies: 
// ALU.v
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// Tests HLT, SKZ, ADD, AND, XOR, LDA, STO, JMP operations and is_zero signal
// 
//////////////////////////////////////////////////////////////////////////////////

module ALU_tb;

    // Parameters
    parameter WIDTH_ADDRESS_BIT = 5;
    parameter WIDTH_REG_BIT = 8;
    parameter WIDTH_OPCODE_BIT = 3;
    parameter CLK_PERIOD = 10; // 10ns clock period (100 MHz)

    // Inputs
    reg [WIDTH_REG_BIT-1:0] inA;
    reg [WIDTH_REG_BIT-1:0] inB;
    reg [WIDTH_OPCODE_BIT-1:0] opcode;
    reg clk;
    reg rst;

    // Outputs
    wire [WIDTH_REG_BIT-1:0] ALU_out;
    wire is_zero;

    // Instantiate the Unit Under Test (UUT)
    ALU #(.WIDTH_ADDRESS_BIT(WIDTH_ADDRESS_BIT), .WIDTH_REG_BIT(WIDTH_REG_BIT),
          .WIDTH_OPCODE_BIT(WIDTH_OPCODE_BIT))
    uut (
        .ALU_out(ALU_out),
        .is_zero(is_zero),
        .inA(inA),
        .inB(inB),
        .opcode(opcode),
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
        inA = 0;
        inB = 0;
        opcode = 0;
        rst = 0;

        // Wait for initial setup
        #100;

        // Test Case 1: Reset
        rst = 1;
        @(posedge clk);
        #1;
        if (ALU_out !== 0)
            $display("Test Case 1 Failed: ALU_out=%h, expected 0x00", ALU_out);
        else
            $display("Test Case 1 Passed: ALU_out=%h", ALU_out);
        rst = 0;
        #10;

        // Test Case 2: HLT (opcode 000)
        inA = 8'hAA;
        inB = 8'h55;
        opcode = 3'b000;
        @(posedge clk);
        #1;
        if (ALU_out !== 8'hAA)
            $display("Test Case 2 Failed: ALU_out=%h for HLT, expected 0xAA", ALU_out);
        else
            $display("Test Case 2 Passed: ALU_out=%h for HLT", ALU_out);

        // Test Case 3: SKZ (opcode 001)
        opcode = 3'b001;
        @(posedge clk);
        #1;
        if (ALU_out !== 8'hAA)
            $display("Test Case 3 Failed: ALU_out=%h for SKZ, expected 0xAA", ALU_out);
        else
            $display("Test Case 3 Passed: ALU_out=%h for SKZ", ALU_out);
        if (is_zero !== 0)
            $display("Test Case 3 Failed: is_zero=%b, expected 0", is_zero);
        else
            $display("Test Case 3 Passed: is_zero=%b", is_zero);

        // Test Case 4: ADD (opcode 010)
        inA = 8'h01;
        inB = 8'h02;
        opcode = 3'b010;
        @(posedge clk);
        #1;
        if (ALU_out !== 8'h03)
            $display("Test Case 4 Failed: ALU_out=%h for ADD, expected 0x03", ALU_out);
        else
            $display("Test Case 4 Passed: ALU_out=%h for ADD", ALU_out);

        // Test Case 5: AND (opcode 011)
        inA = 8'hF0;
        inB = 8'h0F;
        opcode = 3'b011;
        @(posedge clk);
        #1;
        if (ALU_out !== 8'h00)
            $display("Test Case 5 Failed: ALU_out=%h for AND, expected 0x00", ALU_out);
        else
            $display("Test Case 5 Passed: ALU_out=%h for AND", ALU_out);
        if (is_zero !== 0)
            $display("Test Case 5 Failed: is_zero=%b, expected 0", is_zero);
        else
            $display("Test Case 5 Passed: is_zero=%b", is_zero);

        // Test Case 6: XOR (opcode 100)
        inA = 8'hFF;
        inB = 8'hFF;
        opcode = 3'b100;
        @(posedge clk);
        #1;
        if (ALU_out !== 8'h00)
            $display("Test Case 6 Failed: ALU_out=%h for XOR, expected 0x00", ALU_out);
        else
            $display("Test Case 6 Passed: ALU_out=%h for XOR", ALU_out);
        if (is_zero !== 0)
            $display("Test Case 6 Failed: is_zero=%b, expected 0", is_zero);
        else
            $display("Test Case 6 Passed: is_zero=%b", is_zero);

        // Test Case 7: LDA (opcode 101)
        inA = 8'hAA;
        inB = 8'h55;
        opcode = 3'b101;
        @(posedge clk);
        #1;
        if (ALU_out !== 8'h55)
            $display("Test Case 7 Failed: ALU_out=%h for LDA, expected 0x55", ALU_out);
        else
            $display("Test Case 7 Passed: ALU_out=%h for LDA", ALU_out);

        // Test Case 8: STO (opcode 110)
        opcode = 3'b110;
        @(posedge clk);
        #1;
        if (ALU_out !== 8'hAA)
            $display("Test Case 8 Failed: ALU_out=%h for STO, expected 0xAA", ALU_out);
        else
            $display("Test Case 8 Passed: ALU_out=%h for STO", ALU_out);

        // Test Case 9: JMP (opcode 111)
        opcode = 3'b111;
        @(posedge clk);
        #1;
        if (ALU_out !== 8'hAA)
            $display("Test Case 9 Failed: ALU_out=%h for JMP, expected 0xAA", ALU_out);
        else
            $display("Test Case 9 Passed: ALU_out=%h for JMP", ALU_out);

        // Test Case 10: is_zero with zero input
        inA = 8'h00;
        inB = 8'hFF;
        opcode = 3'b000; // HLT to pass inA
        @(posedge clk);
        #1;
        if (ALU_out !== 8'h00)
            $display("Test Case 10 Failed: ALU_out=%h for HLT, expected 0x00", ALU_out);
        else
            $display("Test Case 10 Passed: ALU_out=%h for HLT", ALU_out);
        if (is_zero !== 1)
            $display("Test Case 10 Failed: is_zero=%b, expected 1", is_zero);
        else
            $display("Test Case 10 Passed: is_zero=%b", is_zero);

        // End simulation
        #100;
        $display("Simulation Completed");
        $finish;
    end

    // Monitor signals
    initial begin
        $monitor("Time=%0t clk=%b rst=%b opcode=%b inA=%h inB=%h ALU_out=%h is_zero=%b",
                 $time, clk, rst, opcode, inA, inB, ALU_out, is_zero);
    end

endmodule