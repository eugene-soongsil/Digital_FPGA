module FullAdder(
    input           a, b, cin,
    output          sum, cout
);
dd
wire                s1, c1, c2;

xor                 (s1, a, b);
and                 (c1, a, b);
and G3              (c2, s1, cin);
xor G4              (sum, s1, cin);
xor G5              (cout, c1, c2);

endmodule
