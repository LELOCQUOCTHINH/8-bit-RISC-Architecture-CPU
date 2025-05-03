`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Le Loc Quoc Thinh
// 
// Create Date: 05/01/2025 06:08:06 PM
// Design Name: Clock Divider
// Module Name: CLK_divider
// Project Name: Design a 8-bits RISC architecture CPU
// Target Devices: 
// Tool Versions: 
// Description: 
// Clock Divider be Used for dividing the input clock so that the human eye can see the activity of the CPU
// or guarantee the synchronization
//
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module CLK_divider
#(parameter CLOCK_FREQUENCY = 375_000_000, WANTED_FREQUENCY = 1)
(
    output reg divided_clk,
    input clk, rst, stop
);
  
    localparam integer COUNTER_THRESHOLD = WANTED_FREQUENCY <= CLOCK_FREQUENCY ? (CLOCK_FREQUENCY / WANTED_FREQUENCY) : 1;
    //the threshold to reset the counter
    
    localparam integer WIDTH_COUNTER = COUNTER_THRESHOLD <= 1 ? 1 : $clog2(COUNTER_THRESHOLD);//width of counter
    
    reg [WIDTH_COUNTER - 1:0] counter;
    
    always@(posedge clk)
    begin
        if(rst) //rst active
        begin
            divided_clk <= 0;
            counter <= 0;
        end
        
        else if(counter == COUNTER_THRESHOLD && !stop) //stop not active
        begin
            divided_clk <= ~divided_clk;
            counter <= 0;
        end
        
        else if(!stop) //stop not active
        begin
            counter <= counter + 1;
        end
    end

endmodule
