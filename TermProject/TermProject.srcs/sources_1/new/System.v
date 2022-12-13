`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/30/2022 06:27:18 PM
// Design Name: 
// Module Name: SystemVga
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


module System(output [15:0] led, output [3:0]  vgaRed,vgaGreen,vgaBlue, output Hsync, Vsync, input clk, RsRx);
	// register for Basys 2 8-bit RGB DAC 
	
	// video status output from vga_sync to tell when to route out rgb signal to DAC
	
	wire [31:0] number;
	wire [2:0] operator;
	wire minusFlag, errorFlag;
	reg [3:0] count1=0;
	reg [3:0] count2=0;

  Display display({vgaRed,vgaGreen,vgaBlue}, Hsync, Vsync, number[15:0], operator, minusFlag, errorFlag, clk);

	wire ready;
	wire [7:0] data;
	UartReceive ur(data, ready, RsRx, clk);

	wire [2:0] flag;
	wire [3:0] numIn;
  DataToSignal dts(flag, numIn, data, ready);

	wire [4:0] state;
	Calculator cal(minusFlag, errorFlag, number, operator, state, ready, flag, numIn, clk);

	assign led[15:11] = state;
endmodule