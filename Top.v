module Top (
input fast_clk,
output led, flag, flg,
output [1:0] ubCounter,
output [1:0] in1, in2, resul,
output [2:0] i,
output [4:0] opcd
);
wire [1:0] in_A, in_B, res;
wire [4:0] opcode;
wire status;
ALU ALU(
	.in_A (in_A),
	.in_B (in_B),
	.res (res),
	.status (status),
	.opcode (opcode)
);

code code (
	.res (res),
	.status (status),
	.clk (fast_clk),
	.in_A (in_A),
	.in_B (in_B),
	.opcode (opcode),
	.led (led),
	.ubCounter (ubCounter),
	.i (i),
	.flg (flg)
);

assign flag = status;
assign in1 = in_A;
assign in2 = in_B;
assign opcd = opcode;
assign resul = res;

endmodule
