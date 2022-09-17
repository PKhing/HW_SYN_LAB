`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/17/2022 12:52:14 PM
// Design Name: 
// Module Name: System1
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


module System1(
    output [6:0] seg,
    output dp,
    output [3:0] an,
    input btnC, btnU, btnD,clk,
    input [15:0] sw
    );
    
    wire push,pop,reset,dividedClk,sevenSegClk;
    wire [7:0] dataIn, stackSize, dataOut;
    
    ClockDividerNBits #(14) div1(dividedClk, clk);
    ClockDividerNBits #(18) div2(sevenSegClk, clk);
    
    InputProcessor iU(push, btnU, dividedClk);
    InputProcessor iC(pop, btnC, dividedClk);
    InputProcessor iD(reset, btnD, dividedClk);
    assign dataIn = sw[7:0];
    
    Stack stack(dataOut,stackSize,dataIn,push,pop,reset,dividedClk);
    
    TDM tdm(seg,dp,an,dataOut[7:4],dataOut[3:0],stackSize[7:4],stackSize[3:0],sevenSegClk);

    
endmodule
