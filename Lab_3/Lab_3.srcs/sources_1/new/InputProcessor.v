`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/11/2022 12:16:00 PM
// Design Name: 
// Module Name: InputProcessor
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


module InputProcessor(output out, input in, clk);
    parameter BITS = 1;
    
    wire [BITS:0] in, out, debounced,synchronized;
    
    generate 
        for(genvar i = 0; i < BITS; i = i+1) begin
            Synchronizer s(synchronized[i],in[i],clk);
            Debounce d(debounced[i], synchronized[i], clk);
            SinglePulser sp(out[i], debounced[i], clk);
        end
    endgenerate
    
endmodule
