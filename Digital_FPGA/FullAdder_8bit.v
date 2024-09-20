module FullAdder_8bit(
    input   [7:0] a, b,
    input         cin,
    output  [7:0] sum,
    output        cout
);

wire [6:0] carry;

FullAdder FA0 (.a(a[0]), .b(b[0]), .cin(cin),     .sum(sum[0]), .cout(carry[0]));
FullAdder FA1 (.a(a[1]), .b(b[1]), .cin(carry[0]), .sum(sum[1]), .cout(carry[1]));
FullAdder FA2 (.a(a[2]), .b(b[2]), .cin(carry[1]), .sum(sum[2]), .cout(carry[2]));
FullAdder FA3 (.a(a[3]), .b(b[3]), .cin(carry[2]), .sum(sum[3]), .cout(carry[3]));
FullAdder FA4 (.a(a[4]), .b(b[4]), .cin(carry[3]), .sum(sum[4]), .cout(carry[4]));
FullAdder FA5 (.a(a[5]), .b(b[5]), .cin(carry[4]), .sum(sum[5]), .cout(carry[5]));
FullAdder FA6 (.a(a[6]), .b(b[6]), .cin(carry[5]), .sum(sum[6]), .cout(carry[6]));
FullAdder FA7 (.a(a[7]), .b(b[7]), .cin(carry[6]), .sum(sum[7]), .cout(cout));

endmodule