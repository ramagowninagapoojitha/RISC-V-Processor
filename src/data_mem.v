module data_mem(
    input clk,
    input MWE,                 // MemWrite
    input [31:0] MA,           // address
    input [31:0] MWD,          // write data
    output [31:0] MRD          // read data
);

reg [31:0] memory [0:63];

// READ (asynchronous)
assign MRD = memory[MA[31:2]];

// WRITE (synchronous)
always @(posedge clk) begin
    if (MWE)
        memory[MA[31:2]] <= MWD;
end

endmodule





