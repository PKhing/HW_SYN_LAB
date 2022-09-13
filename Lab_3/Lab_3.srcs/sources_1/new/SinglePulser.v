`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/11/2022 12:18:33 AM
// Design Name: 
// Module Name: SinglePulser
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


module SinglePulser(output out, input in, clk);
    reg out = 0;
    reg state = 0;
    
    // output
    always @(posedge clk) begin
        if (state == 0 && in == 1) out = 1;
        else out = 0;
    end
    
    // change state
    always @(posedge clk) begin
        state = in;
    end
    
endmodule
