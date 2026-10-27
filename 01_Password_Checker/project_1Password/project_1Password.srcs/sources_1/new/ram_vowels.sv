module ram_vowels
(   
    input logic [5:0]addr,
    input logic clk,
    input logic w_en,
    input logic [7:0]w_data,
    output logic [7:0]r_data
);

logic [7:0]mem[0:63];

always_ff @(posedge clk)
    begin
        if(w_en)
            mem[addr] <= w_data;
    end
    
assign r_data = mem[addr];
endmodule