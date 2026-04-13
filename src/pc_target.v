//pc_target
module pc_target(
    input [31:0] PC_current,
    input [31:0] ImmExt,
    output [31:0] PCTarget
);
assign PCTarget = PC_current + ImmExt;

endmodule

