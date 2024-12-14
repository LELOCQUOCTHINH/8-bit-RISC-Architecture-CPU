`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/03/2024 01:16:43 PM
// Design Name: 
// Module Name: memory
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


module memory_trang#(
    parameter WIDTH_REG = 8,
    parameter WIDTH_ADDRESS = 5 
)(
    output reg [WIDTH_REG-1:0] Data_Out,  
    output reg [WIDTH_ADDRESS : 0] instr_address,
    //used for address to load instruction and also to stop program
//    output reg empty,  
    input clk,        
    input enable,           
    input rst,                   
    input read_write,
    input load_instruction_flag,            
    input [WIDTH_ADDRESS-1:0] address,  
    input [WIDTH_REG-1:0] Data_in                
);

    reg [WIDTH_REG-1:0] memory [0:(2**WIDTH_ADDRESS)-1];
    always @(posedge clk, posedge rst)
    begin
        if (rst == 1'b1)
        begin
//            empty <= 1'b1;
            Data_Out <= 0;
            instr_address <= 0;
            memory [0] <= 8'b111_11110; //  00   BEGIN:   JMP TST_JMP
            memory [1] <= 8'b000_00000; //  01            HLT 
            memory [2] <= 8'b000_00000; //  02            HLT 
            memory [3] <= 8'b101_11010; //  03   JMP_OK:  LDA DATA_1
            memory [4] <= 8'b001_00000; //  04            SKZ
            memory [5] <= 8'b000_00000; //  05            HLT 
            memory [6] <= 8'b101_11011; //  06            LDA DATA_2
            memory [7] <= 8'b001_00000; //  07            SKZ
            memory [8] <= 8'b111_01010; //  08            JMP SKZ_OK
            memory [9] <= 8'b000_00000; //  09            HLT 
            memory [10] <= 8'b110_11100; //  0A 10  SKZ_OK:  STO TEMP 
            memory [11] <= 8'b101_11010; //  0B 11          LDA DATA_1
            memory [12] <= 8'b110_11100; //  0C 12           STO TEMP 
            memory [13] <= 8'b101_11100; //  0D 13           LDA TEMP
            memory [14] <= 8'b001_00000; //  0E 14           SKZ 
            memory [15] <= 8'b000_00000; //  0F 15           HLT 
            memory [16] <= 8'b100_11011; //  10 16           XOR DATA_2
            memory [17] <= 8'b001_00000; //  11 17           SKZ 
            memory [18] <= 8'b111_10100; //  12 18           JMP XOR_OK
            memory [19] <= 8'b000_00000; //  13 19           HLT  
            memory [20] <= 8'b100_11011; //  14 20  XOR_OK:  XOR DATA_2
            memory [21] <= 8'b001_00000; //  15 21           SKZ
            memory [22] <= 8'b000_00000; //  16 22           HLT
            memory [23] <= 8'b000_00000; //  17 23  END:     HLT 
            memory [24] <= 8'b111_00000; //  18 24           JMP BEGIN
            
            memory[26] <= 8'b00000000; //  1A_HEX  26_DEC DATA_1: (operand have value: 0x00)
            memory[27] <= 8'b11111111; //  1B  27 DATA_2:             (value is 0xFF)
             memory[28] <= 8'b10101010; //  1C  28 TEMP:               (init variable has value: 0xAA)
             
               memory[30] <= 8'b111_00011; //  1E 30  TST_JMP: JMP JMP_OK
                memory[31] <= 8'b000_00000; //  1F 31           HLT  
//                empty <= 1'b0;
        end 
        else if(enable == 1'b1)
        begin
            if (!read_write) //write
            begin
                    memory[address] <= Data_in;
                    Data_Out <= Data_in;
                    if(load_instruction_flag)
                        instr_address <= instr_address + 1;
            end 
            else if (read_write) //read 
            begin
                   Data_Out <= memory[address]; 
            end
        end
    end
endmodule