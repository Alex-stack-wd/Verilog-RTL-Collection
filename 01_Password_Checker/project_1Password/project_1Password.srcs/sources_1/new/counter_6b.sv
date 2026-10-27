module counter_6b
(
    input logic clk,
    input logic rst,
    input logic en,
    output logic [5:0]out
);

always_ff @(posedge clk)
    begin   
        if(rst == 1)
            out <= 0;
        else 
            if(en == 1)
                out <= out+1;
    end
endmodule