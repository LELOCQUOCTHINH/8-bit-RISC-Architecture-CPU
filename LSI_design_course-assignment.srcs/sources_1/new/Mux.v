`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Le Loc Quoc Thinh
// 
// Create Date: 05/01/2025 06:08:06 PM
// Design Name: Multiplexer
// Module Name: Mux
// Project Name: Design a 8-bits RISC architecture CPU
// Target Devices: 
// Tool Versions: 
// Description: 
// The Multiplexer of the CPU
//
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Mux
#(parameter WIDTH_MUX_BIT = 5)
(
output [WIDTH_MUX_BIT-1:0] MUX_out,
input [WIDTH_MUX_BIT-1:0] inA,
input [WIDTH_MUX_BIT-1:0] inB,
input select //select signal   
);

    assign MUX_out = (select) ? inA : inB ; //if select is 1, choose inA. Otherwise, choose inB

endmodule
