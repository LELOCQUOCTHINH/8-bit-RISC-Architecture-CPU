`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Le Loc Quoc Thinh
// 
// Create Date: 05/03/2025 02:06:58 PM
// Design Name: RISC-CPU
// Module Name: RISC-CPU
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: The RISC-module which include the ALU, controller, decoder, registers, address mux, etc
// 
// Dependencies: 
// Controller.v
// ALU.v
// Memory.v
// Mux.v
// PC.v
// Register.v
// Decoder.v
// clk_divider.v

// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module RISC_CPU
#(
    parameter WIDTH_ADDRESS_BIT = 5, WIDTH_REG_BIT = 8, WIDTH_OPCODE_BIT = 3, CONTROLLER_PHASE_BIT = 3
//    , parameter CLOCK_FREQUENCY = 125 * 10**6 //frequency for clk divider
//    , parameter WANTED_CLOCK = 125 * 10**6
 )
(
    output [WIDTH_REG_BIT - 1:0] accumulator_register,
    output is_zero,
    input clk, rst
);
//    wire divided_clk;
    wire halt; //halt signal
    wire sel; //selected signal tranfer to the address mux
    //(1 for instruction, 0 for operand)
    wire rd; //memory read enable signal
    wire ld_ir; //Load instruction register signal (loads the fetched instruction into the IR).
    wire inc_pc; //Increments the Program Counter (PC) to point to the next instruction.
    wire ld_ac; //Load accumulator signal (loads data into the Accumulator register).
    wire ld_pc; //Load Program Counter signal (loads a new address into the PC, e.g., for JMP)
    wire wr; //Memory write enable signal.
    wire data_e; //Data enable signal (enables data transfer, e.g., for STO instruction).
    wire [WIDTH_OPCODE_BIT - 1:0] opcode;
    wire [WIDTH_ADDRESS_BIT - 1:0] program_counter; //the address for fetching the instructions
    wire [WIDTH_ADDRESS_BIT - 1:0] operand_address; //the address using for execute the instruction
    wire [WIDTH_ADDRESS_BIT - 1:0] selected_address; //the address transfer to memory after it be selected by address mux
//    wire [WIDTH_REG_BIT - 1:0] memory_in; //input for store to the memory
    wire [WIDTH_REG_BIT - 1:0] memory_out; //output of the memory
    wire [WIDTH_REG_BIT - 1:0] ALU_out;
    wire [WIDTH_REG_BIT - 1:0] instruction_register;
    
    
    /*******************************CONTROLLER*******************************/
    Controller #(.WIDTH_OPCODE_BIT(WIDTH_OPCODE_BIT))
    controller(
                .sel(sel), .rd(rd), .ld_ir(ld_ir), .halt(halt), .inc_pc(inc_pc),
                .ld_ac(ld_ac), .ld_pc(ld_pc), .wr(wr), .data_e(data_e),
                .opcode(opcode),
                .is_zero(is_zero),
                .clk(clk),
                .rst(rst)
                );
    /*******************************CONTROLLER*******************************/
    
    /*******************************ADD_MUX*******************************/
    Mux #(.WIDTH_MUX_BIT(WIDTH_ADDRESS_BIT))
    address_mux (
                .MUX_out(selected_address),
                .inA(program_counter),
                .inB(operand_address),
                .select(sel)
                );
   /*******************************ADD_MUX*******************************/          
    
    /*******************************MEMORY*******************************/            
    Memory #(.WIDTH_ADDRESS_BIT(WIDTH_ADDRESS_BIT), .WIDTH_REG_BIT(WIDTH_REG_BIT))
    memory (
            .DATA_out(memory_out),
            .DATA_in(accumulator_register),
            .ADDRESS(selected_address),
            .read(rd),
            .write(wr),
            .rst(rst),
            .clk(clk)
            );
     /********************************MEMORY*******************************/
            
    /************************INSTRUCTION REGISTER*******************************/           
    Register #(.WIDTH_REG_BIT(WIDTH_REG_BIT))
    Instruction_Register( //instruction register module
        .register_out(instruction_register),
        .register_in(memory_out), //load the instruction into IR
        .load(ld_ir), //enable signal for load new instruction into IR
        .clk(clk),
        .rst(rst)
       );
   /************************INSTRUCTION REGISTER*******************************/
   
   /************************DECODER*******************************/    
   Decoder #(.WIDTH_ADDRESS_BIT(WIDTH_ADDRESS_BIT), .WIDTH_OPCODE_BIT(WIDTH_OPCODE_BIT), .WIDTH_REG_BIT(WIDTH_REG_BIT))
   decoder( //decoder module
        .opcode_out(opcode),
        .address_out(operand_address),
        .instruction_in(instruction_register)
   );
   /************************DECODER*******************************/
   
   /************************program_counter*******************************/
   PC #(.WIDTH_ADDRESS_BIT(WIDTH_ADDRESS_BIT))
   Program_Counter( //program counter module
        .PC_out(program_counter),
        .PC_in(operand_address), //for jump command
        .load(ld_pc),
        .increase(inc_pc),
        .clk(clk),
        .rst(rst),
        .stop(halt)
   );
   /************************program_counter*******************************/
   
   /*******************************ALU*******************************/
   ALU #(.WIDTH_ADDRESS_BIT(WIDTH_ADDRESS_BIT), .WIDTH_OPCODE_BIT(WIDTH_OPCODE_BIT), .WIDTH_REG_BIT(WIDTH_REG_BIT))
   alu ( //the arithmetic logic unit module
        .ALU_out(ALU_out),
        .is_zero(is_zero),
        .inA(accumulator_register),
        .inB(memory_out),     
        .opcode(opcode),
        .clk(clk)
    );
    /*******************************ALU*******************************/

    /*******************************ACCUMULATOR*******************************/
    Register #(.WIDTH_REG_BIT(WIDTH_REG_BIT))
    Accumulator_Register(//accumulator register module
        .register_out(accumulator_register),
        .register_in(ALU_out),
        .load(ld_ac),
        .rst(rst),
        .clk(clk)
    );   
    /*******************************ACCUMULATOR*******************************/
endmodule
