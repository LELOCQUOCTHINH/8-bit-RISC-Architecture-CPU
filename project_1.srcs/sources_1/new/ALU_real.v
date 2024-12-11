`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/06/2024 09:29:43 PM
// Design Name: 
// Module Name: ALU_real
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


module ALU_real 
    #(parameter width_bit_opcode = 3, width_bit_reg = 8)
    (
        output reg [width_bit_reg - 1 : 0] ALU_out,
        output is_zero,
        input [width_bit_opcode - 1 : 0] opcode,
        input [width_bit_reg - width_bit_opcode - 1 : 0] address,
        input clk,
        input enable,
        input reset,
        input [width_bit_reg - 1 : 0] in_A, in_B
        //in_A is Accumulator
    );
     /* -------------------------------------------------- start local parameter -------------------------*/
    localparam max_bit_address = width_bit_reg - width_bit_opcode;
    localparam deep = 2**max_bit_address;
    localparam HLT = 3'b000;
    localparam SKZ = 3'b001;
    localparam ADD = 3'b010;
    localparam AND = 3'b011;
    localparam XOR = 3'b100;
    localparam LDA = 3'b101;
    localparam STO = 3'b110;
    localparam JMP = 3'b111;
    localparam clock_divided = 2;
    /* --------------------------------------------------- end local parameter -------------------------*/
    
    assign is_zero = ~|in_A;
    always @(posedge clk, posedge reset)
    begin
        if(reset == 1'b1)
            ALU_out <= 0;
        else if(enable == 1'b1)
        begin
            case(opcode)
//            HLT:
//            begin
//            end
//            SKZ:  
//            begin
//            end
            ADD:
            begin
                ALU_out <= in_A + in_B; //add bit-wise
            end
            AND:
            begin
                ALU_out <= in_A & in_B; //and bit-wise
            end
            XOR:
            begin
                ALU_out <= in_A ^ in_B; //xor bit-wise
            end
            LDA: 
            begin
                ALU_out <= in_B;
            end
//            STO: 
//            begin
//            end
//            JMP:
//            begin
//            end
            //not infer the latch because edge sensitive            
            endcase
        end
    end
endmodule
