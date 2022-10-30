`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/30/2022 02:35:09 PM
// Design Name: 
// Module Name: test
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


module test();
    reg RsRx = 1;
    wire [15:0] led;

    System s (.RsRx(RsRx),.led(led));
    initial begin
        #10 RsRx = ~RsRx;
        #10 RsRx = ~RsRx;
        #10 RsRx = ~RsRx;
        #5 RsRx = ~RsRx;
    end
endmodule
