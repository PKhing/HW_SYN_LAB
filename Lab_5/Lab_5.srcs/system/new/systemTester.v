`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/09/2022 12:16:59 AM
// Design Name: 
// Module Name: systemTester
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


module systemTester(

    );
    
    reg clk = 0;
    wire [6:0] seg;
    reg [15:0] sw;
    always #20 clk = ~clk;

    initial begin
        // #0 sw = 16'b00000_000_0010_0011;
        // #2000 sw = 16'b00000_001_0010_0011;
        #0 sw = 16'b00000_000_1111_1111;
        #2000 $finish;
    end
    
    system System(.clk(clk),.sw(sw),.seg(seg));
    
    
endmodule
