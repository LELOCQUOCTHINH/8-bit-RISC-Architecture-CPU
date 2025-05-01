`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Le Loc Quoc Thinh
// 
// Create Date: 05/01/2025 06:08:06 PM
// Design Name: Program Counter
// Module Name: PC
// Project Name: Design a 8-bits RISC architecture CPU
// Target Devices: 
// Tool Versions: 
// Description: 
// The Program counter of the CPU
//
// keywords: rst, clk, load, enable, PC_out, PC_in, WIDTH_ADDRESS_BIT
//
// Remarks:
// - rst is input reset signal
// - clk is input clock signal
// - enable is input enable signal
// - load is input load signal
// - PC_out is output of the program counter
// - PC_in is the input used to assign to PC_out 
// - WIDTH_ADDRESS_BIT is the width of Program Counter
//
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module PC #(parameter WIDTH_ADDRESS_BIT = 5)
( output reg [WIDTH_ADDRESS_BIT-1:0] PC_out, //output of the program counter
input [WIDTH_ADDRESS_BIT-1:0] PC_in, //input assign to program counter
input clk, //clock signal
input rst, //reset signal active high
input load, //load signal be used to indicate that the user wants to assign PC_in to Program counter
input enable //Enable signal enables program counter active
);

always@(posedge clk, posedge rst)
begin
    if(rst) //reset high
        PC_out <= 0;
    else if(enable && load) //enable high and load high => load mode
        PC_out <= PC_in;
    else if(enable && !load) //enable high and low load => normal mode
        PC_out <= PC_out + 1;
end

endmodule
