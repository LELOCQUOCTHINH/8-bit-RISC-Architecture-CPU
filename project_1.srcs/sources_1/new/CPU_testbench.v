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
    wire [5:0] pc_out_test;
    wire [2:0] opcode_test;
    wire LoadCorO_test, LorE_test;
    wire clk1_test, clk2_test, clk_divided ;
    wire empty;
    wire stop;
    always #0.5 clk = ~clk;
    
    initial
    begin
    $monitor("timer = %0t, clk_divided = %1b, clk1 = %1b, clk2 = %1b, data_in = %8b, execute_instruction_flag = %1b, stop = %3d, pc_out = %6b, LorEinstr = %1b, LoIorO = %1b, instr_address_test = %6b, opcode_test = %3b, memory_out = %8b, data_out = %9b\n",  
    $time, clk_divided, clk1_test, clk2_test, data_in, execute_instruction_flag, stop, pc_out_test, LorE_test, LoadCorO_test,instr_address_test, opcode_test, memory_test, data_out);
    end
    
    initial
    begin
//    reset = 0;
//    #0.1 
    reset = 1; load_instruction_flag = 1; execute_instruction_flag = 0; 
    #1 clk = 0; data_in = 8'b111_11110; reset = 0; //  00   BEGIN:   JMP TST_JMP
    #3 data_in = 8'b000_00000; //  01            HLT 
    #3 data_in = 8'b000_00000; //  02            HLT  
    #3 data_in = 8'b101_11010; //  03   JMP_OK:  LDA DATA_1
    #3 data_in = 8'b001_00000; //  04            SKZ
    #3 data_in = 8'b000_00000; //  05            HLT 
    #3 data_in = 8'b101_11011; //  06            LDA DATA_2
    #3 data_in = 8'b001_00000; //  07            SKZ
    #3 data_in = 8'b111_01010; //  08            JMP SKZ_OK
    #3 data_in = 8'b000_00000; //  09            HLT 
    #3 data_in = 8'b110_11100; //  0A   SKZ_OK:  STO TEMP 
    #3 data_in = 8'b101_11010; //  0B            LDA DATA_1
    #3 data_in = 8'b110_11100; //  0C            STO TEMP 
    #3 data_in = 8'b101_11100; //  0D            LDA TEMP
    #3 data_in = 8'b001_00000; //  0E            SKZ  
    #3 data_in = 8'b000_00000; //  0F            HLT 
    #3 data_in = 8'b100_11011; //  10            XOR DATA_2
    #3 data_in = 8'b001_00000; //  11            SKZ 
    #3 data_in = 8'b111_10100; //  12            JMP XOR_OK
    #3 data_in = 8'b000_00000; //  13            HLT  
    #3 data_in = 8'b100_11011; //  14   XOR_OK:  XOR DATA_2
    #3 data_in = 8'b001_00000; //  15            SKZ
    #3 data_in = 8'b000_00000; //  16            HLT
    #3 data_in = 8'b000_00000; //  17   END:     HLT 
    #3 data_in = 8'b111_00000; //  18            JMP BEGIN  

    #3 data_in = 8'b00000000; //  1A   DATA_1:             (giá tr? h?ng 0x00)
    #3 data_in = 8'b11111111; //  1B   DATA_2:             (giá tr? h?ng 0xFF)
    #3 data_in = 8'b10101010; //  1C   TEMP:               (bi?n kh?i t?o v?i giá tr? 0xAA)
    
    #3 data_in = 8'b111_00011; //  1E   TST_JMP: JMP JMP_OK
    #3 data_in = 8'b000_00000; //  1F            HLT  
    
    #3 load_instruction_flag = 0; execute_instruction_flag = 1;

    #300 $stop;
    end
    
    CPU #(.WIDTH_REG(8), .OPCODE(3), .clock_frequency(1))
    CPU_tb (.data_out(data_out), .empty(empty), .stop(stop), .data_in(data_in)
    ,.load_instruction_flag(load_instruction_flag), .execute_instruction_flag(execute_instruction_flag)
    ,.reset(reset), .clk(clk), .memory_test(memory_test), .pc_out_test(pc_out_test),
    .opcode_test(opcode_test), .LoadCorO_test(LoadCorO_test), .LorE_test(LorE_test)
    ,.instr_address_test(instr_address_test), .clk1_test(clk1_test), .clk2_test(clk2_test)
    ,.clk_divided_test(clk_divided)
    );
   
endmodule