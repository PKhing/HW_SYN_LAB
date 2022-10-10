`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/08/2022 09:51:29 PM
// Design Name: 
// Module Name: cpuTester
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


module cpuTester();
    
    reg 	[31:0]	p_data;
    wire	[31:0]	d_data;
    wire	[31:0]	d_address;
    reg     [2:0] alu_op;
    reg		clock;
    reg		nreset;
    reg     st = 0;

    nanocpu	CPU(.p_data(p_data),.d_data(d_data),.clock(clock),.nreset(nreset),.d_address(d_address));

    always #10 clock = ~clock;

    always begin
        #20
        // Add ALU r2, r0,r1
        if(st)p_data =  {29'b000001_00000_00001_00010_00000000, alu_op};

        #20
        // write
        if(st)p_data = 32'b011100_00010_00010_0000000000000000;
        if(st)alu_op = alu_op+1;
    end

    initial begin
        #0
        clock = 0;
        nreset = 0;
        alu_op = 0;
        
        #40
        nreset = 1;

        #20
        //set A
        p_data = 32'b010000_00000_00000_0000000000000011;

        #20
        //set B
        p_data = 32'b010000_00001_00001_0000000000000010;
        
        #20
        // writemem SW r0 0(r0)
        p_data = 32'b011100_00000_00000_0000000000000001;

        #20
        // writemem SW r1 0(r1)
        p_data = 32'b011100_00001_00001_0000000000000000;
        
        #20
        st = 1;

        #320
        $finish;
    end

endmodule
