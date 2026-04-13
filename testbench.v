module tb_top;

reg clk;
reg rst;

// Instantiate DUT (your processor)
top uut (
    .clk(clk),
    .rst(rst)
);

// Clock generation (10 time units period)
always #5 clk = ~clk;

initial begin
    // Initialize signals
    clk = 0;
    rst = 1;

    // Apply reset properly
    #20 rst = 0;

    


// Monitor important signals
$monitor("PC=%h x1=%d x2=%d x3=%d x4=%d x8=%d x10=%d",
    uut.PC,
    uut.RF.registers[1],
    uut.RF.registers[2],
    uut.RF.registers[3],
    uut.RF.registers[4],
    uut.RF.registers[8],
    uut.RF.registers[10]
);
// Run simulation
    #300;

    $finish;
end
endmodule