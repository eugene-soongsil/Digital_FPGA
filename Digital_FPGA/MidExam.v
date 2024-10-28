//---------------------------------------------------------------------------------------------------\\
//---------------------------------------chapter2. Example-------------------------------------------\\
//---------------------------------------------------------------------------------------------------\\

//-------------------------------ALU-----------------------------\\
module alu_4b(
    input   [3:0]   op_a, op_b,
    input   [3:0]   inst,
    output  [3:0]   alu_out
);

reg [3:0]   logic_out, arith_out, alu_out;

always@(*)begin
    if(inst[3] == 0)begin
        if(inst[0] == 0)
            alu_out = logic_out;
        else
            alu_out = ~logic_out;
    end
    else if(inst[3] == 1)
        alu_out = arith_out;
end

always@(*)begin
    if(inst[3] == 0)begin
        logic_out = 4'b0000;
        case(inst[2:1])
            2'b00 : logic_out = 4'b0000;
            2'b01 : logic_out = op_a & op_b;
            2'b10 : logic_out = op_a | op_b;
            2'b11 : logic_out = op_a ^ op_b;
            default : logic_out = 4'b0000;
        endcase
    end
end

always@(*)begin
    if(inst[3] == 1)begin
        arith_out = 4'b0000;
        case(inst[2:0])
            3'b000 : arith_out = op_a;
            3'b001 : arith_out = ~op_a;
            3'b010 : arith_out = op_a + 1;
            3'b011 : arith_out = op_a - 1;
            3'b100 : arith_out = op_a + op_b;
            3'b101 : arith_out = op_a - op_b;
            default : arith_out = 4'b0000;
        endcase
    end
end

endmodule

//---------------------------Up Ring Counter--------------------------\\
module counter_up(
    input               clk, rst,
    output reg [7:0]    cnt
);

always@(posedge clk or posedge rst)begin //posedge rst, because if(rst)
    if(rst)
        cnt <= 8'd0;
    else if(cnt == 8'd255) //not essential
        cnt <= 8'd0;
    else
        cnt <= cnt + 8'd1;
end

endmodule

//----------------------------BCD Counter----------------------------\\
module bcd_counter(
    input               clk,
    input               rst,
    output reg [3:0]    cnt
);

always@(posedge clk or posedge rst)begin
    if(rst)
        cnt = 4'd0;
    else if(cnt == 4'd9) //essential
        cnt = 4'd0;
    else
        cnt = cnt + 4'd1;
end

endmodule

//--------------------------BCD coutner SEG-------------------------------\\
module bcd_counter_segdis(
    input               clk, rst,
    output [7:0]        seg_com, seg_data
);

wire [3:0]  cnt;

bcd_counter counter(
    .clk(clk),
    .rst(rst),
    .cnt(w_cnt)
);

bcd_to_seg seg(
    .cnt(w_cnt)
    .seg_data(seg_data)
);

assign seg_com = 8'b0111_1111;

endmodule

//---------------------------------------------------------------------------------------------------\\
//-------------------------------------------Assignment----------------------------------------------\\
//---------------------------------------------------------------------------------------------------\\

//----------------------------8bit FullAdder-------------------------------\\
//HA
module HalfAdder(
    input           a, b,
    output          sum, cout
);

xor G1 (sum, a, b);
and G2 (cout, a, b);

endmodule
//FA
module FullAdder(
    input           a, b, cin,
    output          sum, cout
);

wire                s1, c1, c2;

xor                 (s1, a, b);
and                 (c1, a, b);
and G3              (c2, s1, cin);
xor G4              (sum, s1, cin);
xor G5              (cout, c1, c2);

endmodule
//8bit FA
module FullAdder_8bit(
    input   [7:0] a, b,
    input         cin,
    output  [7:0] sum,
    output        cout
);

wire [6:0] carry;

FullAdder FA0 (.a(a[0]), .b(b[0]), .cin(cin),      .sum(sum[0]), .cout(carry[0]));
FullAdder FA1 (.a(a[1]), .b(b[1]), .cin(carry[0]), .sum(sum[1]), .cout(carry[1]));
FullAdder FA2 (.a(a[2]), .b(b[2]), .cin(carry[1]), .sum(sum[2]), .cout(carry[2]));
FullAdder FA3 (.a(a[3]), .b(b[3]), .cin(carry[2]), .sum(sum[3]), .cout(carry[3]));
FullAdder FA4 (.a(a[4]), .b(b[4]), .cin(carry[3]), .sum(sum[4]), .cout(carry[4]));
FullAdder FA5 (.a(a[5]), .b(b[5]), .cin(carry[4]), .sum(sum[5]), .cout(carry[5]));
FullAdder FA6 (.a(a[6]), .b(b[6]), .cin(carry[5]), .sum(sum[6]), .cout(carry[6]));
FullAdder FA7 (.a(a[7]), .b(b[7]), .cin(carry[6]), .sum(sum[7]), .cout(cout));

endmodule

//TestBench
module tb_FullAdder_8bit;

reg [7:0] a, b;      
reg cin;             
wire [7:0] sum;      
wire cout;           

FullAdder_8bit UUT (
    .a(a),
    .b(b),
    .cin(cin),
    .sum(sum),
    .cout(cout)
);

initial begin
    a = 8'd0; b = 8'd10; cin = 1'b0;
    #100
    //a = 15, b = 10, cin = 0
    a = 8'd15; b = 8'd10; cin = 1'b0;
    #100
    //a = 255, b = 1, cin = 1
    a = 8'd255; b = 8'd1; cin = 1'b1;
    #100
    //a = 100, b = 55, cin = 0
    a = 8'd100; b = 8'd55; cin = 1'b0;
    #100
    //a = 128, b = 128, cin = 1
    a = 8'd128; b = 8'd128; cin = 1'b1;
    #100
    $finish;
end

endmodule

//-------------------------------Moore FSM---------------------------------\\
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

//TestBench
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

//---------------------------------Pulse------------------------------------\\
