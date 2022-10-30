`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/30/2022 04:03:55 PM
// Design Name: 
// Module Name: UartTransmit
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


module UartTransmit(output reg RsTx, input [7:0] data, input ready, input clk);
    reg [7:0] buffer;
    reg writing = 0;
    reg [13:0] count;
    reg [4:0] bitCount = 0;
    always @(posedge clk) begin
        if (~writing) begin
            RsTx = 1;
            if(ready == 1) begin
                writing = 1;
                bitCount = 0;
                buffer = data;
                RsTx = 0;
            end
        end
        else begin
            count = count + 1;
            if(count == 14'd10415) begin
                count = 0;
                bitCount = bitCount + 1;
                {buffer, RsTx} = {RsTx, buffer};
            end
            if(bitCount == 5'd9) begin
                writing = 0;
            end
        end
    end
endmodule


