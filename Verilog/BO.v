`include "Registrador.v"
`include "Multiplexador.v"
`include "Ula.v"

module BO (
    input clk,
    input signed [15:0] a,
    input signed [15:0] b,
    input signed [15:0] c,
    input signed [7:0] x,
    input [1:0]m0,
    input [1:0]m1,
    input [1:0]m2,
    input h,
    input lx,
    input ls,
    input lh,
    output signed [15:0] resultado

);

    wire signed [15:0] x16;
    assign x16 = x;
    wire signed [15:0] outX;
    wire signed [15:0] outS;
    wire signed [15:0] outH;
    wire signed [15:0] outMux0;
    wire signed [15:0] outMux1;
    wire signed [15:0] outMux2;
    wire signed [15:0] outUla;

    Registrador RegistradorLX(x16, clk, lx, outX);
    Registrador RegistradorLS(outUla, clk, ls, outS);
    Registrador RegistradorLH(outUla, clk, lh, outH);

    Multiplexador mux0(a, a, b, c, m0, outMux0);
    Multiplexador mux1(outMux0, outX, outS, outH, m1, outMux1);
    Multiplexador mux2(outX, outMux0, outS, outH, m2, outMux2);

    Ula ula0(outMux1, outMux2, h, outUla);

    assign resultado = outS;
    
endmodule