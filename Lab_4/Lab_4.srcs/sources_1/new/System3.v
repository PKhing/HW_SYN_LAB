`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/17/2022 10:51:35 PM
// Design Name: 
// Module Name: System3
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


module System3(
    output [3:0] an,
    output dp,
    output [6:0] seg,
    input [15:0] sw,
    input btnU, btnL, btnD, btnR,
    input clk
    );

    wire sevenSegClk;
    ClockDividerNBits #(18) div1(sevenSegClk,clk);

    wire dividedClk;
    ClockDividerNBits #(14) div2(dividedClk,clk);

    wire plus, minus, mul, div;
    InputProcessor #(4) ({plus,minus,mul,div},{btnU, btnL, btnD, btnR},dividedClk);

    wire [1:0] op;
    OperatorDecoder decode(op, plus,minus,mul,div);
    
    wire [3:0] a,b;
    wire [27:0] aluResult;
    assign a = sw[15:12];
    assign b = sw[3:0];
    ALU alu(aluResult, a, b, op);
    
    
    reg [27:0] segments = {28{1'b1}};
    always @(posedge dividedClk) begin
        if (plus | minus | mul | div) segments = aluResult;
    end

    SegmentsDisplay d (seg,an,dp,segments,sevenSegClk);
endmodule
