`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/11/2022 08:43:48 PM
// Design Name: 
// Module Name: Debounce
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


module Debounce(output out,input in, clk);
    reg state = 0; 
    reg out = 0;
    reg [5:0] count = 0;
    
    always @(posedge clk) begin
            
        if (state == in) 
            if (count == 31) out = state;
            else count = count + 1;
        else begin
            count = 1;
            state = in;
        end            
    end
    
endmodule
