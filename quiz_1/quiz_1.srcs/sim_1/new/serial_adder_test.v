`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/25/2022 01:38:20 PM
// Design Name: 
// Module Name: serial_adder_test
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


module serial_adder_test();
    wire s,c_out;
    reg a,b,clk = 0,reset=0;
    
    always #10 clk = ~clk;
    
    serial_adder sa(s,c_out,a,b,clk,reset);
    
    initial begin
        #5
        a = 1; b = 1;
        #20
        a = 1; b = 1;
        #20
        a = 1; b = 1;
        #20
        a = 0; b = 1;
        #20
        a = 1; b = 1;
        #20
        reset = 1;
        #20
        reset = 0;
        a = 1; b = 1;
        #20
        a = 1; b = 1;
    end
endmodule
