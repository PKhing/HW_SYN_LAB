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


module RgbRam(output [3:0] vgaRed, vgaGreen, vgaBlue,input [11:0] c1, c2, input [9:0] pos);
    parameter N = 30;
    
    wire [3:0] r1,g1,b1,r2,g2,b2;
    assign {r1,g1,b1} = c1;
    assign {r2,g2,b2} = c2;

    Color #(N) r (vgaRed,r1,r2,pos[9:4]);
    Color #(N) g (vgaGreen,g1,g2,pos[9:4]);
    Color #(N) b (vgaBlue,b1,b2,pos[9:4]);
    
endmodule

module Color (output reg [3:0] result, input [3:0] c1,c2, input [6:0] pos);
    parameter N = 30;

    always @(*) begin
        if (c2>c1) result = c1 + pos * (c2-c1)/N;
        else result = c2 + (N-pos-1) * (c1-c2)/N;
    end

endmodule