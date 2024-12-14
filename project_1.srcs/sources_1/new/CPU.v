`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/07/2024 10:35:52 AM
// Design Name: 
// Module Name: controller
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


module CPU #(parameter WIDTH_REG = 8, //width of register
    OPCODE = 3 //width of opcode
    ,clock_frequency = 125 * 10**6 //frequency for clk divided
    )(
//        output wire [WIDTH_REG : 0] data_out, //output of alu result
//        output wire [WIDTH_REG - 1 : 0] memory_test,
//        output wire [2 : 0] opcode_test,
//        output wire [5 : 0] instr_address_test,
        output wire [4 : 0] pc_out_test,
        output wire is_zero_test,
//        output wire LorE_test, LoadCorO_test, //load command or execute and load command or operator
        output wire clk1_test, clk2_test,
//        output wire clk_divided_test,
        output wire stop,
//        output wire clk_test,
        input [WIDTH_REG - 1 : 0] data_in,
        input load_instruction_flag, //indicate phase load instruction
        input execute_instruction_flag, //indicate phase execute instruction
        input reset, //be used for init
        input clk
    );
    /* -------------------------------------------------- start local parameter -------------------------*/
    
    localparam WIDTH_ADDRESS_BIT = WIDTH_REG - OPCODE; //width of bit address
    localparam deep = 2**WIDTH_ADDRESS_BIT; //total elements in memory
    
    /* --------------------------------------------------- end local parameter -------------------------*/
    
    wire [WIDTH_ADDRESS_BIT - 1 : 0] address; //address be used for memory
    wire [WIDTH_ADDRESS_BIT : 0] instr_address; //address for load instruction
    wire [WIDTH_ADDRESS_BIT - 1: 0] operand_address; //address for execute instruction
    wire select; //select between load instructions (0) and execute them (1)
    wire load_or_execute_instrc; //1 is enable instruction register load, 0 is execute instrc
    wire load_instruct_or_operand; //indicate memory be loading instruction or operand to execute
    //1 for ALU be running, 0 for memory
    wire [WIDTH_REG - 1 : 0] instruction_register;
    wire [OPCODE - 1 : 0] opcode;
    wire [WIDTH_ADDRESS_BIT - 1 : 0] address_decoded;//address after decoded
    wire [WIDTH_ADDRESS_BIT : 0] pc_out;//address for next instruct
    wire skip; //for skip command 
    wire jump; //for jump command
    wire enable_PC; //enable increase program counter
    wire [WIDTH_REG - 1 : 0] memory_out;
    wire read_write_memory;
    wire enable_memory;
    wire [WIDTH_REG - 1 : 0] in_memory;
    wire [WIDTH_REG - 1 : 0] ALU_out;  
    wire [WIDTH_REG - 1 : 0] accumulator;
    wire enable_load_acc;
    wire is_zero;
    wire enable_ALU;
    
/************************INSTRUCTION REGISTER*******************************/         
     wire enable_load_IR; //instruction register
     instruction_register #(.WIDTH_REG(WIDTH_REG))
     Instruction_register(.data_out(instruction_register), .enable(enable_load_IR),
     .rst(reset), .data_in(memory_out)
     ); //clk and load same because of easy to control
/************************INSTRUCTION REGISTER*******************************/

/************************CLOCK DIVIDED*******************************/
clock_divided #(.clock_frequency(clock_frequency))
clock_divided (.clk_divided(clk_divided),.clk(clk), .stop(stop), .reset(reset));
/************************CLOCK DIVIDED*******************************/

/************************CLOCK GENERATOR*******************************/
clock_generator clk_gene(.clk1(clk1), .clk2(clk2), .clk_in(clk_divided),
                            .reset(reset), .stop(stop));
/************************CLOCK GENERATOR*******************************/

/*******************************ADD_MUX*******************************/
address_mux_trang #(.WIDTH_ADDRESS_BIT(WIDTH_ADDRESS_BIT))
add_mux (.address_out(address),
        .instr_address(instr_address[WIDTH_ADDRESS_BIT - 1 : 0]),
        .operand_address(operand_address), .select(select));
/*******************************ADD_MUX*******************************/    

/************************DECODER*******************************/
Decoder #(.WIDTH_REG(WIDTH_REG), .OPCODE(OPCODE))
    decoder (.opcode_out(opcode), .address_out(address_decoded),
    .instruction_in(instruction_register));
/************************DECODER*******************************/

/************************program_counter*******************************/
program_counter #(.WIDTH_ADDRESS_BIT(WIDTH_ADDRESS_BIT))
PC (.pc_out(pc_out), .clk(clk2), .reset(reset),
    .enable(enable_PC), .skip(skip), .jump(jump),
                 .jump_address(address_decoded));
/************************program_counter*******************************/

/*******************************MEMORY*******************************/
memory_trang #(.WIDTH_REG(WIDTH_REG), .WIDTH_ADDRESS(WIDTH_ADDRESS_BIT))
 memory(.Data_Out(memory_out), .instr_address(instr_address),
 .clk(clk2), .enable(enable_memory), .rst(reset), .read_write(read_write_memory),
 .address(address), .Data_in(in_memory),
 .load_instruction_flag(load_instruction_flag)); 
/********************************MEMORY*******************************/ 

/*******************************ACCUMULATOR*******************************/
register #(.WIDTH_REG(WIDTH_REG))
 Accumulator(.data_out(accumulator), .load(enable_load_acc),
 .rst(reset), .clk(clk2), .data_in(ALU_out)
 );
/*******************************ACCUMULATOR*******************************/

/*******************************ALU*******************************/
ALU_real #(.width_bit_opcode(OPCODE), .width_bit_reg(WIDTH_REG))
     ALU(.ALU_out(ALU_out), .is_zero(is_zero),
     .opcode(opcode), .address(address), .clk(clk1), .reset(reset),
     .enable(enable_ALU), .in_A(accumulator), .in_B(memory_out));
/*******************************ALU*******************************/

/*******************************CONTROLLER*******************************/
    controller #(.OPCODE(OPCODE), .WIDTH_REG(WIDTH_REG))
    controller (.operand_address(operand_address), .select(select)
    , .load_or_execute_instrc(load_or_execute_instrc)
    ,.load_instruct_or_operand(load_instruct_or_operand)
    ,.skip(skip), .jump(jump), .enable_PC(enable_PC)
    ,.read_write_memory(read_write_memory), .enable_memory(enable_memory)
    ,.in_memory(in_memory), .enable_load_acc(enable_load_acc)
    ,.enable_ALU(enable_ALU), .enable_load_IR(enable_load_IR)
    ,.stop(stop)
    ,.is_zero(is_zero), .accumulator(accumulator), .data_in(data_in)
    ,.pc_out(pc_out), .opcode(opcode), .address_decoded(address_decoded)
    ,.instr_address(instr_address), .load_instruction_flag(load_instruction_flag)
    ,.execute_instruction_flag(execute_instruction_flag), .reset(reset)
    ,.clk(clk1), .clk2(clk2));
/*******************************CONTROLLER*******************************/
     
    assign clk2_test = clk2;
    assign clk1_test = clk1;     
    assign pc_out_test = pc_out;
    assign is_zero_test = is_zero;
//    assign data_out[WIDTH_REG - 1 : 0] = ALU_out;
//    assign data_out [WIDTH_REG] = is_zero;
//    assign clk_test = clk;    
    
//    assign memory_test = memory_out;    
//    assign opcode_test = opcode;
//    assign LorE_test = load_or_execute_instrc;
//    assign LoadCorO_test = load_instruct_or_operand;
//    assign instr_address_test = instr_address;
    
//    assign clk_divided_test = clk_divided;
    
endmodule
