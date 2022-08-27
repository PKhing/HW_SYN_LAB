`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/22/2022 03:41:45 PM
// Design Name: 
// Module Name: DFlipFlopTester
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


    
module DFlipFlopTester();
    reg clock, nreset, d;
    DFlipFlop D1(q,clock,nreset,d);
    always #10 clock=~clock;
        
    initial
    
    begin
        //$dumpfile("testDFlipFlop.dump");
        //$dumpvars(1,D1);
        #0 d=0;
        
        clock=0;
        nreset=0;
        
        #50 nreset=1;
        #45 nreset=0;
        #10 nreset=1;
 
        #150 $finish;
    end
    
    always #8 d=~d;
endmodule
