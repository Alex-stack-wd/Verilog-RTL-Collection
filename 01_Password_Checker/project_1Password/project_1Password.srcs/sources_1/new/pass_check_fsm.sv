module pass_check_fsm
(
    input logic clk,
    input logic rst,
    input logic en,
    input logic [7:0]data_in,
    output logic pass_ok
);

localparam [3:0]stare_0 = 0;
localparam [3:0]stare_1 = 1;
localparam [3:0]stare_2 = 2;
localparam [3:0]stare_3 = 3;
localparam [3:0]stare_4 = 4;
localparam [3:0]stare_5 = 5;
localparam [3:0]stare_6 = 6;

logic [3:0] state, state_next;
always_ff @(posedge clk)
    begin
        if(rst == 1)
            state <= stare_0;
        else
            state <= state_next;
    end

always_comb
    begin
        pass_ok = 0;
        case(state)
            stare_0:
                begin
                 pass_ok = 0;
                 state_next = stare_1;
                end
            stare_1:
                begin
                    if(en == 1 && data_in == 61)
                        begin 
                            state_next = stare_2;
                        end
                    else if(en == 0 && data_in != 61)
                        begin
                         state_next = stare_1;
                         end
                    else
                        begin
                        state_next = stare_0;
                        end
                end
                
            stare_2:
                begin
                    if(en == 1 && data_in == 108)
                        begin 
                            state_next = stare_3;
                        end
                    else if(en == 0 && data_in != 108)
                        begin
                         state_next = stare_2;
                         end
                    else
                        begin
                        state_next = stare_0;
                        end
                end
                
              stare_3:
                begin
                    if(en == 1 && data_in == 101)
                        begin 
                            state_next = stare_4;
                        end
                    else if(en == 0 && data_in != 101)
                    begin
                         state_next = stare_3;
                         end
                    else
                    begin
                        state_next = stare_0;
                        end 
                end
                
                stare_4:
                begin
                    if(en == 1 && data_in == 120)
                        begin 
                            state_next = stare_5;
                        end
                    else if(en == 0 && data_in != 120)
                    begin
                         state_next = stare_4;
                         end
                    else
                    begin
                        state_next = stare_0;
                        end
                end
               
               stare_5:
                begin
                    if(en == 1 && data_in == 61)
                        begin 
                            state_next = stare_6;
                        end
                    else if(en == 0 && data_in != 61)
                    begin
                         state_next = stare_5;
                         end
                    else
                    begin
                        state_next = stare_0;  
                        end
                end
                
                stare_6:
                    begin
                    pass_ok = 1;
                    state_next = stare_0;
                    end
        endcase 
    end
endmodule