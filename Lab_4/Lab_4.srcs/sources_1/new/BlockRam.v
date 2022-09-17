`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/17/2022 12:59:29 PM
// Design Name: 
// Module Name: BlockRam
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


module BlockRam #(
    parameter RAM_WIDTH = 8,
    parameter RAM_ADDR_BITS = 8
    )(
    output reg [RAM_WIDTH-1:0] dataOut,
    input [RAM_WIDTH-1:0] dataIn,
    input [RAM_ADDR_BITS-1:0] address,
    input enable, writeEnable, clk);
    
    
    reg [RAM_WIDTH-1:0] ram [(1<<RAM_ADDR_BITS)-1:0];
    
    always @(posedge clk) begin
        if (enable) 
            if (writeEnable) begin
                ram[address] = dataIn;
                dataOut = dataIn;
                end
            else
                dataOut = ram[address];
    end
    
    
endmodule
