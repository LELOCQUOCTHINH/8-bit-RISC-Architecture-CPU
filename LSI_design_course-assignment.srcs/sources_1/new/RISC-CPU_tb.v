`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Le Loc Quoc Thinh
// 
// Create Date: 05/03/2025
// Design Name: RISC CPU Testbench
// Module Name: RISC_CPU_tb
// Project Name: Design a 8-bits RISC architecture CPU
// Target Devices: 
// Tool Versions: 
// Description: 
// Testbench for the RISC_CPU module
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
    
    //Dumping the waveform
    initial begin
        $recordfile ("waves");
        $recordvars ("depth=0", RISC_CPU_tb);
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
        repeat(16) @(posedge clk); // Allow 16 cycles (2 instructions) to reach JMP_OK (0x03)
        
        if(uut.program_counter !== 8'h03)
            $display("Test Case 2 Failed: program_counter=%h after JMP 0x1E and JMP 0x03, expected 0x03", uut.program_counter);
        else
            $display("Test Case 2 Passed: program_counter=%h after JMP 0x1E and JMP 0x03", uut.program_counter);
            
        // LDA 0x1A (DATA_1 = 0x00) at address 0x03
        repeat(8) @(posedge clk); // 8 cycles to complete LDA
        
        if (accumulator_register !== 8'h00)
            $display("Test Case 3 Failed: accumulator_register=%h after LDA 0x1A, expected 0x00", accumulator_register);
        else
            $display("Test Case 3 Passed: accumulator_register=%h after LDA 0x1A", accumulator_register);
        if (is_zero !== 1)
            $display("Test Case 3 Failed: is_zero=%b, expected 1", is_zero);
        else
            $display("Test Case 3 Passed: is_zero=%b", is_zero);

        // SKZ at address 0x04 (skip to 0x06 due to zero)
        repeat(8) @(posedge clk); // 8 cycles to complete SKZ
        
        // LDA 0x1B (DATA_2 = 0xFF) at address 0x06
        repeat(9) @(posedge clk); //bonus one cycle for load ALU_out to accumulator register
        
        if (accumulator_register !== 8'hFF)
            $display("Test Case 4 Failed: accumulator_register=%h after LDA 0x1B, expected 0xFF", accumulator_register);
        else
            $display("Test Case 4 Passed: accumulator_register=%h after LDA 0x1B", accumulator_register);
        if (is_zero !== 0)
            $display("Test Case 4 Failed: is_zero=%b, expected 0", is_zero);
        else
            $display("Test Case 4 Passed: is_zero=%b", is_zero);

        // SKZ at address 0x07 (no skip since not zero)
        repeat(7) @(posedge clk); //reduce one cycle because we bonus one above
        
        if(uut.program_counter !== 8'h08)
            $display("Test Case 5 Failed: program_counter=%h after SKZ with is_zero = 0, expected 0x08", uut.program_counter);
        else
            $display("Test Case 5 Passed: program_counter=%h after SKZ with is_zero = 0", uut.program_counter);
            
        // JMP 0x0A at address 0x08
        repeat(8) @(posedge clk);
        
        if(uut.program_counter !== 8'h0A)
            $display("Test Case 6 Failed: program_counter=%h after JMP 0x0A, expected 0x0A", uut.program_counter);
        else
            $display("Test Case 6 Passed: program_counter=%h after JMP 0x0A", uut.program_counter);
        
        // STO 0x1C (TEMP) command at address 0x0A (stores 0xFF)
        repeat(8) @(posedge clk);
        
        //LDA 1A (DATA_1: 0x00) command at address 0x0B to load the value at DATA_1 (0x00)
        repeat(9) @(posedge clk); //bonus one cycle to load the ALU_out into accumulator register
        
        if (accumulator_register !== 8'h0)
            $display("Test Case 7 Failed: accumulator_register=%h after LDA 0x1A, expected 0x00", accumulator_register);
        else
            $display("Test Case 7 Passed: accumulator_register=%h after LDA 0x1A", accumulator_register);
        if (is_zero !== 1)
            $display("Test Case 7 Failed: is_zero=%b, expected 1", is_zero);
        else
            $display("Test Case 7 Passed: is_zero=%b", is_zero);
            
         //STO 0x1C (TEMP) command at 0x0C
         repeat(7) @(posedge clk); //reduce one cyclce because we bonus one above
         
         //LDA 0x1C (TEMP) command at 0x0D
         repeat(8) @(posedge clk);
         
         if (accumulator_register !== 8'h0)
            $display("Test Case 8 Failed: accumulator_register=%h after LDA 0x1C, expected 0x00", accumulator_register);
        else
            $display("Test Case 8 Passed: accumulator_register=%h after LDA 0x1C", accumulator_register);
        if (is_zero !== 1)
            $display("Test Case 8 Failed: is_zero=%b, expected 1", is_zero);
        else
            $display("Test Case 8 Passed: is_zero=%b", is_zero);
         
         //SKZ command at 0x0E
         repeat(8) @(posedge clk);
         
        if(uut.program_counter !== 8'h10)
            $display("Test Case 9 Failed: program_counter=%h after SKZ with is_zero = 1, expected 0x10", uut.program_counter);
        else
            $display("Test Case 9 Passed: program_counter=%h after SKZ with is_zero = 1", uut.program_counter);
        if (is_zero !== 1)
            $display("Test Case 9 Failed: is_zero=%b, expected 1", is_zero);
        else
            $display("Test Case 9 Passed: is_zero=%b", is_zero);
         
        // XOR 0x1B (0x00 XOR 0xFF = 0xFF) at address 0x10
        repeat(9) @(posedge clk);
        
        if (accumulator_register !== 8'hFF)
            $display("Test Case 10 Failed: accumulator_register=%h after XOR 0x1B, expected 0xFF", accumulator_register);
        else
            $display("Test Case 10 Passed: accumulator_register=%h after XOR 0x1B", accumulator_register);
        if (is_zero !== 0)
            $display("Test Case 10 Failed: is_zero=%b, expected 0", is_zero);
        else
            $display("Test Case 10 Passed: is_zero=%b", is_zero);
        
        //SKZ command at address 0x11 but is_zero = 0 so the next instruction address is 0x12
        repeat(9) @(posedge clk); //bonus one cycle for load output into the accumulator register
        
        if(uut.program_counter !== 8'h12)
            $display("Test Case 11 Failed: program_counter=%h after SKZ with is_zero = 0, expected 0x12", uut.program_counter);
        else
            $display("Test Case 11 Passed: program_counter=%h after SKZ with is_zero = 0", uut.program_counter);
        if (is_zero !== 0)
            $display("Test Case 11 Failed: is_zero=%b, expected 0", is_zero);
        else
            $display("Test Case 11 Passed: is_zero=%b", is_zero);
            
        //JMP 0x14 (XOR_OK) at address 0x12
        repeat(7) @(posedge clk); //reduce one cycle because we bonus one above
        if(uut.program_counter !== 8'h14)
            $display("Test Case 12 Failed: program_counter=%h after JMP 0x14, expected 0x14", uut.program_counter);
        else
            $display("Test Case 12 Passed: program_counter=%h after JMP 0x14", uut.program_counter);
        
        //XOR 0x1B (DATA_2) at address 0x14 (0xFF XOR 0xFF = 0x00)
        repeat(9) @(posedge clk); //bonus one cycle for load output into the accumulator register
        
        if (accumulator_register !== 8'h00)
            $display("Test Case 13 Failed: accumulator_register=%h after XOR 0x1B, expected 0x00", accumulator_register);
        else
            $display("Test Case 13 Passed: accumulator_register=%h after XOR 0x1B", accumulator_register);
        if (is_zero !== 1)
            $display("Test Case 13 Failed: is_zero=%b, expected 1", is_zero);
        else
            $display("Test Case 13 Passed: is_zero=%b", is_zero);
        
        // Run until HLT (address 0x17)
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