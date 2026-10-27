module vowel_checker_struct
(
    input [7:0]data_in,
    output logic is_vowel
);

always_comb
    begin
        is_vowel = 0;
        case(data_in)
            8'd61: is_vowel = 1;
            8'd65: is_vowel = 1;
            8'd69: is_vowel = 1;
            8'd111: is_vowel = 1;
            8'd117: is_vowel = 1;
            default: is_vowel = 0;
        endcase
    end
endmodule