`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/17/2022 09:39:22 PM
// Design Name: 
// Module Name: System2
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


module System2(
    output [3:0] an,
    output dp,
    output [6:0] seg,
    input [15:0] sw,
    input clk
    );

    wire sevenSegClk;
    ClockDividerNBits #(18) div(sevenSegClk,clk);

    wire [13:0] segments;
    Binary2SevenSegments b2s (segments, sw[4:0]);
    SegmentsDisplay d (seg,an,dp,{{14{1'b1}},segments},sevenSegClk);
    
endmodule
