`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/30/2022 03:37:11 PM
// Design Name: 
// Module Name: UartReceive
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


module UartReceive(output reg [7:0] data, output reg ready, input RsRx, input clk);
    reg [13:0] count;
    reg reading = 0;
    reg [9:0] buffer;
    reg [4:0] bitCount = 0;


    always @(posedge clk) begin
        if (~reading) begin
            if(RsRx == 0) begin
                reading = 1;
                ready = 0;
                buffer = 0;
                bitCount = 0;
            end
            ready = 0;
        end
        else begin
            count = count + 1;
            if(count == 14'd5000) buffer = {RsRx, buffer[9:1]};
            if(count == 14'd10417) begin
                count = 0;
                bitCount = bitCount + 1;
            end
            if(bitCount == 5'd10) begin
                data = buffer[8:1];
                reading = 0;
                ready = 1;
            end
        end
    end


endmodule
