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


module SystemVga(output [3:0]  vgaRed,vgaGreen,vgaBlue, output Hsync, Vsync, input clk, input [15:0] sw, input btnC);
	// register for Basys 2 8-bit RGB DAC 
	
	// video status output from vga_sync to tell when to route out rgb signal to DAC
	wire video_on;
    wire [9:0] x,y;
    wire [11:0] color;

    // instantiate vga_sync
    vga_sync vga_sync_unit (.clk(clk), .hsync(Hsync), .vsync(Vsync),
                            .video_on(video_on), .p_tick(), .x(x), .y(y));
    
    assign {vgaRed,vgaGreen,vgaBlue} = video_on? color:12'b000000000000;
    RgbRam v (color,x,y,{4'd14,4'd11,4'd12,4'd13,4'd14},3'd1);
    
    
endmodule