module Calculator (
    output reg isminus, showerror, 
    output reg [31:0] numOut, reg [2:0] op, [4:0] state,
    input ack, [2:0] flag, [3:0] numIn, clk
);
    reg [4:0] state, nstate;
    reg error, selB;
    reg [31:0] numA, numB, numAns;

    localparam NUM=3'd0;
    localparam ADD=3'd1;
    localparam SUB=3'd2;
    localparam MUL=3'd3;
    localparam DIV=3'd4;
    localparam ENTER=3'd5;
    localparam CLEAR=3'd6;
    localparam RESET=3'd7;

    initial begin
    state=0;
    nstate=0;
    numA=0;
    isminus=0;
    error=0;
    showerror=0;
    end

    always @(posedge clk) begin
        case (state)
            5'd0: begin //Reset State
                numA=0;
                numOut=0;
                error=0;
                isminus=0;
                op=0;
                showerror=0;
            end
            5'd2: begin
                if (numA<1000) begin
                    numA = numA*10 + numIn;
                end
                numOut = numA;
            end
            5'd3: isminus = ~isminus;
            5'd4: if (isminus!=0) begin 
                numA=-numA;
            end
            5'd5: begin
                numB=0;
                selB=0;
            end
            5'd6: begin //Show op
                op=flag;
            end
            5'd8: begin //Input numB
                selB=1;
                isminus=0;
                showerror=0;
                if (numB<1000) begin
                    numB = numB*10 + numIn;
                end
                numOut = numB;
            end
            5'd9: begin //Reset numB
                numB=0;
                numOut=0;
                selB=1;
                showerror=0;
                isminus=0;
            end
            5'd10: if(selB==0) numB=numA;
            5'd11: numAns = numA + numB;
            5'd12: numAns = numA - numB;
            5'd13: numAns = numA * numB;
            5'd14: error=1;
            5'd15: begin 
                if (numA[31]) begin 
                    numA = -numA;
                    isminus=1;
                end
                numAns = numA / numB;
                if (isminus) numAns = -numAns;
            end
            5'd16: begin
                numA=numAns;
                if (numAns[31]) begin
                    numAns= -numAns;
                    isminus=1;
                end
                if (numAns>9999) error=1;
            end
            5'd17: begin
                numOut=numAns;
                showerror=error;
            end
            5'd19: begin //Reset State
                numA=0;
                error=0;
                isminus=0;
                op=0;
                showerror=0;
            end
        endcase
    end

    always @(posedge clk) begin
        case (state)
            5'd0: nstate = 5'd1;
            5'd1: begin
                if (ack) begin
                    case (flag)
                        CLEAR,RESET: nstate = 5'd0;
                        NUM: nstate = 5'd2;
                        ENTER: nstate = 5'd1;
                        SUB: if(numA==0) nstate = 5'd3; else nstate = 5'd4;
                        default: nstate = 5'd4;
                    endcase
                end
            end
            5'd2: nstate = 5'd20;
            5'd3: nstate = 5'd1;
            5'd4: nstate = 5'd5;
            5'd5: nstate = 5'd6;
            5'd6: nstate = 5'd7;
            5'd7: begin
                if (ack) begin
                    case (flag)
                        RESET: nstate = 5'd0;
                        CLEAR: nstate = 5'd9;
                        NUM: nstate = 5'd8;
                        ENTER:  nstate = 5'd10;
                        default: begin
                            if (selB) nstate = 5'd10; else nstate = 5'd6;
                        end
                    endcase
                end
            end
            5'd8: nstate = 5'd7;
            5'd9: nstate = 5'd7;
            5'd10: begin
                case (op)
                    ADD : nstate = 5'd11;
                    SUB : nstate = 5'd12;
                    MUL : nstate = 5'd13;
                    DIV : if (numB==0) nstate = 5'd14; else nstate = 5'd15;
                    default: nstate = 5'd7;
                endcase
            end
            5'd11: nstate = 5'd16;
            5'd12: nstate = 5'd16;
            5'd13: nstate = 5'd16;
            5'd14: nstate = 5'd16;
            5'd15: nstate = 5'd16;
            5'd16: nstate = 5'd17;
            5'd17: if (flag==ENTER) nstate = 5'd18; else nstate = 5'd5;
            5'd18: begin
                if (ack) begin
                    case (flag)
                        ENTER: nstate = 5'd10;
                        NUM: nstate = 5'd19;
                        RESET: nstate = 5'd0;
                        CLEAR: nstate = 5'd0;
                        default: nstate = 5'd5;
                    endcase
                end
            end
            5'd19: nstate = 5'd2;
            5'd20: nstate = 5'd1; //State Delay
            default: nstate = 5'd0;
        endcase
    end

    always @(*) begin
        state = nstate;
    end
endmodule