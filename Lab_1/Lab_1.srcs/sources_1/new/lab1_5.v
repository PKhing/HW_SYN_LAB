`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/22/2022 09:01:02 PM
// Design Name: 
// Module Name: lab1_5
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


module shiftParam(q,clock,d);
    parameter BITS = 1;
    output reg [BITS-1:0] q;
    input clock,d;
    
    always @(posedge clock)begin
        q[0] <= d;
        for(integer i = 0; i < BITS-1; i = i + 1)
            q[i+1] <= q[i];
    end
endmodule
