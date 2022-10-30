`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/30/2022 01:34:41 PM
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


module System(output [15:0] led, output RsTx, input clk, input RsRx, input [15:0] sw);
    wire [7:0] data;
    wire ready;
    assign led[7:0] = data;

    UartReceive ur(data, ready, RsRx, clk);
    UartTransmit ut(RsTx, data+1, ready, clk);
endmodule
