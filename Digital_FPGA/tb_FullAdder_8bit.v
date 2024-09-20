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