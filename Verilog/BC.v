module BC (
    input permit,
    input clk,
    input rst,
    output [1:0] m0,
    output [1:0] m1,
    output [1:0] m2,
    output h,
    output lx,
    output ls,
    output lh,
    output feito,
    output ready
);

    reg[3:0] estado;
    always @(posedge clk or rst)
    begin
        if (rst)
            estado <= 0;
        else begin
            if ((estado == 0 && ~permit) || estado == 7)
                estado <= 0;
            else 
                estado <= estado + 1;
        end
    end
    
    assign h = estado == 1 ? 1 : estado == 2 ? 1 : estado == 3 ? 1 : estado == 4 ? 1 : 0;
    assign ls = estado == 2 ? 1 : estado == 3 ? 0 : estado == 4 ? 1 : estado == 5 ? 0 : estado == 6 ? 1 : estado == 7 ? 0 : estado == 8 ? 0 : 0;
    assign lh = estado == 2 ? 0 : estado == 3 ? 1 : estado == 4 ? 0 : estado == 5 ? 1 : 0;
    assign lx = estado == 1 ? 1 : estado == 2 ? 0 : estado == 3 ? 0 : 0;
    assign m0 = estado == 3 ? 1 : estado == 4 ? 2 : estado == 6 ? 3 : 0;
    assign m1 = estado == 2 ? 1 : estado == 3 ? 0 : estado == 4 ? 0 : estado == 5 ? 3 : estado == 6 ? 3 : 0;  
    assign m2 = estado == 2 ? 0 : estado == 3 ? 2 : estado == 4 ? 0 : estado == 5 ? 2 : estado == 6 ? 1 : 0;
    assign ready = estado == 0 ? 1 : 0; 
    assign feito = estado == 7 ? 1 : 0;
        
endmodule
