`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/05/2022 01:43:04 PM
// Design Name: 
// Module Name: BcdTo7Seg
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


module BcdTo7Seg(output reg [6:0] segment,input [3:0] number);
    
    
// 7-segment encoding
//      0
//     ---
//  5 |   | 1
//     --- <--6
//  4 |   | 2
//     ---
//      3

   always @(number)
      case (number)
          4'b0001 : segment = 7'b1111001;   // 1
          4'b0010 : segment = 7'b0100100;   // 2
          4'b0011 : segment = 7'b0110000;   // 3
          4'b0100 : segment = 7'b0011001;   // 4
          4'b0101 : segment = 7'b0010010;   // 5
          4'b0110 : segment = 7'b0000010;   // 6
          4'b0111 : segment = 7'b1111000;   // 7
          4'b1000 : segment = 7'b0000000;   // 8
          4'b1001 : segment = 7'b0010000;   // 9
          4'b1010 : segment = 7'b0001000;   // A
          4'b1011 : segment = 7'b0000011;   // b
          4'b1100 : segment = 7'b1000110;   // C
          4'b1101 : segment = 7'b0100001;   // d
          4'b1110 : segment = 7'b0000110;   // E
          4'b1111 : segment = 7'b0001110;   // F
          default : segment = 7'b1000000;   // 0
      endcase				
endmodule
