module ALU(
input wire [1:0] in_A,
input wire [1:0] in_B,
input [4:0] opcode,
output reg [1:0] res,
output reg status
);


always @(*) begin
	status = 0;
	case (opcode)
		4'b00000: 
			begin
				if (in_A + in_B > 3) begin
					status = 1'b1;
				end
				res = in_A + in_B;
			end
		4'b00001:
			begin
				if (in_A < in_B && in_A == 0) begin
					status = 1'b1;
				end
				res = in_A - in_B;
			end
		4'b0010:
			begin
				if (in_A == in_B) begin
					res = 1'b1;
				end
				else res = 0;
			end
		4'b0011:
			begin
				res = in_A || in_B;
			end
		4'b0100:
			begin
				res = !in_A;
			end
		4'b0101:
			begin
				res = in_A ^ in_B;
			end
		4'b0110:
			begin
				status = 1'b1;
				res = !in_A;
			end
		4'b0111:
			begin
				status = 1'b1;
				res = !in_A + 1'b1;
			end
		4'b1000:
			begin
				res = in_A <<< 1;
			end
		4'b1001:
			begin
				res = in_A >>> 1;
			end
		4'b1010:
			begin
				res = in_A << 1;
			end
		4'b1011:
			begin
				res = in_A >> 1;
			end
		4'b1100:
			begin
				res = {in_A[1], in_A[0]};
			end
		4'b1101:
			begin
				res = {in_A[1], in_A[0]};
			end
	endcase
end

endmodule	