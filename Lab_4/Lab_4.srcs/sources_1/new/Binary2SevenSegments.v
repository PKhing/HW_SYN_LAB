`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/17/2022 09:49:32 PM
// Design Name: 
// Module Name: Binary2SevenSegments
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


module Binary2SevenSegments(
    output [13:0] segments,
    input [4:0] binary
);
    
   parameter ROM_WIDTH = 14;
   parameter ROM_ADDR_BITS = 5;

   (* rom_style="block" *)
   reg [ROM_WIDTH-1:0] rom [(2**ROM_ADDR_BITS)-1:0];

   initial $readmemb("rom.data", rom, 0, (2**ROM_ADDR_BITS)-1);
   assign segments = rom[binary];		
	
endmodule
