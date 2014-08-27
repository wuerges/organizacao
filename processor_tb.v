
module processor_test;

    /* Make a reset that pulses once. */
    reg wb, alu_sum, mem_wb, eq_in, lt_in, reset_st, set_st, imm_wb;
    reg [4:0] dest, source1, source2;
    wire [4:0] target;

    initial begin
        # 0 alu_sum = 0; wb = 0; mem_wb = 0; imm_wb = 0; eq_in = 0; lt_in = 0; reset_st = 0; set_st = 0; dest = 0; source1 = 0; source2 = 0; 
        # 10 alu_sum = 0; wb = 1; mem_wb = 0; imm_wb = 1; eq_in = 0; lt_in = 0; reset_st = 0; set_st = 0; dest = 1; source1 = 0; source2 = 0;
        # 20 alu_sum = 0; wb = 0; mem_wb = 0; imm_wb = 0; eq_in = 0; lt_in = 0; reset_st = 0; set_st = 0; dest = 0; source1 = 0; source2 = 0;
        # 30 alu_sum = 0; wb = 0; mem_wb = 0; imm_wb = 0; eq_in = 0; lt_in = 0; reset_st = 0; set_st = 0; dest = 0; source1 = 0; source2 = 0;
        # 40 alu_sum = 0; wb = 0; mem_wb = 0; imm_wb = 0; eq_in = 0; lt_in = 0; reset_st = 0; set_st = 0; dest = 0; source1 = 0; source2 = 0;

        # 100 $stop;
    end

    /* Make a regular pulsing clock. */
    reg clk = 0;
    always #5 clk = !clk;

    processor p1 (clk, alu_sum, wb, mem_wb, imm_wb, eq_in, lt_in, reset_st, set_st, dest, source1, source2, target);

    initial
        $monitor("At time: %t, bank[0]: %d, target: %d", $time, p1.bank[0], target);

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
     input [4:0] source3,
     output [4:0] target
    )
*/
