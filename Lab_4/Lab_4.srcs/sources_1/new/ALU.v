`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/17/2022 10:54:42 PM
// Design Name: 
// Module Name: ALU
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


module ALU(
    output [27:0] segments,
    input [3:0] a,b,
    input [1:0] op);
    // 0 = add, 1 = minus, 2 = multiply, 3 = divide

    parameter ROM_WIDTH = 28;
    parameter ROM_ADDR_BITS = 10;

    (* rom_style="block" *)
    reg [ROM_WIDTH-1:0] rom [(2**ROM_ADDR_BITS)-1:0];

    initial $readmemb("romAlu.data", rom, 0, (2**ROM_ADDR_BITS)-1);
    assign segments = rom[{op,a,b}];		

endmodule
