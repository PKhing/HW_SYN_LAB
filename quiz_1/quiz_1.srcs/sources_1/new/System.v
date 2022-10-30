`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/25/2022 01:02:22 PM
// Design Name: 
// Module Name: System
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


module System(output led, input clk);
    reg [3:0] state = 0;
    reg [15:0] led = 15'd0;
    wire divclk;
    
    ClockDividerNBits #(26) div(divclk,clk);
    
    always @(posedge divclk)begin
        led[7] = ~led[7];
        state = state + 1;
        if(state == 5) state = 0;
    end
    
    always @(state)begin
        case(state)
            3'd0: led[4:0] = 5'b00000;
            3'd1: led[4:0] = 5'b00010;
            3'd2: led[4:0] = 5'b00110;
            3'd3: led[4:0] = 5'b01110;
            3'd4: led[4:0] = 5'b11110;
            default : led[4:0] = 5'b11111;
         endcase
    end
endmodule
