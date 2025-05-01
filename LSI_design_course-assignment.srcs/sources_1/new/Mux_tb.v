`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Le Loc Quoc Thinh
// 
// Create Date: 05/01/2025
// Design Name: Multiplexer Testbench
// Module Name: Mux_tb
// Project Name: Design a 8-bits RISC architecture CPU
// Target Devices: 
// Tool Versions: 
// Description: 
// Testbench for the Multiplexer module
//
// Dependencies: 
// Mux.v
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module Mux_tb;

    // Parameters
    parameter WIDTH_MUX = 5;

    // Inputs
    reg [WIDTH_MUX-1:0] inA;
    reg [WIDTH_MUX-1:0] inB;
    reg select;

    // Output
    wire [WIDTH_MUX-1:0] MUX_out;

    // Instantiate the Unit Under Test (UUT)
    Mux #(.WIDTH_MUX(WIDTH_MUX)) uut (
        .MUX_out(MUX_out),
        .inA(inA),
        .inB(inB),
        .select(select)
    );

    // Test stimulus
    initial begin
        // Initialize inputs
        inA = 0;
        inB = 0;
        select = 0;

        // Wait for global reset
        #100;

        // Test Case 1: select = 0, inB should be selected
        inA = 5'h1A;
        inB = 5'h0B;
        select = 0;
        #10;
        if (MUX_out !== 5'h0B)
            $display("Test Case 1 Failed: Expected MUX_out = 5'h0B, Got %h", MUX_out);
        else
            $display("Test Case 1 Passed: MUX_out = %h", MUX_out);

        // Test Case 2: select = 1, inA should be selected
        select = 1;
        #10;
        if (MUX_out !== 5'h1A)
            $display("Test Case 2 Failed: Expected MUX_out = 5'h1A, Got %h", MUX_out);
        else
            $display("Test Case 2 Passed: MUX_out = %h", MUX_out);

        // Test Case 3: Change inputs, select = 0
        inA = 5'h05;
        inB = 5'h1F;
        select = 0;
        #10;
        if (MUX_out !== 5'h1F)
            $display("Test Case 3 Failed: Expected MUX_out = 5'h1F, Got %h", MUX_out);
        else
            $display("Test Case 3 Passed: MUX_out = %h", MUX_out);

        // Test Case 4: Change inputs, select = 1
        select = 1;
        #10;
        if (MUX_out !== 5'h05)
            $display("Test Case 4 Failed: Expected MUX_out = 5'h05, Got %h", MUX_out);
        else
            $display("Test Case 4 Passed: MUX_out = %h", MUX_out);

        // Test Case 5: All zeros, toggle select
        inA = 5'h00;
        inB = 5'h00;
        select = 0;
        #10;
        if (MUX_out !== 5'h00)
            $display("Test Case 5 Failed: Expected MUX_out = 5'h00, Got %h", MUX_out);
        else
            $display("Test Case 5 Passed: MUX_out = %h", MUX_out);
        select = 1;
        #10;
        if (MUX_out !== 5'h00)
            $display("Test Case 6 Failed: Expected MUX_out = 5'h00, Got %h", MUX_out);
        else
            $display("Test Case 6 Passed: MUX_out = %h", MUX_out);

        // End simulation
        #100;
        $display("Simulation Completed");
        $finish;
    end

    // Monitor signals
    initial begin
        $monitor("Time=%0t select=%b inA=%h inB=%h MUX_out=%h",
                 $time, select, inA, inB, MUX_out);
    end

endmodule