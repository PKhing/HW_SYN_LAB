`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/22/2022 02:53:44 PM
// Design Name: 
// Module Name: fullAdderTester
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


module fullAdderTester();
    
    reg a,b,cin;
    wire cout,s;
    
    fullAdder a1(cout,s,a,b,cin);
    
    initial
    
    begin
        //$dumpfile("time.dump");
        //$dumpvars(2,a1);
        $monitor("time %t: {%b %b} <- {%d %d %d}", $time,cout,s,a,b,cin);
        #0;
        {a,b,cin} = 3'd0;
        
        #5
        {a,b,cin} = 3'd1;
        
        #5
        {a,b,cin} = 3'd2;
        
        #5
        {a,b,cin} = 3'd3;
        
        #5
        {a,b,cin} = 3'd4;
        
        #5
        {a,b,cin} = 3'd5;
        
        #5
        {a,b,cin} = 3'd6;
        
        #5
        {a,b,cin} = 3'd7;
        
        #5
        $finish;
    end
endmodule