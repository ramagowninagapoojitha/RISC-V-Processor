module control_unit(
    input [6:0] opcode,
    input [2:0] funct3,
    input funct7,   // instr[30]

    output reg RegWrite,
    output reg ALUSrc,
    output reg MemWrite,
    output reg ResultSrc,
    output reg Branch,
    output reg [1:0] ImmSrc,
    output reg [2:0] ALUControl
);


always @(*) begin
    
    RegWrite  = 0;
    ALUSrc    = 0;
    MemWrite  = 0;
    ResultSrc = 0;
    Branch    = 0;
    ImmSrc    = 2'b00;

    case(opcode)

        // LOAD (lw)
        7'b0000011: begin
            RegWrite  = 1;
            ALUSrc    = 1;
            ResultSrc = 1;
            ImmSrc    = 2'b00;
        end

        // STORE (sw)
        7'b0100011: begin
            ALUSrc    = 1;
            MemWrite  = 1;
            ImmSrc    = 2'b01;
        end

        // R-TYPE
        7'b0110011: begin
            RegWrite  = 1;
            ALUSrc    = 0;
        end

        // I-TYPE (addi)
        7'b0010011: begin
            RegWrite  = 1;
            ALUSrc    = 1;
            ImmSrc    = 2'b00;
        end

        // BRANCH (beq)
        7'b1100011: begin
            Branch    = 1;
            ImmSrc    = 2'b10;
        end

        default: begin
            // keep defaults
        end

    endcase
end



always @(*) begin
    case(opcode)

        // R-TYPE
        7'b0110011: begin
            case({funct7, funct3})
                4'b0000: ALUControl = 3'b000; // ADD
                4'b1000: ALUControl = 3'b010; // SUB
                4'b0111: ALUControl = 3'b111; // AND
                4'b0110: ALUControl = 3'b110; // OR
                4'b0100: ALUControl = 3'b100; // XOR (optional)
                default: ALUControl = 3'b000;
            endcase
        end

        // ADDI
        7'b0010011: ALUControl = 3'b000;

        // LOAD
        7'b0000011: ALUControl = 3'b000;

        // STORE
        7'b0100011: ALUControl = 3'b000;

        // BRANCH
        7'b1100011: ALUControl = 3'b010;

        default: ALUControl = 3'b000;

    endcase
end

endmodule













