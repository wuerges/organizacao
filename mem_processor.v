
module mem_processor
    (input clk);

    /* Make a reset that pulses once. */

    reg [31:0] pc;
    reg wb, alu_sum, mem_wb, eq_in, lt_in, reset_st, set_st, imm_wb;
    reg [4:0] dest, source1, source2;
    wire [4:0] target;

    processor p1 (clk, alu_sum, wb, mem_wb, imm_wb, eq_in, lt_in, reset_st, set_st, dest, source1, source2, target);

    wire [31:0] instruction;
    memory m1 (0, 0, 0, pc, instruction); 

    always @ (clk) begin
        alu_sum = instruction[0];
        wb = instruction[1];
        mem_wb = instruction[2];
        imm_wb = instruction[3];
        eq_in = instruction[4];
        lt_in = instruction[5];
        reset_st = instruction[6];
        set_st = instruction[7];
        dest = instruction[12:8];
        source1 = instruction[12:8];
        source2 = instruction[17:13];

        if (instruction[31])
            pc = pc + target;
        else
            pc = pc + 1;
    end

endmodule // test

/* (input clk,

     input alu_sum,
     input wb,
     input mem_wb,

     input eq_in,
     input lt_in,
     input reset_st,
     input set_st,

     input [4:0] dest,
     input [4:0] source1,
     input [4:0] source2,
     output [4:0] target
    )
*/
