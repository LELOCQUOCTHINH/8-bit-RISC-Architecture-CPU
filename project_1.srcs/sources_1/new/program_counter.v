`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/06/2024 08:39:00 PM
// Design Name: 
// Module Name: program_counter
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


module program_counter#(
    parameter WIDTH_ADDRESS_BIT = 5 
)(
    output reg [WIDTH_ADDRESS_BIT - 1 : 0] pc_out,
    //pc_out must be greater than 1 bit because pc_out can point to address 32 to stop program
    input clk,
    input enable,
    input reset,
    input skip,
    input jump,
    input [WIDTH_ADDRESS_BIT - 1 : 0] jump_address
    );
    always @(posedge clk or posedge reset) begin
        if (reset == 1'b1)
            pc_out <= 0;
        else if(enable == 1'b1)
        begin
            if (jump == 1'b1) //more process
            begin
                pc_out <= jump_address;
            end
            else if (skip == 1'b1)
                pc_out <= pc_out + 2;
            else
                pc_out <= pc_out + 1; 
        end
    end
endmodule
