`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/17/2022 02:04:39 PM
// Design Name: 
// Module Name: StackTester
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


module StackTester();
        reg clk = 0,push=0,pop=0;
        reg [7:0] dataIn;
        reg reset = 0;
        wire [7:0] dataOut, stackSize;
        
        Stack s (dataOut, stackSize, dataIn, push, pop, reset, clk);
        always #10 clk = ~clk;
        initial
        begin
            #0 dataIn = 8'h12;
               push = 1;
            #20 push = 0;
            
            #20 dataIn = 8'h23;
               push = 1;
            #20 push = 0;
        
            #20 dataIn = 8'h34;
               push = 1;
            #20 push = 0;
            
            #20 dataIn = 8'h45;
               push = 1;
            #20 push = 0;
            
            #20 pop = 1;
            #100 pop = 0;
            
            #20 dataIn = 8'h10;
               push = 1;
            #20 push = 0;
            
            #20 pop = 1;
            #20 pop = 0;   
            
            #20 reset = 1;
            #20 reset = 0;
            
            #20 pop = 1;
            #20 pop = 0;   
        end
endmodule
