`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/08/2022 11:40:59 PM
// Design Name: 
// Module Name: switchIO
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


module switchIO(data, address, wr, clock, switch);
    
    parameter DATA_WIDTH=32;
    parameter ADDR_WIDTH=27;

    output reg	[DATA_WIDTH-1:0]	data;
    input	[ADDR_WIDTH-1:0]	address;
    input	wr;
    input	clock;
    input   [15:0]      switch;
    reg [11:0] buffer;

    always @(posedge clock) buffer = switch[11:0];

    always @(address)begin
        if(wr == 0)begin
            case(address)
                14'h3ff8: data = buffer[3:0];
                14'h3ff9: data = buffer[7:4];
                14'h3ffa: data = buffer[11:8];
                default: data = 32'bz;
            endcase
        end
        else data = 32'bz;
    end


endmodule
