module registerbank
    (input clk,
     input write,
     input [4:0] wrAddr,
     input [31:0] wrData,
     input [4:0] rdAddrA,
     output [31:0] rdDataA,
     input [4:0] rdAddrB,
     output [31:0] rdDataB);

    reg [31:0] mem [0:31];

    assign rdDataA = mem[rdAddrA];
    assign rdDataB = mem[rdAddrB];

    always @(posedge clk) begin
        if (write)
            mem[wrAddr] <= wrData;
    end // clk
endmodule
