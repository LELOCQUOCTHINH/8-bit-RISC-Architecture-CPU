`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/14/2024 10:20:40 AM
// Design Name: 
// Module Name: instruction_register
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


module instruction_register #( 
    parameter WIDTH_REG = 8//width of register
    )
    (
    output reg [WIDTH_REG - 1 : 0] data_out,   
    input enable,            
    input rst,             
    input [WIDTH_REG - 1 : 0] data_in
    );

    always @(posedge enable, posedge rst) begin
        if (rst)               
            data_out <= 0;   
        else    
            data_out <= data_in;
    end
endmodule
