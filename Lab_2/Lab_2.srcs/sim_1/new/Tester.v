`timescale 1s / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/05/2022 02:44:30 PM
// Design Name: 
// Module Name: Tester
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


module Tester();
    
    wire [6:0] seg;
    wire dp;
    wire [3:0] an;
    reg clk=0;
    
    System D1(seg,dp,an,clk);
    always #10 clk=~clk;
    initial
    begin
        #150000 $finish;
    end
endmodule
