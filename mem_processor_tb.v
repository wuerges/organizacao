module mem_processor_test;

    mem_processor p1 (clk);

    /* Make a reset that pulses once. */
    initial begin
        p1.pc = 0;
        p1.m1.bank[0] = 0;
        p1.m1.bank[1] = 0;
        p1.m1.bank[2] = 0;
        p1.m1.bank[3] = 0;
        p1.m1.bank[4] = 0;
        p1.m1.bank[5] = 0;
        p1.m1.bank[6] = 0;

        # 0
        # 100 $stop;
    end

    /* Make a regular pulsing clock. */
    reg clk = 0;
    always #5 clk = !clk;


    initial
        $monitor("At time: %t, pc: %d", $time, p1.pc);

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
