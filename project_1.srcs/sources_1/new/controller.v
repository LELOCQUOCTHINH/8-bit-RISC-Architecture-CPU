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


module controller #(parameter WIDTH_REG = 8, //width of register
    OPCODE = 3 //width of opcode
    )(
        output reg [WIDTH_REG - OPCODE - 1: 0] operand_address, //address for execute instruction
        output reg select, //select between load instructions (0) and execute them (1)
        output reg load_or_execute_instrc, //1 is enable instruction register load, 0 is execute instrc
        output reg load_instruct_or_operand, //indicate memory be loading instruction or operand to execute
        //1 for ALU be running, 0 for memory
        output reg skip, //for skip command 
        output reg jump, //for jump command
        output reg enable_PC, //enable increase program counter
        output reg read_write_memory,
        output reg enable_memory,
        output reg [WIDTH_REG - 1 : 0] in_memory,
        output reg enable_load_acc,
        output reg enable_ALU,
        output reg enable_load_IR,
        output reg stop,
        input is_zero,
        input [WIDTH_REG - 1 : 0] accumulator,
        input [WIDTH_REG - 1 : 0] data_in,
        input [WIDTH_REG - OPCODE - 1 : 0] pc_out,//address for next instruct
        input [OPCODE - 1 : 0] opcode,
        input [WIDTH_REG - OPCODE - 1 : 0] address_decoded,//address after decoded
        input [WIDTH_REG - OPCODE : 0] instr_address, //address for load instruction
        input load_instruction_flag, //indicate phase load instruction
        input execute_instruction_flag, //indicate phase execute instruction
        input reset, //be used for init
        input clk, clk2 //clk1 faster clk2
    );
    /* -------------------------------------------------- start local parameter -------------------------*/
    
    localparam WIDTH_ADDRESS_BIT = WIDTH_REG - OPCODE; //width of bit address
    localparam deep = 2**WIDTH_ADDRESS_BIT; //total elements in memory
    localparam HLT = 3'b000;
    localparam SKZ = 3'b001;
    localparam ADD = 3'b010;
    localparam AND = 3'b011;
    localparam XOR = 3'b100;
    localparam LDA = 3'b101;
    localparam STO = 3'b110;
    localparam JMP = 3'b111;
    
    /* --------------------------------------------------- end local parameter -------------------------*/

    always @(posedge clk, posedge reset)
    begin
        if(reset == 1'b1)
        begin
            stop <= 1'b0; //reset stop
            skip <= 1'b0; //reset skip
            jump <= 1'b0; //reset jump
            operand_address <= 0; //reset operand_address
            select <= 1'b1; //select instruction segment
            load_or_execute_instrc <= 1'b1; //choose load command mode
            in_memory <= 0; //input of memory = 0
            enable_memory <= 1'b1; //don't enable to load to memory
            read_write_memory <= 1'b1; //choose read mode in memory because of don't load anything
            enable_PC <= 1'b0;
            enable_load_acc <= 1'b1; //load ALU_out to accumulator
        end
        else if(load_instruction_flag == 1'b1) //load instrct
        begin
            if(instr_address + 1 < 2**WIDTH_ADDRESS_BIT) 
                enable_memory <= 1'b1;
            else  //>= 32 so exceed 5 bit 
                enable_memory <= 1'b0; //not enable manipulate with memory 
            stop <= 1'b0; //reset stop to load command
            enable_load_acc <= 1'b1; //load ALU_out to accumulator
            enable_PC <= 1'b0;
            load_or_execute_instrc <= 1'b1; //choose load command mode
            select <= 1'b0; //choose instr_address in address mux
            in_memory <= data_in; //input of memory = input of user
            read_write_memory <= 1'b0; //choose write mode in memory to load command
        end
        else if(execute_instruction_flag == 1'b1)//execute instrct
        begin
            //load command state
            select <= 1'b1; //choose operand_address in address mux
            enable_load_acc <= 1'b1; //load ALU_out to accumulator
//            if(pc_out >= instr_address)
//            begin
//                stop <= 1'b1; //stop because of empty command to execute 
//                enable_memory <= 1'b0; //not enable to manipulate with memory
//            end
            if(load_or_execute_instrc == 1'b1)
            //load instrc to instruction register and decode
            begin
                enable_memory <= 1'b1; //enable manipulate with memory
                operand_address <= pc_out;
                //operand_address = program_counter to load instruction, afterward decode it
                read_write_memory <= 1'b1; //choose read mode in memory
                load_or_execute_instrc <= 1'b0; //execute instrct
                enable_PC <= 1'b0;
                //not enable program counter load next instruct until command ready to execute
            end //end of if(load_or_execute_instrc == 1'b1)
            else if(load_or_execute_instrc == 1'b0) //executing instrc
            begin
                    enable_memory <= 1'b1; //enable manipulate with memory
                    operand_address <= address_decoded;
                    //choose address in instruction to load data
                    case(opcode)//set up for ALU run
                    HLT:
                    begin
                        stop <= 1'b1; //froce stop
                        skip <= 1'b0;
                        jump <= 1'b0;
                        read_write_memory <= 1'b1;
                    end
                    SKZ:  
     //if 'is_zero' true, we will skip the next instruct
                    begin
                        if(is_zero)
                            skip <= 1'b1;
                        jump <= 1'b0;
                        read_write_memory <= 1'b1;
                    end
                    LDA: 
                    begin
                        read_write_memory <= 1'b1; //enable read from memory
                        skip <= 1'b0;
                        jump <= 1'b0;
                    end
                    STO: 
                    begin
                        read_write_memory <= 1'b0; //enable write to memory
                        in_memory <= accumulator;
                        skip <= 1'b0;
                        jump <= 1'b0;
                    end
                    JMP:
                    begin
                        jump <= 1'b1;
                        skip <= 1'b0;
                        read_write_memory <= 1'b1;
                    end
                    default: 
                    begin
                        skip <= 1'b0;
                        jump <= 1'b0;
                        read_write_memory <= 1'b1; //just enable read with remain cases
                    end
                    //not infer the latch because edge sensitive
                endcase
                load_or_execute_instrc <= 1'b1; //switch state to load next instrct
                enable_PC <= 1'b1;
                //enable to load next Instrct because command will be executed,
                //and if have a SKZ opcode that also will be executed
            end //end of else if(load_or_execute_instrc == 1'b0)
        end //end of else if(execute_instruction_flag == 1'b1)
    end
    
    always @(posedge clk2, posedge reset)
    //be used to memory and program counter to load instrct and load data for ALU
    //and enable ALU to active
    begin
        if(reset == 1'b1)
        begin
            enable_ALU <= 1'b0;
            load_instruct_or_operand <= 1'b1; //run memory to load instruction
            enable_load_IR <= 1'b0; //not load command to Instruction Register
        end
        else if(load_instruction_flag == 1'b1) //load instrct
        begin
            enable_ALU <= 1'b0;
            load_instruct_or_operand <= 1'b1; //run memory to load instruction
            enable_load_IR <= 1'b0; //not load command to Instruction Register
        end
        else if(execute_instruction_flag == 1'b1)//execute instrct
        begin
            if(load_instruct_or_operand == 1'b1) //load instrct from memory
            begin
                enable_ALU <= 1'b0; //turn off ALU because of be loading command
                load_instruct_or_operand <= 1'b0;
                enable_load_IR <= 1'b1;
                //enable to load command to IR because memory has loaded it already
            end
            else if(load_instruct_or_operand == 1'b0) //executing instrc which have been loaded
            begin
                //Alu will be start execute instrcts in next clk1
                enable_ALU <= 1'b1; //turn on ALU ready to execute command
                load_instruct_or_operand <= 1'b1; //enable memory run to load next instrct 
                enable_load_IR <= 1'b0; //not enable to load instrct to IR because memory is loading command               
            end
        end
    end

endmodule
