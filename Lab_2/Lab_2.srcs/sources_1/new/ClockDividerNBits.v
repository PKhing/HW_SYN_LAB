`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/11/2022 10:53:00 AM
// Design Name: 
// Module Name: ClockDividerNBits
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


module ClockDividerNBits(output dividedClk, input clk);
    parameter BITS = 1;
    wire dclk[BITS:0],dividedClk;
    
    assign dclk[0] = clk;
    assign dividedClk = dclk[BITS];

    generate 
        for(genvar i = 0; i < BITS; i = i + 1)
            ClockDivider div(dclk[i+1],dclk[i]);
    endgenerate
    
endmodule
