`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/11/2022 10:02:29 PM
// Design Name: 
// Module Name: Display
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


module Display(
    output [11:0] color, 
    output Hsync, Vsync,
    input [15:0] number, 
    input [2:0] operator, 
    input minusFlag, errorFlag, clk
    );

    wire [9:0] x,y;
    wire videoOn;

    vga_sync vga_sync_unit (.clk(clk), .hsync(Hsync), .vsync(Vsync),
                            .video_on(videoOn), .p_tick(), .x(x), .y(y));

    wire [19:0] displayNumber;
    DisplayLogic displayLogic_unit (displayNumber, number, minusFlag, errorFlag);
    
    wire [11:0] ramColor;
    RgbRam ram (ramColor, x, y, displayNumber, operator);
    assign color = videoOn? ramColor : 12'b000000000000;

endmodule
