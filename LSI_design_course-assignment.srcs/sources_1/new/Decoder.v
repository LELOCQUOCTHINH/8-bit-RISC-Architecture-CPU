`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Le Loc Quoc Thinh
// 
// Create Date: 05/02/2025 01:55:29 PM
// Design Name: Decoder
// Module Name: Decoder
// Project Name: Design a 8-bits RISC architecture CPU
// Target Devices: 
// Tool Versions: 
// Description: Using for decode the instruction into opcode and address
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Decoder
#(parameter WIDTH_ADDRESS_BIT = 5, WIDTH_OPCODE_BIT = 3, WIDTH_REG_BIT = 8)
(
    output [WIDTH_OPCODE_BIT - 1:0] opcode_out,
    output [WIDTH_ADDRESS_BIT - 1:0] address_out,
    input [WIDTH_REG_BIT - 1:0] instruction_in
);
    assign address_out = instruction_in[WIDTH_ADDRESS_BIT - 1 : 0]; //get [4:0]
    assign opcode_out = instruction_in[WIDTH_REG_BIT - 1 : WIDTH_ADDRESS_BIT]; //get {7:5]
    
endmodule
