module alu
(
    input [7:0] a, b,
    input in,
    output [7:0] out
);
assign out = a + b + in;
endmodule