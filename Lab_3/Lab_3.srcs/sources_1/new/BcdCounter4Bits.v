`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/11/2022 12:38:17 AM
// Design Name: 
// Module Name: BcdCounter4Bits
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


module BcdCounter4Bits(output [15:0] count, input [3:0] up, down, input set9, set0, clk);
    wire [3:0] cout, bout;
    reg [3:0] rup, rdown;
    reg is9,is0;
    integer i;

    // 4 bits counter
    generate 
        for(genvar i = 0; i < 4; i = i + 1)
            // for bit 1-3 check bout and cout of the previous bit
            if (i > 0) BcdCounter counter(count[4*i +: 4], cout[i], bout[i], up[i] | cout[i-1], down[i] | bout[i-1], set9 | cout[3], set0 | bout[3], clk);
            else BcdCounter counter(count[4*i +: 4], cout[i], bout[i], up[i], down[i], set9 | cout[3], set0 | bout[3], clk);
    endgenerate

endmodule
