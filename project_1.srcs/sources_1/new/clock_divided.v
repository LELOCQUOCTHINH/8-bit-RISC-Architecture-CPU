`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/11/2024 11:26:43 AM
// Design Name: 
// Module Name: clock_divided
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


module clock_divided #(parameter clock_frequency = 125 * 10**6)(
        output reg clk_divided,
        input clk, reset, stop
    );
        localparam integer width_counter = $clog2(clock_frequency);//width of counter
        reg [width_counter - 1 : 0] counter;
        always @(posedge clk)
        begin
            if(reset || stop)
               clk_divided <= 0;
           else if(counter == clock_frequency)
                counter <= 0;
           else if(counter == 0)
                clk_divided <= ~clk_divided;     
           else
                counter <= counter + 1; 
        end
endmodule
