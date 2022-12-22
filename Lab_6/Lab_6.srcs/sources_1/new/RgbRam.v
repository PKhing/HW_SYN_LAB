`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/31/2022 08:55:31 PM
// Design Name: 
// Module Name: RgbRam
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


module RgbRam(output reg [3:0]  vgaRed,vgaGreen,vgaBlue,input [11:0]c1,c2, input [9:0] pos,input clk,video_on);
    parameter N = 30;

    wire [3:0] r1,g1,b1,r2,g2,b2,dr,dg,db;

    assign {r1,g1,b1} = c1;
    assign {r2,g2,b2} = c2;
    assign dr = r1>r2? r1-r2:r2-r1;
    assign dg = g1>g2? g1-g2:g2-g1;
    assign db = b1>b2? b1-b2:b2-b1;
    
    reg [11:0] ram [N-1:0];
    reg [3:0] diffram [N-1:0][15:0];

    integer i,j;

    // generate diff ram
    initial 
        for(i=0;i<N;i=i+1)
            for(j=0;j<16;j=j+1)
                diffram[i][j] = j*i/N;

    // generate color
    always @(posedge clk) begin
        for(i=0;i<N;i=i+1) begin
            if(r2>r1) ram[i][3:0] = r1 + diffram[i][dr];
            else ram[N-i-1][3:0] = r2 + diffram[i][dr];
            if(g2>g1) ram[i][7:4] = g1 + diffram[i][dg];
            else ram[N-i-1][7:4] = g2 + diffram[i][dg];
            if(b2>b1) ram[i][11:8] = b1 + diffram[i][db];
            else ram[N-i-1][11:8] = b2 + diffram[i][db];
        end
    end

    always @(posedge clk)
        {vgaRed,vgaGreen,vgaBlue} = (video_on) ? ram[pos[9:4]] : 12'b0;
endmodule
