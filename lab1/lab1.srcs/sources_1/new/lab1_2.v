`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/22/2022 03:24:35 PM
// Design Name: 
// Module Name: fullAdderAssign
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


module fullAdderAssign(cout, s, a, b, cin);

    output cout;
    output s;
    input a;
    input b;
    input cin;
    
    assign {cout,s} = a + b + cin;
    
endmodule
