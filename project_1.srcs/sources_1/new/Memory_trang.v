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
    output reg empty,  
    input clk,        
    input enable,           
    input rst,                   
    input read_write,            
    input [WIDTH_ADDRESS-1:0] address,  
    input [WIDTH_REG-1:0] Data_in                
);

    reg [WIDTH_REG-1:0] memory [0:(2**WIDTH_ADDRESS)-1];
    always @(posedge clk, posedge rst)
    begin
        if (rst == 1'b1)
        begin
            empty <= 1'b1;
            Data_Out <= 0;
        end 
        else if(enable == 1'b1)
        begin
            if (!read_write) //write
            begin
                    memory[address] <= Data_in;
                    empty <= 1'b0;
                    Data_Out <= Data_in;
            end 
            else if (read_write&&!empty) //read when not empty
            begin
                   Data_Out <= memory[address]; 
            end
        end
    end
endmodule