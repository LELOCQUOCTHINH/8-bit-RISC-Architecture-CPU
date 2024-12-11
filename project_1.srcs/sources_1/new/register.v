`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/06/2024 08:39:00 PM
// Design Name: 
// Module Name: register
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


module register #( 
    parameter WIDTH_REG = 8//width of register
    )
    (
    output reg [WIDTH_REG - 1 : 0] data_out,   
    input clk,            
    input rst,             
    input load, //enable            
    input [WIDTH_REG - 1 : 0] data_in
    );

    always @(posedge clk, posedge rst) begin
        if (rst)               
            data_out <= 0;   
        else if (load)      
            data_out <= data_in;
    end
endmodule
