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
    reg clk, load_instruction_flag, execute_instruction_flag, reset = 0; 
    reg [7:0] data_in;
    wire [8:0] data_out;
    wire [7:0] memory_test;
    wire [5:0] instr_address_test;
    wire [4:0] pc_out_test;
    wire [2:0] opcode_test;
    wire LoadCorO_test, LorE_test;
    wire clk1_test, clk2_test, clk_divided ;
//    wire empty;
    wire stop;
    always #0.5 clk = ~clk;
    
    initial
    begin
    $monitor("timer = %0t, clk_divided = %1b, clk1 = %1b, clk2 = %1b, execute_instruction_flag = %1b, stop = %1b, pc_out = %5b, LorEinstr = %1b, LoIorO = %1b, opcode_test = %3b, memory_out = %8b, data_out = %9b\n",  
    $time, clk_divided, clk1_test, clk2_test, execute_instruction_flag, stop, pc_out_test, LorE_test, LoadCorO_test, opcode_test, memory_test, data_out);
    end
    
    initial
    begin
    reset = 0;
    #0.1 
    reset = 1; load_instruction_flag = 0; execute_instruction_flag = 1; clk = 0;
    #1 reset = 0; //  00   BEGIN:   JMP TST_JMP
     execute_instruction_flag = 1;

    #500 $stop;
    end
    
    CPU #(.WIDTH_REG(8), .OPCODE(3), .clock_frequency(0))
    CPU_tb (.data_out(data_out), .stop(stop), .data_in(data_in)
    ,.load_instruction_flag(load_instruction_flag), .execute_instruction_flag(execute_instruction_flag)
    ,.reset(reset), .clk(clk), .memory_test(memory_test), .pc_out_test(pc_out_test),
    .opcode_test(opcode_test), .LoadCorO_test(LoadCorO_test), .LorE_test(LorE_test)
    ,.instr_address_test(instr_address_test), .clk1_test(clk1_test), .clk2_test(clk2_test)
    ,.clk_divided_test(clk_divided)
    );
   
endmodule