`timescale 1ns / 1 ps

module Test;

parameter CLK_PERIOD = 2;

reg fast_clk;
wire led, status, flg;
wire [1:0] ubCounter, in1, in2, resul;
wire [2:0] i;
wire [4:0] opcd;



always #(CLK_PERIOD) fast_clk = ~fast_clk;

Top Top_test (
	.fast_clk (fast_clk),
	.led (led),
	.ubCounter (ubCounter),
	.in1 (in1),
	.in2 (in2),
	.flag (status),
	.flg (flg),
	.i (i),
	.opcd (opcd),
	.resul (resul)
);
	
initial begin
#1 fast_clk = 0;

#10000 
			$display("Hey, the simulation is finished!!");
			$stop;
end 
endmodule

