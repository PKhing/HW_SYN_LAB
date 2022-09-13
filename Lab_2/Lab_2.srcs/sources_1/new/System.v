`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/05/2022 01:43:04 PM
// Design Name: 
// Module Name: System
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


module System(output [6:0] seg,output dp,output [3:0] an,input clk);
    wire dividedClk;
    ClockDividerNBits #(18) div(dividedClk, clk);
    
    TDM tdm(seg,dp,an,4'd1,4'd2,4'd3,4'd4,dividedClk);
    
endmodule
