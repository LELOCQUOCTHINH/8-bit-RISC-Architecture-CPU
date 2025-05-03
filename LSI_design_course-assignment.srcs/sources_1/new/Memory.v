`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Le Loc Quoc Thinh
// 
// Create Date: 05/01/2025 06:08:06 PM
// Design Name: Memory
// Module Name: Memory
// Project Name: Design a 8-bits RISC architecture CPU
// Target Devices: 
// Tool Versions: 
// Description: 
// The memory of the CPU
//
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Memory
#(parameter WIDTH_ADDRESS_BIT = 5, WIDTH_REG_BIT = 8)
(
    output reg [WIDTH_REG_BIT-1:0] DATA_out,
    input [WIDTH_REG_BIT-1:0] DATA_in,
    input [WIDTH_ADDRESS_BIT-1:0] ADDRESS, //address be used to write or read the memory
    input read, //1 for read
    input write, //1 for write
    input rst,
    input clk
);

reg [WIDTH_REG_BIT-1:0] MEMORY [0:(2**WIDTH_ADDRESS_BIT)-1];

always@(posedge clk)
begin
    if(rst)
    begin
            DATA_out <= 0;
            MEMORY [0] <= 8'b111_11110; //  00   BEGIN:   JMP TST_JMP
            MEMORY [1] <= 8'b000_00000; //  01            HLT 
            MEMORY [2] <= 8'b000_00000; //  02            HLT 
            MEMORY [3] <= 8'b101_11010; //  03   JMP_OK:  LDA DATA_1
            MEMORY [4] <= 8'b001_00000; //  04            SKZ
            MEMORY [5] <= 8'b000_00000; //  05            HLT 
            MEMORY [6] <= 8'b101_11011; //  06            LDA DATA_2
            MEMORY [7] <= 8'b001_00000; //  07            SKZ
            MEMORY [8] <= 8'b111_01010; //  08            JMP SKZ_OK
            MEMORY [9] <= 8'b000_00000; //  09            HLT 
            MEMORY [10] <= 8'b110_11100; //  0A 10  SKZ_OK:  STO TEMP 
            MEMORY [11] <= 8'b101_11010; //  0B 11          LDA DATA_1
            MEMORY [12] <= 8'b110_11100; //  0C 12           STO TEMP 
            MEMORY [13] <= 8'b101_11100; //  0D 13           LDA TEMP
            MEMORY [14] <= 8'b001_00000; //  0E 14           SKZ 
            MEMORY [15] <= 8'b000_00000; //  0F 15           HLT 
            MEMORY [16] <= 8'b100_11011; //  10 16           XOR DATA_2
            MEMORY [17] <= 8'b001_00000; //  11 17           SKZ 
            MEMORY [18] <= 8'b111_10100; //  12 18           JMP XOR_OK
            MEMORY [19] <= 8'b000_00000; //  13 19           HLT  
            MEMORY [20] <= 8'b100_11011; //  14 20  XOR_OK:  XOR DATA_2
            MEMORY [21] <= 8'b001_00000; //  15 21           SKZ
            MEMORY [22] <= 8'b000_00000; //  16 22           HLT
            MEMORY [23] <= 8'b000_00000; //  17 23  END:     HLT 
            MEMORY [24] <= 8'b111_00000; //  18 24           JMP BEGIN
            
            MEMORY[26] <= 8'b00000000; //  1A_HEX  26_DEC DATA_1: (operand have value: 0x00)
            MEMORY[27] <= 8'b11111111; //  1B  27 DATA_2:             (value is 0xFF)
            MEMORY[28] <= 8'b10101010; //  1C  28 TEMP:               (init variable has value: 0xAA)
            
            MEMORY[30] <= 8'b111_00011; //  1E 30  TST_JMP: JMP JMP_OK
            MEMORY[31] <= 8'b000_00000; //  1F 31           HLT  
    end
    else if(read) //read high => read
        DATA_out <= MEMORY [ADDRESS];
    else if(write) //write high => write
        MEMORY [ADDRESS] <= DATA_in;
end
endmodule
