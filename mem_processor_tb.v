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
        p1.m1.bank[6] = 'b00000_00000_00010_0000_1000;
        p1.m1.bank[7] = 'b00000_00000_00010_0000_0010;
        p1.m1.bank[8] = 'b00000_00000_00001_0000_1000;
        p1.m1.bank[9] = 'b00000_00000_00001_0000_0010;
        p1.m1.bank[10] = 'b00000_00000_00000_0000_1000;
        p1.m1.bank[11] = 'b00010_00001_00000_0000_0010;
        p1.m1.bank[12] = 'b1_00000_00000_00000_0000_0000;
        p1.m1.bank[13] = 'b0_00000_00000_00000_0000_0000;
        p1.m1.bank[14] = 'b0_00000_00000_00000_0000_0000;

        # 0
        # 1000 $stop;
    end

    /* Make a regular pulsing clock. */
    reg clk = 0;
    always #5 clk = !clk;


    initial begin
        // $monitor("At time: %t, pc: %d, target: %d", $time, p1.pc, p1.target);
        // $monitor("At time: %t, imm_r: %d", $time, p1.p1.imm_r);
        $monitor("At time: %t, i: %h, pc: %h, (bank: %h %h %h), imm_r: %h (s1: %h s2: %h d: %h imwb: %d) target %h", 
                    $time, 
                    p1.instruction,
                    p1.pc,
                    p1.p1.bank[0], p1.p1.bank[1], p1.p1.bank[2], 
                    p1.p1.imm_r,
                    p1.p1.source1, p1.p1.source2, p1.p1.dest, p1.p1.imm_wb,
                    p1.p1.target
                );
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
     input [4:0] source3,
     output [4:0] target
    )
*/
