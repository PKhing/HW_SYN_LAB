`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/17/2022 11:03:04 PM
// Design Name: 
// Module Name: OperatorDecoder
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


module OperatorDecoder(
        output [1:0] op,
        input plus,minus,mul,div
    );

    assign  op = { mul | div, minus | div};

endmodule
