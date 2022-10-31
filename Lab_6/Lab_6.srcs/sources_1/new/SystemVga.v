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
	reg [11:0] color1,color2;
	
	// video status output from vga_sync to tell when to route out rgb signal to DAC
	wire video_on;
    wire [9:0] x,y;
    wire [11:0] vc,hc;

    // instantiate vga_sync
    vga_sync vga_sync_unit (.clk(clk), .hsync(Hsync), .vsync(Vsync),
                            .video_on(video_on), .p_tick(), .x(x), .y(y));

    // set color
    always @(posedge clk) begin
        if(sw[15]) color1 = sw[11:0];
        else color2 = sw[11:0];
    end
    

    RgbRam #(30) v (vc[11:8],vc[7:4],vc[3:0],color1,color2,y,clk,video_on);
    RgbRam #(40) h (hc[11:8],hc[7:4],hc[3:0],color1,color2,x,clk,video_on);

    // select type 

    wire dividedClk,buttonC;
    ClockDividerNBits #(14) div2(dividedClk, clk);
    InputProcessor prC(buttonC,btnC,dividedClk);
    reg type = 0;

    always @(posedge dividedClk) begin
        if(buttonC) type = ~type;
    end

    assign {vgaRed,vgaGreen,vgaBlue} = type? vc:hc;
    
    
endmodule
