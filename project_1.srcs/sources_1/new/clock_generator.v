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

//raw clock is 125MHz so bit width will be 16 because of 125/2 = 62,5 MHz
module clock_generator (
    input wire clk_in,     // Input clock
    output reg clk1,       // Faster clock
    output reg clk2        // Slower clock
);
    reg [1:0] clk1_divider = 0; // Divider for clk1
    reg clk2_toggle = 0;        // Toggle flag for clk2

    always @(posedge clk_in) begin
        // Generate clk1: Divide clk_in by 2
        clk1_divider <= clk1_divider + 1;
        if (clk1_divider == 1) begin
            clk1 <= ~clk1;
            clk1_divider <= 0;
        end
    end

    always @(posedge clk1) begin
        // Generate clk2: Toggle clk2 after every clk1 posedge
        if (!clk2_toggle) begin
            clk2 <= ~clk2;
            clk2_toggle <= 1;
        end else begin
            clk2_toggle <= 0; // Reset toggle flag
        end
    end
endmodule




