
module registertest;

    /* Make a reset that pulses once. */
    reg write;
    reg [31:0] wrData;
    wire [31:0] rdDataA, rdDataB;
    reg [4:0] wrAddr, rAddrA, rAddrB;
    initial begin
        # 0 rAddrA = 6;
            wrAddr = 3;
            wrData = 666;
            write = 0;
        # 40 write = 1;
        # 45 write = 0;
        # 70 rAddrA = 3;

        # 100 $stop;

    end

    /* Make a regular pulsing clock. */
    reg clk = 0;
    always #5 clk = !clk;

    registerbank c1 (clk, write, wrAddr, wrData, rAddrA, rdDataA, rAddrB, rdDataB);

    initial
        $monitor("At time %t, rdDataA = %d", $time, rdDataA);

endmodule // test
