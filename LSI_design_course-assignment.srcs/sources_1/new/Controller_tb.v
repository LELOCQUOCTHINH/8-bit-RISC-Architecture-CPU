`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Le Loc Quoc Thinh
// 
// Create Date: 05/01/2025
// Design Name: Controller Testbench
// Module Name: Controller_tb
// Project Name: Design a 8-bits RISC architecture CPU
// Target Devices: 
// Tool Versions: 
// Description: 
// Testbench for the updated Controller module with halt stop functionality
//
// Dependencies: 
// Controller.v
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// Tests halt stop behavior for HLT opcode and normal progression for other opcodes.
// 
//////////////////////////////////////////////////////////////////////////////////

module Controller_tb;

    // Parameters
    parameter CONTROLLER_PHASE_BIT = 3;
    parameter WIDTH_ADDRESS_BIT = 5;
    parameter CLK_PERIOD = 10; // 10ns clock period

    // Inputs
    reg [CONTROLLER_PHASE_BIT-1:0] opcode;
    reg is_zero;
    reg clk;
    reg rst;

    // Outputs
    wire sel;
    wire rd;
    wire ld_ir;
    wire halt;
    wire inc_pc;
    wire ld_ac;
    wire ld_pc;
    wire wr;
    wire data_e;

    // Instantiate the Unit Under Test (UUT)
    Controller #(.CONTROLLER_PHASE_BIT(CONTROLLER_PHASE_BIT), .WIDTH_ADDRESS_BIT(WIDTH_ADDRESS_BIT)) uut (
        .sel(sel),
        .rd(rd),
        .ld_ir(ld_ir),
        .halt(halt),
        .inc_pc(inc_pc),
        .ld_ac(ld_ac),
        .ld_pc(ld_pc),
        .wr(wr),
        .data_e(data_e),
        .opcode(opcode),
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
        opcode = 0;
        is_zero = 0;
        rst = 0;

        // Wait for global reset
        #100;

        // Test Case 1: Reset
        rst = 1;
        repeat(2)@(posedge clk);
        rst = 0;
        #10;
        if (sel !== 1 || rd !== 0 || ld_ir !== 0 || halt !== 0 || inc_pc !== 0 || ld_ac !== 0 || ld_pc !== 0 || wr !== 0 || data_e !== 0)
            $display("Test Case 1 Failed: Reset state incorrect");
        else
            $display("Test Case 1 Passed: Reset to INST_ADDR");

        // Test Case 2: HLT (opcode = 000) - Verify halt stops progression
        opcode = 3'b000; // HLT
        repeat(5) @(posedge clk); // Reach OP_ADDR
        #10;
        if (halt !== 1)
            $display("Test Case 2 Failed: HLT did not set halt in OP_ADDR");
        else
            $display("Test Case 2 Passed: HLT sets halt in OP_ADDR");
        repeat(5) @(posedge clk); // Check if state stops
        #10;
        if (uut.controller_phase !== 3'b101) // Should remain in OP_FETCH (100)
            $display("Test Case 2 Failed: Controller did not stop at OP_ADDR with halt = 1");
        else
            $display("Test Case 2 Passed: Controller stopped at OP_ADDR with halt = 1");
        // Reset to continue
        rst = 1;
        repeat(2)@(posedge clk);
        rst = 0;

        // Test Case 3: SKZ with is_zero = 1 (opcode = 001)
        opcode = 3'b001; // SKZ
        is_zero = 1;
        repeat(5) @(posedge clk); // Reach OP_ADDR
        
        if (inc_pc !== 1)
            $display("Test Case 3 Failed: SKZ inc_pc not set in OP_ADDR");
        else
            $display("Test Case 3 Passed: SKZ inc_pc in OP_ADDR");
        repeat(2) @(posedge clk); // Reach ALU_OP
        
        if (inc_pc !== 1)
            $display("Test Case 3 Failed: SKZ with is_zero = 1 did not set inc_pc in ALU_OP");
        else
            $display("Test Case 3 Passed: SKZ with is_zero = 1 in ALU_OP");
        repeat(1) @(posedge clk); // Reach STORE
        #10;

        // Test Case 4: SKZ with is_zero = 0 (opcode = 001)
        rst = 1;
        @(posedge clk);
        rst = 0;
        opcode = 3'b001; // SKZ
        is_zero = 0;
        repeat(7) @(posedge clk); // Reach ALU_OP
        #10;
        if (inc_pc !== 0)
            $display("Test Case 4 Failed: SKZ with is_zero = 0 set inc_pc incorrectly in ALU_OP");
        else
            $display("Test Case 4 Passed: SKZ with is_zero = 0 in ALU_OP");
        repeat(1) @(posedge clk); // Reach STORE
        #10;

        // Test Case 5: ADD (opcode = 010)
        rst = 1;
        repeat(2) @(posedge clk);
        rst = 0;
        opcode = 3'b010; // ADD
        repeat(6) @(posedge clk); // Reach OP_FETCH
        
        if (rd !== 1)
            $display("Test Case 5 Failed: ADD OP_FETCH rd incorrect");
        else
            $display("Test Case 5 Passed: ADD OP_FETCH rd");
        @(posedge clk); // Reach ALU_OP
        
        if (rd !== 1)
            $display("Test Case 5 Failed: ADD ALU_OP rd incorrect");
        else
            $display("Test Case 5 Passed: ADD ALU_OP rd");
        @(posedge clk); // Reach STORE
        
        if (rd !== 1 || ld_ac !== 1)
            $display("Test Case 5 Failed: ADD STORE signals incorrect (rd=%b, ld_ac=%b)", rd, ld_ac);
        else
            $display("Test Case 5 Passed: ADD STORE signals");

        // Test Case 6: STO (opcode = 110)
        rst = 1;
        repeat(2) @(posedge clk);
        rst = 0;
        opcode = 3'b110; // STO
        repeat(7) @(posedge clk); // Reach ALU_OP
        
        if (data_e !== 1)
            $display("Test Case 6 Failed: STO ALU_OP data_e incorrect");
        else
            $display("Test Case 6 Passed: STO ALU_OP data_e");
        @(posedge clk); // Reach STORE
        
        if (wr !== 1 || data_e !== 1)
            $display("Test Case 6 Failed: STO STORE signals incorrect (wr=%b, data_e=%b)", wr, data_e);
        else
            $display("Test Case 6 Passed: STO STORE signals");

        // Test Case 7: JMP (opcode = 111)
        rst = 1;
        repeat(2) @(posedge clk);
        rst = 0;
        opcode = 3'b111; // JMP
        repeat(7) @(posedge clk); // Reach ALU_OP
        
        if (ld_pc !== 1)
            $display("Test Case 7 Failed: JMP ALU_OP ld_pc incorrect");
        else
            $display("Test Case 7 Passed: JMP ALU_OP ld_pc");
        @(posedge clk); // Reach STORE
        
        if (ld_pc !== 1)
            $display("Test Case 7 Failed: JMP STORE ld_pc incorrect");
        else
            $display("Test Case 7 Passed: JMP STORE ld_pc");

        // End simulation
        #100;
        $display("Simulation Completed");
        $finish;
    end

    // Monitor signals
    initial begin
        $monitor("Time=%0t clk=%b rst=%b opcode=%b is_zero=%b state=%d sel=%b rd=%b ld_ir=%b halt=%b inc_pc=%b ld_ac=%b ld_pc=%b wr=%b data_e=%b",
                 $time, clk, rst, opcode, is_zero, uut.controller_phase, sel, rd, ld_ir, halt, inc_pc, ld_ac, ld_pc, wr, data_e);
    end

endmodule