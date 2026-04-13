module reg_file(
  input [4:0]a1,
  input  [4:0]a2,
  input [4:0]a3,
  input clk,rst,
  input we,
  input [31:0]wd,
  output [31:0]rd1,
  output [31:0]rd2);
  reg [31:0]registers[31:0];
  assign rd1 = (a1 == 0) ? 32'd0 : registers[a1];
assign rd2 = (a2 == 0) ? 32'd0 : registers[a2];

   integer i;
  always @(posedge clk or posedge rst)
  begin
      if(rst)
    
      begin
           
          for(i=0;i<32;i=i+1)
              registers[i]<=32'd0;
          end
     else if(we&& a3!=0)
     registers[a3]<=wd;
 end
 endmodule
         
         
         
         
         
         