`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Le Loc Quoc Thinh
// 
// Create Date: 05/01/2025
// Design Name: Register Testbench
// Module Name: Register_tb
// Project Name: Design a 8-bits RISC architecture CPU
// Target Devices: 
// Tool Versions: 
// Description: 
// Testbench for the Register module
//
// Dependencies: 
// Register.v
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module Register_tb;

    // Parameters
    parameter WIDTH_REG = 8;
    parameter CLK_PERIOD = 10; // 10ns clock period

    // Inputs
    reg [WIDTH_REG-1:0] register_in;
    reg clk;
    reg rst;
    reg load;

    // Output
    wire [WIDTH_REG-1:0] register_out;

    // Instantiate the Unit Under Test (UUT)
    Register #(.WIDTH_REG(WIDTH_REG)) uut (
        .register_out(register_out),
        .register_in(register_in),
        .clk(clk),
        .rst(rst),
        .load(load)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #(CLK_PERIOD/2) clk = ~clk;
    end

    // Test stimulus
    initial begin
        // Initialize inputs
        register_in = 0;
        rst = 0;
        load = 0;

        // Wait for global reset
        #100;

        // Test Case 1: Synchronous Reset
        rst = 1;
        @(posedge clk);
        rst = 0;
        #10;
        if (register_out !== 8'h00)
            $display("Test Case 1 Failed: Expected register_out = 8'h00, Got %h", register_out);
        else
            $display("Test Case 1 Passed: register_out = %h", register_out);

        // Test Case 2: Load = 0, no change in register_out
        register_in = 8'hAA;
        load = 0;
        @(posedge clk);
        #10;
        if (register_out !== 8'h00)
            $display("Test Case 2 Failed: Expected register_out = 8'h00, Got %h", register_out);
        else
            $display("Test Case 2 Passed: register_out = %h", register_out);

        // Test Case 3: Load = 1, load register_in
        register_in = 8'h55;
        load = 1;
        @(posedge clk);
        #10;
        if (register_out !== 8'h55)
            $display("Test Case 3 Failed: Expected register_out = 8'h55, Got %h", register_out);
        else
            $display("Test Case 3 Passed: register_out = %h", register_out);

        // Test Case 4: Load another value
        register_in = 8'hFF;
        load = 1;
        @(posedge clk);
        #10;
        if (register_out !== 8'hFF)
            $display("Test Case 4 Failed: Expected register_out = 8'hFF, Got %h", register_out);
        else
            $display("Test Case 4 Passed: register_out = %h", register_out);

        // Test Case 5: Reset while load is high
        register_in = 8'hCC;
        rst = 1;
        load = 1;
        @(posedge clk);
        rst = 0;
        #10;
        if (register_out !== 8'h00)
            $display("Test Case 5 Failed: Expected register_out = 8'h00, Got %h", register_out);
        else
            $display("Test Case 5 Passed: register_out = %h", register_out);

        // Test Case 6: No load after reset
        register_in = 8'h33;
        load = 0;
        @(posedge clk);
        #10;
        if (register_out !== 8'h00)
            $display("Test Case 6 Failed: Expected register_out = 8'h00, Got %h", register_out);
        else
            $display("Test Case 6 Passed: register_out = %h", register_out);

        // End simulation
        #100;
        $display("Simulation Completed");
        $finish;
    end

    // Monitor signals
    initial begin
        $monitor("Time=%0t clk=%b rst=%b load=%b register_in=%h register_out=%h",
                 $time, clk, rst, load, register_in, register_out);
    end

endmodule