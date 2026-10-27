module reg_6b
(
    input logic [5:0] in,
    input logic clk,
    input logic rst,
    output logic [5:0] out
);

always_ff @(posedge clk)
    begin
        if(rst == 1)
            out <= 0;
        else 
            out <= in;
    end
endmodule