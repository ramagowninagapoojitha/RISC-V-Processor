//PROGRAM COUNTER
module pc(
input clk,rst,
input load_signal,
output reg [31:0]pc,
input [31:0]pc_next);
always @(posedge clk or posedge rst )begin
 if(rst)
 pc<=32'd0;
 else if(load_signal)
 pc<=pc_next;
 end
 endmodule
