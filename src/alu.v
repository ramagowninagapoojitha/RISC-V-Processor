module alu(
    input [2:0] sel,
    input [31:0] a,
    input [31:0] b,
    output reg [31:0] out,
    output zero,
    output sign
);

always @(*) begin
    case(sel)
        3'b000: out = a + b;   // ADD
        3'b010: out = a - b;   // SUB
        3'b111: out = a & b;   // AND
        3'b110: out = a | b;   // OR
        3'b100: out = a ^ b;   // XOR (optional)
        default: out = 32'd0;
    endcase
end

assign zero = (out == 32'd0);
assign sign = out[31];

endmodule
  
  
  
  
  
  
