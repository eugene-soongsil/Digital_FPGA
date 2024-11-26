
module tb_seg7disp;

reg clk;
reg rstn;

reg       key_0;
reg [3:0] rotary;
reg [7:0] dip;

wire [7:0] seg_d, seg_com;

  seg7disp seg7(
      .i_rstn   (rstn),
      .i_clk    (clk),
      .i_key0   (key_0),
      .i_dip    (dip),
      .i_rotary (rotary),
      .o_seg_d  (seg_d),
      .o_seg_com(seg_com)
  );

initial begin
    #0;  rstn=0; clk = 0;
    #10000; rstn=1;
end

always begin
    #50
    clk = ~clk;
end

initial begin
    #0;
    key_0  = 1;
    rotary = 0;
    dip=1;
    repeat(16) begin
        dip=1;
        #100_000;
        repeat(7) begin
            dip = dip << 1 ;
            #100_000;
        end
        rotary = rotary+1;
    end
    key_0  = 0;
    repeat(16) begin
        dip=1;
        #100_000;
        repeat(7) begin
            dip = dip << 1 ;
            #100_000;
        end
        rotary = rotary+1;
    end
    $finish;
end

endmodule
