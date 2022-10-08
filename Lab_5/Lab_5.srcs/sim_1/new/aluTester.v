`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/08/2022 09:18:36 PM
// Design Name: 
// Module Name: aluTester
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


module aluTester();
    reg [31:0] A,B;
    wire [31:0] S;
    wire z,Cout;
    reg [2:0] alu_ops;
    reg Cin;

    alu ALU (S,z,Cout,A,B,Cin,alu_ops);


    initial begin
        #0 
        Cin = 0;
        alu_ops = 3'd0;
        A = 2;
        B = 3;
        
        #20
        Cin = 1;

        #20
        alu_ops = 3'd1;
        
        #20
        alu_ops = 3'd2;
        
        #20
        alu_ops = 3'd3;
        
        #20
        alu_ops = 3'd4;
        
        #20
        alu_ops = 3'd5;
        
        #20
        alu_ops = 3'd6;
        
        #20
        alu_ops = 3'd7;

        #20
        A = 3;
        alu_ops = 3'd1;

        #20
        $finish;
        
    end 
endmodule
