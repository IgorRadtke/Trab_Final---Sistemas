module Ula(
    input [15:0] a,
    input [15:0] b,
    input h,
    output [15:0] result
);
    assign result = h ? a * b : a + b;

endmodule