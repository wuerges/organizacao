
module processor 
    (input clk,

     input alu_sum,
     input wb,
     input mem_wb,
     input imm_wb,

     input eq_in,
     input lt_in,
     input reset_st,
     input set_st,

     input [4:0] dest,
     input [4:0] source1,
     input [4:0] source2,
     output [4:0] target
    );

    reg signed [31:0] bank [0:31];
    reg eq_r, lt_r;
    reg [4:0] d_r;
    wire st = (eq_r == eq_in) & (lt_r == lt_in);

    assign eq = eq_r == eq_in;
    assign lt = lt_r == lt_in;

    reg st_wb, memw_r;
    assign target = alu_out;

    wire [31:0] mem_out;
    reg [31:0] mem_in, alu_out;
    reg signed [15:0] imm_r;

    memory m1 (memw_r, alu_out, mem_in, alu_out, mem_out); 

    initial begin
        bank[0] = 0;
        imm_r = 0;
    end
    
    always @(negedge clk) begin
        if (alu_sum)
            alu_out = bank[source1] + bank[source2] + imm_r;
        else 
            alu_out = bank[source1] - bank[source2] + imm_r;
        
        if (wb)
            bank[dest] = alu_out;

        if (imm_wb)
            imm_r = { source1, source2, dest };
        else
            imm_r = imm_r;

        if (mem_wb)
            mem_in = bank[dest] + imm_r;

        st_wb = set_st;
        if (reset_st) begin
            eq_r = 0;
            lt_r = 0;
            st_wb = 0;
        end else if (st_wb) begin
            eq_r = alu_out == 0;
            lt_r = alu_out < 0;
        end
    end
endmodule
