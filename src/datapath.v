//DATAPATH
module datapath(
input clk,rst,
input [31:0]ImmExt,
input load,
input PCSrc,
output [31:0]pc);
wire [31:0]pcplus4;
wire [31:0]pc_target_wire;
wire [31:0]pc_next;

pc p1(.clk(clk),.rst(rst),.load_signal(load),.pc(pc),.pc_next(pc_next));
pc_plus_4 p2(.current_pc(pc),.next_pc(pcplus4));
pc_target p3(.PC_current(pc),.ImmExt(ImmExt),.PCTarget(pc_target_wire));
mux2_1  m1(.in0(pcplus4),.in1(pc_target_wire),.sel(PCSrc),.out(pc_next));
endmodule

