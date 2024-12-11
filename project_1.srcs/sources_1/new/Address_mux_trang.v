`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/03/2024 02:44:03 PM
// Design Name: 
// Module Name: address_mux
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


module address_mux_trang #(
    parameter WIDTH_ADDRESS_BIT = 5  
) (
    input [WIDTH_ADDRESS_BIT-1:0] instr_address, 
    input [WIDTH_ADDRESS_BIT-1:0] operand_address, 
    input select, 
    output [WIDTH_ADDRESS_BIT-1:0] address_out 
);
    assign address_out = (select) ? operand_address:instr_address ;

endmodule
