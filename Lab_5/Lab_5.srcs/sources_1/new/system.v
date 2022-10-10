`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/09/2022 12:09:51 AM
// Design Name: 
// Module Name: system
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


module system(
    output [3:0] an,
    output dp,
    output [6:0] seg,
    input [15:0] sw,
    input clk
);

    wire 	[31:0]	p_address;
    wire 	[31:0]	p_data;
    wire	[31:0]	d_address;
    wire		mem_wr;
    wire	[31:0]	d_data;
    reg		nreset = 0;

    nanocpu	CPU(p_address,p_data,d_address,d_data,mem_wr,clk,nreset);
    rom 	#(32,14) PROGMEM(p_data,p_address[15:2]);
    memory 	#(32,14) DATAMEM(d_data,d_address[15:2],mem_wr,clk);
    switchIO #(32,14) SWITCH(d_data, d_address[15:2], mem_wr, clk, sw);
    sevenSegmentIO #(32,14) SEVENSEG(seg, dp, an, d_data, d_address[15:2], mem_wr, clk);

    reg [1:0] cnt = 0;
    always @(posedge clk)begin
        if(cnt == 3) nreset = 1;
        cnt = cnt + 1;
        
	    $display("%10d - mem[%h] -  %h\n",$time, d_address[15:2],d_data);	
    end

endmodule