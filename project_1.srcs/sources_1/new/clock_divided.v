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


module clock_divided #(parameter clock_frequency = 375_000_000)(
        output reg clk_divided,
        input clk, reset, stop
    );
        localparam integer width_counter = clock_frequency <= 1 ? 1 : $clog2(clock_frequency);//width of counter
        reg [width_counter - 1 : 0] counter;
        always @(posedge clk, posedge reset, posedge stop)
        begin
            if(reset || stop)
            begin
               clk_divided <= 0;
               counter <= 0;
           end
           else if(counter == clock_frequency)
           begin
                counter <= 0;
                clk_divided <= ~clk_divided;
            end
           else
                counter <= counter + 1; 
        end
endmodule
