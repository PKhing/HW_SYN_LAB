`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/17/2022 12:52:14 PM
// Design Name: 
// Module Name: Stack
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


module Stack #(
    parameter STACK_WIDTH = 8,
    parameter MAX_STACK_BITS = 8
    )(
    output reg [STACK_WIDTH-1:0] dataOut = 0,
    output reg [MAX_STACK_BITS-1:0] stackSize = 0,
    input [STACK_WIDTH-1:0] dataIn, 
    input push, pop, reset, clk);
    
    
    reg [MAX_STACK_BITS-1:0] pStackSize = 0;
    wire [STACK_WIDTH-1:0] ramOut;
    reg [MAX_STACK_BITS-1:0] address;
    
    // writeEnable if push and size not exceeding
    assign writeEnable = push && stackSize != (1<<MAX_STACK_BITS)-1;
        
    BlockRam #(STACK_WIDTH, MAX_STACK_BITS) ram (ramOut,dataIn,address,1,writeEnable,clk);
    
    // Change data out only when pop
    always @(*)begin
        if(reset) 
            dataOut = 0;
        else if(pop && ! (pStackSize == 0 && stackSize == 0))
            dataOut = ramOut;
    end
    
    // Find ram address
    always @(*) begin
        if(writeEnable || stackSize == 0)
            address = stackSize;
        else
            address = stackSize-1;
    end
    
    // change stack size
    always @(posedge clk) begin
        pStackSize = stackSize;
        
        // reset
        if(reset) begin
            stackSize = 0;
            pStackSize = 0;
        end
        
        // push
        else if(push && stackSize != (1<<MAX_STACK_BITS)-1) 
            stackSize = stackSize + 1;
            
        // pop
        else if (pop && stackSize > 0) 
            stackSize = stackSize - 1;
    end   
    
endmodule
