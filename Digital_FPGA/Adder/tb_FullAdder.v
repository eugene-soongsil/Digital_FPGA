module  tb_FullAdder;

reg     a, b, cin;
wire    sum, cout;

FullAdder       Test(
    .a(a),
    .b(b),
    .sum(sum),
    .cin(cin),
    .cout(cout)
);

initial begin
    //cin = 0;
    cin = 0; a = 0; b = 0;
    #100  
    a = 1; b = 0;
    #100
    a = 0; b = 1;
    #100
    a = 1; b = 1;
    #100
    //cin = 1;
    cin = 1; a = 0; b = 0;
    #100  
    a = 1; b = 0;
    #100
    a = 0; b = 1;
    #100
    a = 1; b = 1;
    #100
    $finish;
end

endmodule