module ram_consonant
(   
    input logic [5:0] addr,
    input logic clk,
    input logic w_en,
    input logic [7:0] w_data,
    output logic [7:0] r_data
);
    logic [7:0] mem [0:63];

   
    initial begin
        for (int i = 0; i < 64; i = i + 1) begin
            mem[i] = 8'h00;
        end
    end

    always_ff @(posedge clk) begin
        if (w_en) begin
            mem[addr] <= w_data;
        end
    end
    
    assign r_data = (addr < 64) ? mem[addr] : 8'h00;
endmodule