//INSTRUCTION MEMORY
module inst_mem(
input [31:0]A,
output [31:0]RD);
reg [31:0]memory[63:0];
assign RD=memory[A[31:2]];
initial begin
    $readmemh("program.mem", memory);
end

endmodule
