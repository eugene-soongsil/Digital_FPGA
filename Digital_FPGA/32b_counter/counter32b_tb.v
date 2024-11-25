module counter32b_tb;

reg             i_rstn, i_clk, i_key2_clear, i_key1_mode;
reg [3:0]       i_rotary;
wire [3:0]      o_tled, o_kled;
wire [7:0]      o_led;

counter32b  counter(
    .i_rstn(i_rstn),
    .i_clk(i_clk),
    .i_key2_clear(i_key2_clear),
    .i_key1_mode(i_key1_mode),
    .i_rotary(i_rotary),
    .o_tled(o_tled),
    .o_kled(o_kled),
    .o_led(o_led)
);

initial begin
    i_rstn = 1;
    #10
    i_rstn = 0;
    #10
    i_rstn = 1;
end

initial begin
    #0;
    i_clk = 0;
    i_key1_mode = 1;
    i_key2_clear = 1;
    i_rotary = 0;
    repeat(16)begin
        repeat(3)begin
            #20000000; i_key1_mode = 0;
            #1000000; i_key1_mode = 1;
        end
        repeat(2)begin
            #100000000; i_key2_clear = 0;
            #10000000; i_key2_clear = 1;
        end
        #100000000;
        i_rotary = i_rotary + 1;
    end
end

//10MHz
always begin
    #50
    i_clk = ~i_clk;
end
    

endmodule