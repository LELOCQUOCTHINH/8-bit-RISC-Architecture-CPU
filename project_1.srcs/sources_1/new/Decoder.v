`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/07/2024 10:53:47 AM
// Design Name: 
// Module Name: Decoder
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


module Decoder #( 
    parameter WIDTH_REG = 8,
    parameter OPCODE = 3
)(
//        input clk,
//        input enable,
        input [WIDTH_REG - 1 : 0] instruction_in,
        output wire [WIDTH_REG - OPCODE - 1 : 0] address_out,
        output wire [OPCODE - 1 : 0] opcode_out
    );
        localparam WIDTH_ADDRESS_BIT = WIDTH_REG - OPCODE; //width of bit address
        
//        always@(posedge clk)
//        begin
//            if(enable == 1'b1)
//            begin
            assign address_out = instruction_in[WIDTH_ADDRESS_BIT - 1 : 0]; //get [4:0]
            assign opcode_out = instruction_in[WIDTH_REG - 1 : WIDTH_ADDRESS_BIT]; //get {7:5]
//            end
            //dont infer latch because of clock
//        end
endmodule
