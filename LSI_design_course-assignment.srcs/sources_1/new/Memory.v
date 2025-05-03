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
    input [WIDTH_ADDRESS_BIT-1:0] ADDRESS,
    input read_write, //1 for read, 0 for write
    input clk
);

reg [WIDTH_REG_BIT-1:0] MEMORY [0:(2**WIDTH_ADDRESS_BIT)-1];

always@(posedge clk)
begin
    if(read_write) //read_write high => read
        DATA_out <= MEMORY [ADDRESS];
    else //read_write low => write
        MEMORY [ADDRESS] <= DATA_in;
end
endmodule
