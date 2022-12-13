`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/11/2022 10:02:29 PM
// Design Name: 
// Module Name: DisplayLogic
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


module DisplayLogic(
    output reg [19:0] displayNumber, 
    input [15:0] number, 
    input minusFlag, errorFlag
    );

    localparam Minus = 4'd10;
    localparam N = 4'd11;
    localparam Slash = 4'd12;
    localparam A = 4'd13;
    localparam Blank = 4'd14;

    always @(*) begin
        if(errorFlag) 
            displayNumber = {Blank,N,Slash,A,Blank};
        else begin
            // Number
            displayNumber[19:16] = Blank;
            if (number <= 999)
                displayNumber[15:12] = Blank;
            else
                displayNumber[15:12] = number/1000;
            if (number <= 99)
                displayNumber[11:8] = Blank;
            else
                displayNumber[11:8] = (number/100)%10;
            if (number <= 9)
                displayNumber[7:4] = Blank;
            else
                displayNumber[7:4] = (number/10)%10;
            displayNumber[3:0] = number%10;

            // Minus
            if(minusFlag) begin
                if (displayNumber[7:4] == Blank)
                    displayNumber[7:4] = Minus;
                else if (displayNumber[11:8] == Blank)
                    displayNumber[11:8] = Minus;
                else if (displayNumber[15:12] == Blank)
                    displayNumber[15:12] = Minus;
                else
                    displayNumber[19:16] = Minus;
            end
        end
    end
    
endmodule
