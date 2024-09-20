module HalfAdder(
    input           a, b,
    output          sum, cout
);

xor G1 (sum, a, b);
and G2 (cout, a, b);

endmodule