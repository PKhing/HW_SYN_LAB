`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/22/2022 09:05:10 PM
// Design Name: 
// Module Name: lab1_5_tester
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


module lab1_5_tester(); 
    reg clock, d; 
    wire [3:0] q;
    shiftParam #(4) A (q,clock,d);
    
    always #10 clock=~clock;
        
    initial
    
    begin
        //$dumpfile("testDFlipFlop.dump");
        //$dumpvars(1,D1);
        #0 d=0;
        
        clock=0;
        
        #5 d = 1;
        #20 d = 0;
        #20 d = 1;
        #20 d = 1;
        #20 d = 0;
        #20 d = 1;
 
        #100 $finish;
    end
    
endmodule
