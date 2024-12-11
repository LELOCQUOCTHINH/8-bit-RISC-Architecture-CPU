`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/10/2024 06:53:19 PM
// Design Name: 
// Module Name: clock_gen_TB
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


module testbench;
    reg clk_in;
    wire clk1, clk2;

    // Instantiate the clock_generator module
    clock_generator uut (
        .clk_in(clk_in),
        .clk1(clk1),
        .clk2(clk2)
    );

    // Generate input clock
    initial begin
        clk_in = 0;
        forever #5 clk_in = ~clk_in; // 10ns clock period
    end

    // Monitor signals
    initial begin
        $monitor("Time = %0t | clk_in = %b | clk1 = %b | clk2 = %b",
                 $time, clk_in, clk1, clk2);
        #200 $finish; // End simulation after 200ns
    end
endmodule




