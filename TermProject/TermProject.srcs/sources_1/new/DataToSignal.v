module DataToSignal (
    output reg [2:0] flag, reg [3:0] numIn,
    input [7:0] data, ready, clk
);
    localparam NUM=3'd0;
    localparam ADD=3'd1;
    localparam SUB=3'd2;
    localparam MUL=3'd3;
    localparam DIV=3'd4;
    localparam ENTER=3'd5;
    localparam CLEAR=3'd6;
    localparam RESET=3'd7;
    always @(ready) begin
        case (data)
            8'b00110000: begin
                flag=0;
                numIn=4'd0;
            end 
            8'b00110001: begin
                flag=0;
                numIn=4'd1;
            end 
            8'b00110010: begin
                flag=0;
                numIn=4'd2;
            end 
            8'b00110011: begin
                flag=0;
                numIn=4'd3;
            end 
            8'b00110100: begin
                flag=0;
                numIn=4'd4;
            end 
            8'b00110101: begin
                flag=0;
                numIn=4'd5;
            end
            8'b00110110: begin
                flag=0;
                numIn=4'd6;
            end
            8'b00110111: begin
                flag=0;
                numIn=4'd7;
            end
            8'b00111000: begin
                flag=0;
                numIn=4'd8;
            end
            8'b00111001: begin
                flag=0;
                numIn=4'd9;
            end
            8'b00101011: flag=ADD;
            8'b00101101: flag=SUB;
            8'b00101010: flag=MUL;
            8'b00101111: flag=DIV;
            8'b00001101: flag=ENTER;
            8'b00001000: flag=CLEAR;
            8'b00011011: flag=RESET;
        endcase
    end
endmodule