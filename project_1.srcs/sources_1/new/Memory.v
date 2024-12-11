`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/04/2024 07:52:25 PM
// Design Name: 
// Module Name: Memory
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

module test_bench_mem #(parameter deep = 31, width_bit_reg = 7, max_bit_address = 4)();
    reg clk, instruct_or_data, write_or_read, stop, reset; 
    reg [width_bit_reg:0] instruction_or_data_in;
    reg [max_bit_address:0] address_read_write;
    wire [width_bit_reg:0] data_out;
    wire [max_bit_address:0] dynamic_instruct_segment ;
    wire full, empty;
    always #0.5 clk = ~clk;
    
    initial
    begin
    $monitor("clk = %1d, reset = %1b, full = %1b, empty = %1b, instruction_or_data_in = %3d, instruct_or_data = %1b, write_or_read = %1b, address_read_write = %3d, dynamic_instruct_segment = %2d, data_out = %3d\n",  
    clk, reset, full, empty, instruction_or_data_in, instruct_or_data, write_or_read, address_read_write,dynamic_instruct_segment, data_out);
    end
    
    initial
    begin
    reset = 1;
    #1 clk = 0;  instruct_or_data = 1; instruction_or_data_in = 10; write_or_read=1; stop =0; reset = 0;
    #1 reset = 0; instruct_or_data = 1; instruction_or_data_in = 16; write_or_read = 1;
    #1 instruct_or_data = 1; instruction_or_data_in = 8; write_or_read = 1; reset = 0;
    #1 instruct_or_data = 1; instruction_or_data_in = 92; write_or_read = 1;    reset = 0;
    #1 instruct_or_data = 1; instruction_or_data_in = 31; write_or_read = 1; reset = 0;
    #1 instruct_or_data = 1; instruction_or_data_in = 251; write_or_read = 1; reset = 0;
    #1 instruct_or_data = 1; instruction_or_data_in = 113; write_or_read = 1;reset = 0;
    #1 instruct_or_data = 1; instruction_or_data_in = 42; write_or_read = 1; reset = 0;
    #1 instruct_or_data = 1; instruction_or_data_in = 0; write_or_read = 0; address_read_write = 0;
    #1 instruct_or_data = 1; instruction_or_data_in = 0; write_or_read = 0; address_read_write = address_read_write + 1;
    #1 instruct_or_data = 1; instruction_or_data_in = 0; write_or_read = 0; address_read_write = address_read_write + 1;
    #1 instruct_or_data = 1; instruction_or_data_in = 0; write_or_read = 0; address_read_write = address_read_write + 1;
    #1 instruct_or_data = 1; instruction_or_data_in = 0; write_or_read = 0; address_read_write = address_read_write + 1;
    #1 instruct_or_data = 0; instruction_or_data_in = 0; write_or_read = 0; address_read_write = address_read_write + 1;
    $stop;
    end
    
    Address_Mux #(.deep(deep), .width_bit_reg(width_bit_reg), .max_bit_address(max_bit_address)) 
    UUT (.data_out(data_out), .full(full), .empty(empty),
        .dynamic_instruct_segment(dynamic_instruct_segment),
        .instruction_or_data_in(instruction_or_data_in),
        .address_read_write(address_read_write),
        .clk(clk), .instruct_or_data(instruct_or_data),
        .write_or_read(write_or_read), .stop(stop), .reset(reset));
endmodule

module Address_Mux #(parameter deep = 31, width_bit_reg = 7, max_bit_address = 4)(
      output wire [width_bit_reg:0] data_out
    , output reg full //indicate full memory
    , output reg empty //indicate empty memory
    , output reg [max_bit_address:0] dynamic_instruct_segment //used to save address of the last instruction to be loaded, just use if load_instruct = 0
    //instruction segment interval in [0 ; dynamic_segment_partition] dynamically
    , input [width_bit_reg:0] instruction_or_data_in //input of data or instruction which we want save to memory
    , input [max_bit_address:0] address_read_write //address to write or read
    , input clk
    , instruct_or_data //1 is load or write instruct, 0 is load or write data
    , input write_or_read //1 enable to write and 0 enable to read just use if load_instruct = 0
    , input stop //use to stop load data
    , input reset //use to reset the memory
    ); 
    
    reg [max_bit_address:0] choose_address_read_write = 0; //choose use address to save instruct or data
    reg [max_bit_address:0] memory_remain = deep + 1; //0 is full, 32 is empty
    
//    reg [max_bit_address:0] dynamic_segment_partition = (deep + 1)/2; //partition memory dynamically to 2 segments
//    reg [max_bit_address:0] dynamic_data_segment = 0; /*memory segment interval in [deep ; dynamic_segment_partition] dynamically
//    (inverse of [dynamic_segment_partition ; deep]) also use for indicate number of data in memory */
//    reg [deep:0] available_data; //indicate data available in each index of memory
//    reg [deep:0] available_instruct; //indicate instruction available in each index of memory
    //recommend load instruction sequentially
    reg stop_clone; //use to avoid the latch (true parameter stop of module 'memory')

//    always @(*)
//    begin
//        memory_remain = deep  - dynamic_instruct_segment;
//        if(memory_remain <= 0)
//        full = 1'b1;
//    end
     
    always @(instruction_or_data_in, 
             address_read_write,
             reset, instruct_or_data, 
             write_or_read, stop
             ) //just execute if reset or load data, instruction
        begin
            if(reset == 1'b1) //if reset on
            begin
                choose_address_read_write = 0;
                memory_remain = deep + 1;
//                dynamic_segment_partition = (deep + 1)/2;
                dynamic_instruct_segment = 0;
//                dynamic_data_segment = 0;
//                available_data = 0;
//                available_instruct = 0;
                full = 1'b0;
                empty = 1'b0;
                stop_clone = 1'b0;
            end // end of if(reset == 1'b1)
            
            else if(stop == 1'b1) // if stop on, assign stop to stop_clone to stop module memory
            stop_clone = stop;
            
            else //otherwise not reset
            begin
                    if(instruct_or_data == 1'b1) //load instruction
                    begin
                    
                        if(write_or_read == 1'b1 && full == 1'b0 ) //write instruction if have't yet full
                        begin
                            stop_clone = 1'b0; //if signal noise we will assign stop = 1 otherwise stop = 0
                            choose_address_read_write = dynamic_instruct_segment; //assign immediately
                            dynamic_instruct_segment = dynamic_instruct_segment + 1; //assign after always block finish
                        end
                        
                        else if(write_or_read == 1'b0 && empty == 1'b0)//read instruction
                        begin
                            stop_clone = 1'b0;
                            if(address_read_write <= dynamic_instruct_segment)
                            //if read instruction,  address need in segment contain instructions and haven't yet empty
                                choose_address_read_write = address_read_write;
                        end
                        
                        else
                        stop_clone = 1'b1; //active stop if has a exception (avoid the latch)
                        
                    end //end if(load_write_instruct_or_data == 1'b1)
                    
                    else if(instruct_or_data == 1'b0)//read or write data
                    begin
                        stop_clone = 1'b0;
                        if(address_read_write > dynamic_instruct_segment && address_read_write <= deep) //if read or write data, address need in segment contain data
                            choose_address_read_write = address_read_write;
                    end
                    
                    else 
                    stop_clone = 1'b1; //active stop if has a exception (avoid the latch)
             end  //end of else
             //dont infer latach
        end//end always @(posedge clk, posedge stop, posedge full)
        
    Memory #(.deep(deep), .width_bit_reg(width_bit_reg), .max_bit_address(max_bit_address)
            )
    memory (.data_out(data_out),
            .data_in(instruction_or_data_in),
            .address_read_write(choose_address_read_write),
            .clk(clk), .full(full), .stop(stop_clone), .empty(empty), .reset(reset),
            .write_or_read(write_or_read)
            );
endmodule

module Memory #(parameter deep = 31,
                width_bit_reg = 7,
                max_bit_address = 4)(
        output reg [width_bit_reg:0] data_out, 
        input [width_bit_reg:0] data_in,
        input [max_bit_address:0] address_read_write ,//address to write or read
        input clk, full, stop, empty, reset,
        input write_or_read //1 enable to write and 0 enable to read
        
    );
    reg [width_bit_reg:0] data_array [0:deep];
    
    integer i;
    always @(posedge clk ) //use edge sensitive to avoid latch
    begin
        if(reset == 1'b1) //if reset on
        begin
            data_out = 0;
            for(i = 0; i<=deep ; i = i+1)
            data_array[i] = 0;
        end
        
        if(stop == 1'b0)//if stop off
        begin
            if(write_or_read == 1'b1 && full == 1'b0) //enable write if full = 0
                begin
                    data_array [address_read_write] <= data_in;
                end
            else if(write_or_read == 1'b0 && empty == 1'b0) //enable read if empty = 0
                begin //enable read because of if has a exception read will not be affected
                    data_out <= data_array[address_read_write];
                end
        end     
         //don't infer the latch because of edge sensitive
    end
endmodule
