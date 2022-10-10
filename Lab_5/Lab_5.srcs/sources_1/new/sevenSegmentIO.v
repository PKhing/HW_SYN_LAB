`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/08/2022 11:00:31 PM
// Design Name: 
// Module Name: sevenSegment
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


module sevenSegmentIO(seg, dp, an, data, address, wr, clock);
    parameter DATA_WIDTH=32;
    parameter ADDR_WIDTH=27;

    output [6:0] seg;
    output dp;
    output [3:0] an;

    input	[DATA_WIDTH-1:0]	data;
    input	[ADDR_WIDTH-1:0]	address;
    input	wr;
    input	clock;

    reg [15:0] num = 0;
    wire dividedClk;
    ClockDividerNBits #(18) div(dividedClk, clock);

    TDM tdm(seg,dp,an,num[15:12],num[11:8],num[7:4],num[3:0],dividedClk);

    always @(posedge clock) begin
        if(wr) 
            case (address)
                27'h3ffc: num[3:0] = data[3:0]; 
                27'h3ffd: num[7:4] = data[3:0];
                27'h3ffe: num[11:8] = data[3:0];
                27'h3fff: num[15:12] = data[3:0];
            endcase
    end

    always @(num)  $display("<%h %h %h %h>",num[3:0],num[7:4],num[11:8],num[15:12]);
    
endmodule
