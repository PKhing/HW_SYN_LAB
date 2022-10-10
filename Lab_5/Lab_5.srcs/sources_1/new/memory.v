`timescale 1ns / 1ps
//-------------------------------------------------------
// File name    : memory.v
// Title        : Memory
// Library      : nanoLADA
// Purpose      : Computer Architecture
// Developers   : Krerk Piromsopa, Ph. D.
//              : Chulalongkorn University.
module memory(data,address,wr,clock);
parameter DATA_WIDTH=32;
parameter ADDR_WIDTH=27;

inout	[DATA_WIDTH-1:0]	data;
input	[ADDR_WIDTH-1:0]	address;
input		wr;
input		clock;

reg	[DATA_WIDTH-1:0]	mem[0:1<<ADDR_WIDTH -1];

reg	[DATA_WIDTH-1:0]	data_out;
// Tri-State buffer
assign data=(wr==1||address>=15'h3ff8) ? 32'bz:data_out;
// assign data= 32'bz;

integer i;
initial
begin
	$readmemb("C:/Users/PKhing/Desktop/Code/verilog/Lab_5/Lab_5.srcs/sources_1/new/data.list",mem);
end

always @(address)
begin
	// $display("%b",address>=15'h3ffc);
	data_out = mem[address];
	// $display("%10d - mem[%h] -  %h\n",$time, address,data_out);	
end

always @(posedge clock)
begin : MEM_WRITE
	if (wr) begin
		mem[address]=data;
		$display("%10d - MEM[%h] <- %h",$time, address, data);
	end
end

endmodule