module sign_extender(
    input [31:0] instr,
    input [1:0] ImmSrc,
    output reg [31:0] ImmExt
);

always @(*) begin
    case(ImmSrc)

        // I-TYPE (addi, lw)
        2'b00: begin
            ImmExt = {{20{instr[31]}}, instr[31:20]};
        end

        // S-TYPE (sw)
        2'b01: begin
            ImmExt = {{20{instr[31]}}, instr[31:25], instr[11:7]};
        end

        // B-TYPE (beq)
        2'b10: begin
            ImmExt = {{19{instr[31]}}, instr[31], instr[7],
                      instr[30:25], instr[11:8], 1'b0};
        end

        default: ImmExt = 32'd0;

    endcase
end

endmodule

