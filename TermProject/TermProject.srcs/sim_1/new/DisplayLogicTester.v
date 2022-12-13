`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/11/2022 10:28:30 PM
// Design Name: 
// Module Name: DisplayLogicTester
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


module DisplayLogicTester();
    wire [19:0] displayNumber;
    reg [15:0] number;
    reg minusFlag, errorFlag;

    DisplayLogic displayLogic_unit (.displayNumber(displayNumber), .number(number), .minusFlag(minusFlag), .errorFlag(errorFlag));

    initial begin    
        $monitor("displayNumber = %d %d %d %d %d", displayNumber[19:16], displayNumber[15:12], displayNumber[11:8], displayNumber[7:4], displayNumber[3:0]);

        #0
        number = 16'd9876;
        minusFlag = 1;
        errorFlag = 0;
        
        
        #10
        number = 16'd229;
        minusFlag = 1;
        errorFlag = 0;
        
        #10
        number = 16'd22;
        minusFlag = 1;
        errorFlag = 0;
        
        #10
        number = 16'd22;
        minusFlag = 1;
        errorFlag = 1;
    end
    
endmodule
