`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/03/2024 09:37:15 PM
// Design Name: 
// Module Name: ALU
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

module ALU #(parameter width_bit_opcode = 2, width_bit_reg = 8
            , max_bit_address = 5, deep = 31)
            (output reg [width_bit_reg:0] ALU_out,
            //'ALU_out' be used assign for 'accumulator register' outside this module
            output wire is_zero, full, empty,
            input [max_bit_address:0] address_read_write
            , input [width_bit_opcode:0] Opcode
            , input clk
            , input write_instruction //just use if opcode = STO or LDA
            , input [width_bit_reg:0] instuction_in //instruction be loaded to memory
            , input read_instruction //use for read instructions after write
            , input [width_bit_reg:0] Accumulator 
            //be used assigned by 'ALU_out' outside this module
            , input reset, stop
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
    localparam clock_divided = 2;
    /* --------------------------------------------------- end local parameter -------------------------*/
    
    assign is_zero = ~|ALU_out; 
    //'nor' of all bitwise of inA to calculate whereas ALU_out = 0?
    
    wire [width_bit_reg:0] inB;
    //read data from 'memory' using 'address input' and save the data to 'inB'
    reg [max_bit_address:0] limit_address_to_load_data; 
    //[deep;limit_address_to_load_data]
    reg write_or_read;
    reg clk_ALU;
    reg [1:0] counter; //use to divided clk by 2
    reg [width_bit_reg:0] instruction_or_data_input;
    reg instruct_or_data; //choose between instruction or data
    
    always @(posedge clk, posedge reset) //use for divide frequent clk_ALU
    begin
        if(reset == 1'b1)
        begin
            clk_ALU <= 0;
            counter <= 0;
        end
        
        else
            counter <= counter + 1;
    end
    
    always @ (counter) //clk_ALU has frequent = 1/clock_divided frequent of clk
    begin
        if(counter == clock_divided)
        begin
            clk_ALU = 1;
            counter = 0;
        end
        
        else
            clk_ALU = 0;
    end
    
    always @(reset, Opcode, address_read_write
            , read_instruction, write_instruction)
    begin
        if(reset == 1'b1)
        begin
            write_or_read = 0;
            instruction_or_data_input = 0;
            instruct_or_data = 0;
        end
        
        else if(write_instruction == 1'b1)
        begin
            instruction_or_data_input = instuction_in; //load instruction to memory
            write_or_read = 1'b1; // choose write
            instruct_or_data = 1'b1; //choose instruct
        end
        
        else if(read_instruction == 1'b1)
        begin
            write_or_read = 1'b0; //choose read
            instruct_or_data = 1'b1; //choose instruct
            instruction_or_data_input = Accumulator;
        end
        
        else //interact with data or execute instructions
        begin
            instruction_or_data_input = Accumulator;
            instruct_or_data = 1'b0; //choose data
            case(Opcode)
                    STO: //write value to address
                        write_or_read = 1'b1;
                    
                    default: //read value from address
                        write_or_read = 1'b0;         
            endcase
        end
    end
    
    always @(posedge clk_ALU) 
    begin
    if(read_instruction == 1'b1)
    begin
        ALU_out = inB;
    end
    
    else if(reset == 1'b0) //reset off
    begin
        case(Opcode) //opcode just change if has a signal posedge from clock
//        HLT:
        //    SKZ:  
     //if 'is_zero' true, we will skip assign 'ALU_out' to 'Accumulator' outside this module
            ADD:
                ALU_out <= Accumulator + inB; //add bit-wise
            AND:
                ALU_out <= Accumulator & inB; //and bit-wise
            XOR:
                ALU_out <= Accumulator ^ inB; //xor bit-wise
            LDA: 
//using module 'memory' to load data following address of instruction register 
//from memory to ALU_out after do this execute assign sub_ALU_out to Accumulator outside of this module
                ALU_out <= inB;
            STO: 
            begin end
//                same with LDA but store to the memory
                
//            JMP:
            //not infer the latch because edge sensitive
            
        endcase
       end
    end
    
    Address_Mux 
    #(.deep(deep), .width_bit_reg(width_bit_reg), .max_bit_address(max_bit_address))
    address_mux (.data_out(inB),
    //if read command (case opcode == LDA), data out will assign to inB
    .full(full),
    .empty(empty),
    .dynamic_instruct_segment(limit_address_to_load_data),
    .instruction_or_data_in(instruction_or_data_input),
    //if write command (case opcode = STO), write from accumulator to address
    .address_read_write(address_read_write),
    .clk(clk),
    .instruct_or_data(instruct_or_data), //choose between instruction or data
    .write_or_read(write_or_read), .stop(stop), .reset(reset)
     );

endmodule
