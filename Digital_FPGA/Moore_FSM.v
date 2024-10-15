module Moore_FSM(
    input               clk,
    input               reset,
    input               bypass,
    output reg [1:0]    out
);

reg [1:0]   state, next_state;

parameter ST0 = 2'd0,
          ST1 = 2'd1,
          ST2 = 2'd2,
          ST3 = 2'd3;

always@(posedge clk or negedge reset)begin
    if(~reset)
        state <= 0;
    else
        state <= next_state; 
end

always@(*)begin
    next_state = 2'd0;
    case(state)
        ST0 :
            next_state = ST1;
        ST1 : 
            if(bypass == 1)
                next_state = ST3;
            else
                next_state = ST2;
        ST2 :
            next_state = ST3;
    endcase
end

always@(*)begin
    out = 2'd0;
    case(state)
        ST0 :
            out = 2'd0;
        ST1 :
            out = 2'd1;
        ST2 :
            out = 2'd2;
        ST3 :
            out = 2'd3;
    endcase
end

endmodule