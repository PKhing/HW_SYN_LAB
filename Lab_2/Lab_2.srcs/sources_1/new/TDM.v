`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/05/2022 01:43:04 PM
// Design Name: 
// Module Name: TDM
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


module TDM(
        output [6:0] seg,
        output dp,
        output [3:0] an,
        input [3:0] num1,
        input [3:0] num2,
        input [3:0] num3,
        input [3:0] num4,
        input clk
    );
    
    reg [1:0] ps;
    reg [3:0] an;
    reg [3:0] numIn;
    BcdTo7Seg BT7(seg,numIn);
    assign dp=1;
    initial
        ps=0;
    
    always @(posedge clk) begin
          ps = ps + 1;
    end
    
    always @(ps) begin
        case(ps)
            2'b00 : an= 4'b1110;
            2'b01 : an= 4'b1101;
            2'b10 : an= 4'b1011;
            2'b11 : an= 4'b0111;
        endcase 
    end
    
    always @(ps) begin
        case (ps)
            2'b00 : numIn= num4;
            2'b01 : numIn= num3;
            2'b10 : numIn= num2;
            2'b11 : numIn= num1;
        endcase
    end
    
endmodule
