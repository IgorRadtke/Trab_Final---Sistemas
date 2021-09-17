module Registrador (

    input signed [15:0] entrada,
    input clk,
    input r,
    output reg signed [15:0] result
);
    always @(posedge clk) begin
        if (r == 1) begin
            result <= entrada;
        end
    end

endmodule