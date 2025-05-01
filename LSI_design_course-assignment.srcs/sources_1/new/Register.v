`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Le Loc Quoc Thinh
// 
// Create Date: 05/01/2025 06:10:32 PM
// Design Name: Register
// Module Name: Register
// Project Name: Design a 8-bits RISC architecture CPU
// Target Devices: 
// Tool Versions: 
// Description: 
// the general register of the CPU
//
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Register
#(parameter WIDTH_REG = 8)
(
output reg [WIDTH_REG-1:0] register_out,
input [WIDTH_REG-1:0] register_in,
input clk,
input rst,
input load
);

always@(posedge clk)
begin
    if(rst) //reset high and synchorous
        register_out <= 0;
    else if(load) //load high => assign a value
        register_out <= register_in;
end

endmodule
