module top
(
    input logic clk,
    input logic rst,
    input logic en,
    input logic [7:0]data_in,
    output logic [7:0]data_read,
    output logic [7:0]consonants,
    output logic [7:0]vowels,
    output logic check
);


logic [5:0]fir_counter_6b;
counter_6b a
(
    .clk(clk),
    .rst(rst),
    .en(en),
    .out(fir_counter_6b)
);

logic [5:0]fir_reg_6b;
reg_6b b
(
    .clk(clk),
    .rst(rst),
    .in(fir_counter_6b),
    .out(fir_reg_6b)
);


logic fir_is_vowel;
vowel_checker_struct c
(   
    .data_in(data_in),
    .is_vowel(fir_is_vowel)
);

pass_check_fsm d
(
    .clk(clk),
    .rst(rst),
    .en(en),
    .data_in(data_in),
    .pass_ok(check)
);

ram_consonant e
(
    .clk(clk),
    .addr(fir_counter_6b),
    .w_en(en & ~fir_is_vowel),
    .w_data(data_in),
    .r_data(data_read)
);

ram_vowels f
(
    .clk(clk),
    .addr(fir_reg_6b),
    .w_en(en & fir_is_vowel),
    .w_data(data_in),
    .r_data()
);

demux g
(
    .in(data_in),
    .sel(fir_is_vowel),
    .out0(consonants),
    .out1(vowels)
);
endmodule
