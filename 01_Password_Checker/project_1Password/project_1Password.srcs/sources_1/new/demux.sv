module demux
(
    input logic [7:0]in,
    input logic sel,
    output logic [7:0]out0,
    output logic [7:0]out1
);

always_comb
    begin
    out0 = 0;
    out1 = 0;
        case(sel)
            1'b0: out0 = in;
            1'b1: out1 = in;
        endcase
    end
endmodule
