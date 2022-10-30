`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/25/2022 01:28:52 PM
// Design Name: 
// Module Name: serial_adder
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


module serial_adder(output s,output c_out,input a,input b,input clk,input reset);
    reg s;
    reg c_out = 0;
    
    always@(posedge clk) begin
        if(reset)begin
            c_out = 0;
            s = 0;        
        end
        else
        {c_out,s} = a+b+c_out;
    end
    
    
endmodule
