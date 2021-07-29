module Clock_divider (
	input fast_clk,
	output reg clk
);
	reg [12:0] counter;
	
	always@(posedge fast_clk) begin
		//Para simulación usar un valor de 255.
		//Para sintetizar en FPGA usar un valor de 5000.
		if (counter != 5000) begin
			counter = counter + 1'b1;
			clk = 0;
		end
		else begin
			clk = 1;
			counter = 0;
		end
	end
endmodule
	