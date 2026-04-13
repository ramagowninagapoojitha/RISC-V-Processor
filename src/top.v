module top(
    input clk,
    input rst
);

//CONTROL SIGNALS 
wire RegWrite;
wire MemWrite;
wire Branch;
wire ALUSrc;
wire ResultSrc;
wire [2:0] ALUControl;
wire [1:0] ImmSrc;

// DATAPATH SIGNALS 
wire [31:0] instr;
wire [31:0] rd1, rd2;
wire [31:0] ImmExt;
wire [31:0] srcB;
wire [31:0] ALUResult;
wire [31:0] ReadData;
wire [31:0] Result;


wire zero;


wire [31:0] PC, PCNext, PCPlus4, PCTarget;



inst_mem IM(
    .A(PC),
    .RD(instr)
);


// CONTROL UNIT 
control_unit CU(
    .opcode(instr[6:0]),
    .funct3(instr[14:12]),
    .funct7(instr[30]),
    .RegWrite(RegWrite),
    .ALUSrc(ALUSrc),
    .MemWrite(MemWrite),
    .ResultSrc(ResultSrc),
    .Branch(Branch),
    .ImmSrc(ImmSrc),
    .ALUControl(ALUControl)
);


// REGISTER FILE 
reg_file RF(
    .clk(clk),
    .rst(rst),
    .a1(instr[19:15]),
    .a2(instr[24:20]),
    .a3(instr[11:7]),
    .wd(Result),
    .we(RegWrite),
    .rd1(rd1),
    .rd2(rd2)
);


//  SIGN EXTENDER 
sign_extender SE(
    .instr(instr),
    .ImmSrc(ImmSrc),
    .ImmExt(ImmExt)
);


//  ALU INPUT MUX 
assign srcB = (ALUSrc) ? ImmExt : rd2;


//  ALU 
alu ALU(
    .sel(ALUControl),
    .a(rd1),
    .b(srcB),
    .out(ALUResult),
    .zero(zero),
    .sign()
);


// DATA MEMORY
data_mem DM(
    .clk(clk),
    .MWE(MemWrite),
    .MA(ALUResult),
    .MWD(rd2),
    .MRD(ReadData)
);


//WRITE BACK MUX 
assign Result = (ResultSrc) ? ReadData : ALUResult;


// PC LOGIC 
assign PCPlus4 = PC + 4;
assign PCTarget = PC + ImmExt;
assign PCNext = (Branch && zero) ? PCTarget : PCPlus4;


// PC REGISTER 
pc PC_reg(
    .clk(clk),
    .rst(rst),
    .load_signal(1'b1),
    .pc(PC),
    .pc_next(PCNext)
);

endmodule



