`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/09/2024 07:34:53 PM
// Design Name: 
// Module Name: CPU_testbench
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module CPU_testbench();
    reg clk, load_instruction_flag, execute_instruction_flag, reset; 
    reg [7:0] data_in;
    wire [8:0] data_out;
    wire [7:0] memory_test;
    wire [7:0] IR_test;
    wire [4:0] pc_out_test;
    wire [4:0] operand_address_test;
    wire LoadCorO_test, LorE_test;
    reg clk1, clk2 ;
    wire empty;
    wire stop;
    always #0.5 clk = ~clk;
    always #0.75 clk2 = ~clk2;
    
    initial
    begin
    $monitor("timer = %0t, clk = %1b, clk2 = %1b, data_in = %8b, execute_instruction_flag = %1b, stop = %3d, pc_out = %5b, LorEinstr = %1b, LoIorO = %1b, IR_test = %8b, operand_address_test = %5b, memory_out = %8b, data_out = %9b\n",  
    $time, clk,clk2, data_in, execute_instruction_flag, stop, pc_out_test, LorE_test, LoadCorO_test,IR_test, operand_address_test, memory_test, data_out);
    end
    
    initial
    begin
//    reset = 0;
//    #0.1 
    reset = 1; clk = 0; clk2 = 0;
    #1.5 load_instruction_flag = 1; data_in = 8'b01000000; execute_instruction_flag = 0; reset = 0;
    #1.5 reset = 0; load_instruction_flag = 1; data_in = 8'b10000001; execute_instruction_flag = 0;
    #1.5 load_instruction_flag = 1; data_in = 8'b01100010; execute_instruction_flag = 0; reset = 0;
    #1.5 load_instruction_flag = 1; data_in = 8'b01100011; execute_instruction_flag = 0; reset = 0;
    #1.5 load_instruction_flag = 1; data_in = 8'b10000100; execute_instruction_flag = 0; reset = 0;
    #1.5 load_instruction_flag = 0; data_in = 8'b01000101; execute_instruction_flag = 1; reset = 0;
//    #2 load_instruction_flag = 0; data_in = 8'b01000000; execute_instruction_flag = 1; reset = 0;
//    #2 load_instruction_flag = 0; data_in = 8'b01000000; execute_instruction_flag = 1; reset = 0;
//    #2 load_instruction_flag = 0; data_in = 8'b01000000; execute_instruction_flag = 1; 
//    #2 load_instruction_flag = 0; data_in = 8'b01000000; execute_instruction_flag = 1; 
//    #2 load_instruction_flag = 0; data_in = 8'b01000000; execute_instruction_flag = 1; 
//    #2 load_instruction_flag = 0; data_in = 8'b01000000; execute_instruction_flag = 1; 
//    #2 load_instruction_flag = 0; data_in = 8'b01000000; execute_instruction_flag = 1; 
//    #2 load_instruction_flag = 0; data_in = 8'b01000000; execute_instruction_flag = 1;
    #50 $stop;
    end
    
    controller #(.WIDTH_REG(8), .OPCODE(3))
    controller (.data_out(data_out), .empty(empty), .stop(stop), .data_in(data_in)
    ,.load_instruction_flag(load_instruction_flag), .execute_instruction_flag(execute_instruction_flag)
    ,.reset(reset), .clk(clk), .clk2(clk2), .memory_test(memory_test), .pc_out_test(pc_out_test),
    .operand_address_test(operand_address_test), .LoadCorO_test(LoadCorO_test), .LorE_test(LorE_test)
    ,.IR_test(IR_test));
    
//    clock_generator #(.bit_width(2), .clk_divided1(1), .clk_divided2(2))
//    clock_generator (.clk1(clk1), .clk2(clk2), .clk(clk), .reset(reset), .stop(stop));
endmodule