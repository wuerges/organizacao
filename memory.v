module memory
    (input w,
     input [31:0] w_addr,
     input [31:0] w_data,

     input [31:0] r_addr,
     output [31:0] r_data
    );

    reg [31:0] bank [0:4096];

    assign r_data = bank[r_addr];

    always @ (w) 
    begin
        if (w)
            bank[w_addr] = w_data;
    end
endmodule
