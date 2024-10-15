module Moore_FSM_tb;

reg clk;
reg reset;
reg bypass;
wire [1:0] out;

Moore_FSM UUT (
    .clk(clk),
    .reset(reset),
    .bypass(bypass),
    .out(out)
);

initial begin
    clk = 0;
    reset = 1;
    bypass = 0;
    #10
    reset = 0;
    #10
    reset = 1;
    #40 //1cycle without bypass
    bypass = 1;
    #30 //1cycle with bypass
    #5
    $finish;
 end

always begin
    #5
    clk = ~clk;
end

endmodule