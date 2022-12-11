`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/31/2022 08:55:31 PM
// Design Name: 
// Module Name: RgbRam
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
module RgbRam(output reg [11:0] color,input [9:0] x, y, input [19:0] number, input [2:0] operator);
    parameter NUM_WIDTH=7*3;
    parameter NUM_HEIGHT=11*3;
    parameter START_NUM_X = 27;
    parameter START_NUM_Y = 30;

    parameter OP_WIDTH=26;
    parameter OP_HEIGHT=20;
    parameter START_OP_X = 28;
    parameter START_OP_Y = 80;

    wire [11:0] numRgb[4:0];
    wire [11:0] opRgb[3:0];

    generate 
        for(genvar i = 0; i < 5; i = i + 1)
            NumberRam numRam(numRgb[i],x[9:2]-START_NUM_X-NUM_WIDTH*i,y[9:2]-START_NUM_Y,number[(5-i)*4-1-:4]);
    endgenerate

    generate 
        for(genvar i = 0; i < 4; i = i + 1)
            OperatorRam opRam(opRgb[i],x[9:2]-START_OP_X-OP_WIDTH*i,y[9:2]-START_OP_Y,i,(i+1)==operator);
    endgenerate
    
    integer i;
    
    always @(*) begin
        if(y[9:2] >=START_NUM_Y && y[9:2]<START_NUM_Y+NUM_HEIGHT) begin
            if(x[9:2]<START_NUM_X || x[9:2]>=START_NUM_X+5*NUM_WIDTH)
                color = 12'b111111111111;
            for(i=0;i<5;i=i+1)
                if(x[9:2]>=START_NUM_X+i*NUM_WIDTH && x[9:2]<START_NUM_X+(i+1)*NUM_WIDTH)
                    color = numRgb[i];
        end
        else if(y[9:2] >=START_OP_Y && y[9:2]<START_OP_Y+OP_HEIGHT) begin
            if(x[9:2]<START_OP_X || x[9:2]>=START_OP_X+4*OP_WIDTH)
                color = 12'b111111111111;
            for(i=0;i<4;i=i+1)
                if(x[9:2]>=START_OP_X+i*OP_WIDTH && x[9:2]<START_OP_X+(i+1)*OP_WIDTH)
                    color = opRgb[i];
        end
        else
            color = 12'b111111111111;
    end
endmodule


module NumberRam(output reg [11:0] color,input [7:0] x,y, input [3:0] number);
    parameter NUM_WIDTH=7*3;
    parameter NUM_HEIGHT=11*3;
    
    reg [11:0] numRom[0:NUM_WIDTH*NUM_HEIGHT*14-1];
    initial begin
        $readmemb("C:/Users/PKhing/Desktop/Code/verilog/TermProject/TermProject.srcs/sources_1/new/rom/numberRgb.mem",numRom);
    end
    always @(*) begin
        if(number == 4'd14)
            color = 12'b111111111111;
        else
            color = numRom[y*NUM_WIDTH*14 + x + number*NUM_WIDTH];
    end
endmodule

module OperatorRam(output reg [11:0] color,input [7:0] x,y, input [1:0] number, input isSelected);
    parameter OP_WIDTH=26;
    parameter OP_HEIGHT=20;
    
    reg [11:0] opRom[0:OP_WIDTH*OP_HEIGHT*4-1];
    initial begin
        $readmemb("C:/Users/PKhing/Desktop/Code/verilog/TermProject/TermProject.srcs/sources_1/new/rom/operatorRgb.mem",opRom);
    end
    always @(*) begin
        color = opRom[y*OP_WIDTH*4 + x + number*OP_WIDTH];
        if (isSelected && color == 12'b000000000000)
            color = 12'b1111_1001_0001;
    end
endmodule

