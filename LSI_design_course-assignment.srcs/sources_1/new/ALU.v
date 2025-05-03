`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Le Loc Quoc Thinh
// 
// Create Date: 05/01/2025 06:08:06 PM
// Design Name: ALU
// Module Name: ALU
// Project Name: Design a 8-bits RISC architecture CPU
// Target Devices: 
// Tool Versions: 
// Description: 
// The Arithmetic Logic Unit of the CPU
//
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module ALU
#(parameter WIDTH_ADDRESS_BIT = 5, WIDTH_REG_BIT = 8, WIDTH_OPCODE_BIT = 3)
(
    output reg [WIDTH_REG_BIT - 1:0] ALU_out,
    output is_zero,
    input [WIDTH_REG_BIT - 1:0] inA,
    input [WIDTH_REG_BIT - 1:0] inB,
    input [WIDTH_OPCODE_BIT - 1:0] opcode,
    input clk
    , input rst
);

 /* -------------------------------------------------- start local parameter -------------------------*/
    localparam HLT = 3'b000;
    localparam SKZ = 3'b001;
    localparam ADD = 3'b010;
    localparam AND = 3'b011;
    localparam XOR = 3'b100;
    localparam LDA = 3'b101;
    localparam STO = 3'b110;
    localparam JMP = 3'b111;
/* --------------------------------------------------- end local parameter -------------------------*/
    
    assign is_zero = ~|inA;
    always@(posedge clk)
    begin
    if(rst) //rst active high
        ALU_out <= 0;
        
//    else if(enable == 1'b1) //enable active
//        begin
            case(opcode)
                HLT:
                begin
                    ALU_out <= inA; //HALT command, output = accumulator
                end
                SKZ:  
                begin
                    ALU_out <= inA; //SKIP command, output = accumulator
                end
                ADD:
                begin
                    ALU_out <= inA + inB; //add bit-wise
                end
                AND:
                begin
                    ALU_out <= inA & inB; //and bit-wise
                end
                XOR:
                begin
                    ALU_out <= inA ^ inB; //xor bit-wise
                end
                LDA: 
                begin
                    ALU_out <= inB; //LOAD command, output = operand B
                end
                STO: 
                begin
                    ALU_out <= inA; //STORE command, output = accumulator
                end
                JMP:
                begin
                    ALU_out <= inA; //JUMP command, output = accumulator
                end
//                not infer the latch because edge sensitive            
            endcase
//        end //end of if(enable == 1'b1)
    end //end of always@(posedge clk)
endmodule
