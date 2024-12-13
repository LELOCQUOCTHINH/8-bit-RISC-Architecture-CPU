`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/07/2024 07:15:45 PM
// Design Name: 
// Module Name: clock_generator
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

//raw clock is 125MHz 
module clock_generator (
    output reg clk1,       // Faster clock
    output reg clk2,        // Slower clock
    input clk_in,     // Input clock
    input reset,
    input stop
);
    always @(posedge clk_in, posedge reset, posedge stop)
    begin
        if(reset || stop)
        begin
            clk1 <= 0;
            clk2 <= 0;
        end
        else if(clk1 == 0)
            clk1 <= ~clk1;
        else if(clk2 == 0)
            clk2 <= ~clk2;
        else
        begin
            clk1 <= 0;
            clk2 <= 0;
        end
    end
endmodule




