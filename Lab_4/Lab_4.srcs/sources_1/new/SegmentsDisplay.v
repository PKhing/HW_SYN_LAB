`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/17/2022 09:39:22 PM
// Design Name: 
// Module Name: SegmentsDisplay
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


module SegmentsDisplay(
    output reg[6:0] seg,
    output reg[3:0] an,
    output dp,
    input [27:0] segments,
    input clk
    );
    
    reg [1:0] state = 0;
    assign dp = 1;

    always @(posedge clk) begin
        case(state)
            2'd0: seg <= segments[6:0];
            2'd1: seg <= segments[13:7];
            2'd2: seg <= segments[20:14];
            2'd3: seg <= segments[27:21];
        endcase
    end

    always @(posedge clk) begin
        state <= state + 1;
        an <= 4'b1111 & ~(4'b0001<<state);
    end

endmodule
