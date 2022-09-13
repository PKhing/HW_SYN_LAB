module BcdCounterTester();
    reg clk, up, down, set9, set0;
    wire [3:0] count;
    wire bout, cout;
    
    BcdCounter counter(count,cout,bout,up,down,set9,set0,1,clk);
    
    always #10 clk = ~clk;
    
    initial
    
    begin 
        #0
        up = 0;
        down = 0;
        set9 = 0;
        set0 = 0;
        clk = 0;
        
        #30
        up = 1;
        
        
        #250
        up = 0;
        down = 1;
        
        #300
        down = 0;
        set0 = 1;
        
        #50
        set0 = 0;
        
        #50
        set9 = 1;
        
        #50
        set9 = 0;
        
        $finish;
    end
endmodule