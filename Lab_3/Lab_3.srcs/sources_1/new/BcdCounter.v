`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/06/2022 12:50:18 PM
// Design Name: 
// Module Name: BcdCounter
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


module BcdCounter(output [3:0] count, output cout, bout,
                  input up, down, set9, set0, clk);
    reg [3:0] count = 0;
    reg cout = 0;
    reg bout = 0;
    
    always @(posedge clk) begin

        // set
        if(set9) count = 9;
        else if(set0) count = 0;

        // count up
        else if(up) 
            if (count == 9) count = 0; 
            else count = count + 1;

        // count down
        else if(down) 
            if (count == 0) count = 9; 
            else count = count - 1;
    end
    
    // cout
    always @(*) begin
        if (up && count == 9)cout = 1;
        else cout = 0;
    end
    
    // bout
    always @(*) begin
        if (~up && down && count == 0)bout = 1;
        else bout = 0;
    end
    
endmodule
