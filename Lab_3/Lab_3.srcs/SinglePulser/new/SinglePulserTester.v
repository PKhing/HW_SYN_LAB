`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/11/2022 12:24:42 AM
// Design Name: 
// Module Name: SinglePulserTester
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


module SinglePulserTester();
    reg clk = 0;
    reg in = 0;
    wire out;
    
    SinglePulser SP(out, in ,clk);
    
    always #10 clk = ~clk;
    
    initial
    begin
    
        #25 
        in = 1;
        
        #100
        in = 0;
        
        #20
        in = 1;
        
        #10
        in = 0;
        
        #20
        $finish;
        
    end
    
endmodule
