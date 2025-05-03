`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Le Loc Quoc Thinh
// 
// Create Date: 05/01/2025 06:08:06 PM
// Design Name: Controller
// Module Name: Controller
// Project Name: Design a 8-bits RISC architecture CPU
// Target Devices: 
// Tool Versions: 
// Description: 
// Using for controlling the activity of the CPU
//
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Controller
#(parameter CONTROLLER_PHASE_BIT = 3, WIDTH_ADDRESS_BIT = 5)
(
    output reg sel, //Select signal for the Address Mux (chooses between instruction or operand address).
    output reg rd, //Memory read enable signal.
    output reg ld_ir, //Load instruction register signal (loads the fetched instruction into the IR).
    output reg halt, //Halts CPU operation (used for the HLT instruction).
    output reg inc_pc, //Increments the Program Counter (PC) to point to the next instruction.
    output reg ld_ac, //Load accumulator signal (loads data into the Accumulator register).
    output reg ld_pc, //Load Program Counter signal (loads a new address into the PC, e.g., for JMP).
    output reg wr, //Memory write enable signal.
    output reg data_e, //Data enable signal (enables data transfer, e.g., for STO instruction).
    input [CONTROLLER_PHASE_BIT - 1:0] opcode,
    input is_zero, //used to skip command
//    input BOOT_MODE, 
    input clk, rst
);

/* -------------------------------------------------- start local parameter -------------------------*/
//this is local parameters which stand for stages of the controller
    localparam INST_ADDR = 3'b000; //Sets up the address for fetching the instruction.
    localparam INST_FETCH = 3'b001; //Reads the instruction from memory.
    localparam INST_LOAD = 3'b010; //Loads the fetched instruction into the Instruction Register (IR).
    localparam IDLE = 3'b011; //Idle state, possibly for synchronization or decoding.
    localparam OP_ADDR = 3'b100; //Sets up the address for fetching the operand (from instruction or memory).
    localparam OP_FETCH = 3'b101; //Reads the operand data from memory.
    localparam ALU_OP = 3'b110; //Performs the ALU operation based on the opcode (e.g., ADD, AND, XOR, LDA).
    localparam STORE = 3'b111; //Stores the result (e.g., to memory for STO or Accumulator for other ops).
/* --------------------------------------------------- end local parameter -------------------------*/

reg [CONTROLLER_PHASE_BIT - 1:0] controller_phase;

always@(posedge clk)
begin
    if(rst) //rst active high
    begin
       controller_phase <= INST_ADDR;
       halt <= 0;
    end
    
//    else if(BOOT_MODE) //BOOT_MODE active high
//    begin
    
//    end
    
    else if(!halt)
    begin
        controller_phase <= controller_phase + 1;
            
        case (controller_phase)
            INST_ADDR: //choose instruction address to fetch instructions
            begin
                sel <= 1; //select = 1 indicate that address_mux output is the value of the program counter
                rd <= 0;
                ld_ir <= 0;
                halt <= 0;
                inc_pc <= 0;
                ld_ac <= 0;
                ld_pc <= 0;
                wr <= 0;
                data_e <= 0;
            end
            
            INST_FETCH: //fetch the instruction to the memory output
            begin
                sel <= 1;
                rd <= 1; //enable to read the memory
                ld_ir <= 0;
                halt <= 0;
                inc_pc <= 0;
                ld_ac <= 0;
                ld_pc <= 0;
                wr <= 0;
                data_e <= 0;
            end
            
            INST_LOAD: //load the instruction into the instruction register
            begin
                sel <= 1;
                rd <= 1;
                ld_ir <= 1; //enable the instruction register load a new command
                halt <= 0;
                inc_pc <= 0; 
                ld_ac <= 0;
                ld_pc <= 0;
                wr <= 0;
                data_e <= 0;
            end
            
            IDLE: //idle to synchorous and decode the instruction into opcode & operand
            begin
                sel <= 1;
                rd <= 1;
                ld_ir <= 1;
                halt <= 0;
                inc_pc <= 0; 
                ld_ac <= 0;
                ld_pc <= 0;
                wr <= 0;
                data_e <= 0;
            end
            
            OP_ADDR: //transfer the operand address to memory
            begin
                sel <= 0;
                rd <= 0;
                ld_ir <= 0; //ld_ir return to 0, because we not permit the instruction register change while the instruction be executed
                halt <= ~|opcode;
                //if opcode == 3'b000 (halt command), halt will equal to 1 => using the reduction nor operator
                inc_pc <= 1; //enable the program counter increase to one
                ld_ac <= 0;
                ld_pc <= 0;
                wr <= 0;
                data_e <= 0;
            end
            
            OP_FETCH: //fetch the operand from memory into inB register if necessary
            begin
                sel <= 0;
                rd <= opcode[2] ^ opcode[1];
                //if opcode == 3'b011 or 3'b010 or 3'b100 or 3'b101 (respectively for ADD, AND, XOR, LDA commands),
                //rd will equal to 1 => using k-map to reduce gates, we get xor
                ld_ir <= 0; 
                halt <= 0; //
                inc_pc <= 0;
                ld_ac <= 0;
                ld_pc <= 0;
                wr <= 0;
                data_e <= 0;
            end
            
            ALU_OP: //execute the ALU operation
            begin
                sel <= 0;
                rd <= opcode[2] ^ opcode[1];
                //if opcode == 3'b011 or 3'b010 or 3'b100 or 3'b101 (respectively for ADD, AND, XOR, LDA commands),
                //rd will equal to 1 => using k-map to reduce gates, we get xor
                ld_ir <= 0;
                halt <= 0;
                inc_pc <= (opcode == 1) && is_zero;
                //if command is 'skip' (opcode == 3'b001) and the accumulator currently is zero, we will skip the next command by increment pc to 1 
                ld_ac <= 0;
                ld_pc <= &opcode;
                //if opcode == 3'b111 (jump command), ld_pc = 1 to enable load a value to program counter
                wr <= 0;
                data_e <= (opcode == 3'b110);
                //if opcode == 3'b110 (store command), data_e = 1 to enable fetch the accumulator value into memory_in register, ready to store
            end
            
            STORE: //write into the memory if necessary or load into accumulator register
            begin
                sel <= 0;
                rd <= opcode[2] ^ opcode[1];
                //if opcode == 3'b011 or 3'b010 or 3'b100 or 3'b101 (respectively for ADD, AND, XOR, LDA commands),
                //rd will equal to 1 => using k-map to reduce gates, we get xor
                ld_ir <= 0;
                halt <= 0;
                inc_pc <= 0;
                ld_ac <= opcode[2] ^ opcode[1];
                //if opcode == 3'b011 or 3'b010 or 3'b100 or 3'b101 (respectively for ADD, AND, XOR, LDA commands),
                //we will load the ALU output into the accumulator
                ld_pc <= &opcode;
                //if opcode == 3'b111 (jump command), ld_pc = 1 to enable load a value to program counter
                wr <= (opcode == 3'b110);
                //enable write the memory_in into the memory module
                data_e <= (opcode == 3'b110);
                //if opcode == 3'b110 (store command), data_e = 1 to enable fetch the accumulator value into memory_in register, ready to store
            end
        endcase
    end
end

endmodule
