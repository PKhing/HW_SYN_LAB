`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/21/2022 01:42:12 PM
// Design Name: 
// Module Name: fullAdder
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


module fullAdder(cout, s, a, b, cin);
    output cout;
    output s;
    input a;
    input b;
    input cin;
    reg cout, s;
    
    always @(*) begin
        {cout,s} = a+b+cin;    
    end
    
endmodule