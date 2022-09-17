`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/11/2022 10:50:49 AM
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


module System(output [6:0] seg,output dp,output [3:0] an,input clk, btnU, btnC, input [16:0] sw);
    wire sevenSegClk, dividedClk;
    ClockDividerNBits #(18) div(sevenSegClk, clk);
    ClockDividerNBits #(14) div2(dividedClk, clk);
    
    wire buttonU,buttonC;
    wire [3:0] up,down;
    
    InputProcessor prU(buttonU,btnU,dividedClk);
    InputProcessor prC(buttonC,btnC,dividedClk);
    InputProcessor #(4,8) prUp(up,{sw[7],sw[5],sw[3],sw[1]},dividedClk);
    InputProcessor #(4,8) prDown(down,{sw[6],sw[4],sw[2],sw[0]},dividedClk);
       
    wire [15:0] count;
    BcdCounter4Bits counter(count, up, down, buttonU, buttonC, dividedClk);
    
    TDM tdm(seg,dp,an,count[12 +:4],count[8 +:4],count[4 +:4],count[0 +:4],sevenSegClk);
endmodule
