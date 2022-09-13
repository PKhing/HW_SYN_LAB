`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/11/2022 12:50:55 AM
// Design Name: 
// Module Name: BcdCounter4BitsTester
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


module BcdCounter4BitsTester();
    reg clk = 0;
    reg [3:0] up = 0;
    reg [3:0] down = 0;
    reg set0 = 0;
    reg set9 = 0;

    wire [3:0] count [3:0];

    BcdCounter4Bits bcd({count[3],count[2],count[1],count[0]}, up, down,set9, set0, clk);

    always #10 clk = ~clk;

    initial begin
        #5 
        down = 4'b0001;
        
        #30
        set9 = 1;
        
        #40
        set9 = 0;
        
        #200
        down = 0;
        up = 1;
        
        #400
        set0 = 1;
        
        #20
        set0 = 0;
        
        #20
        up = 4'b0010;
        
        #20
        up = 4'b0100;
        
        #20
        up = 4'b1000;
        
        #20
        up = 0;
        down = 4'b0010;
        
        #20
        down = 4'b0100;
        
        #20
        down = 4'b1000;
        
        #150
        $finish;
    end
    
endmodule
