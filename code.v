module code 
(
	input wire [1:0] res,
	input wire status,
	input clk,
	output reg [1:0] in_A, in_B,
	output reg [4:0] opcode,
	output reg led,
	output reg [1:0] ubCounter,
	output reg [2:0] i,
	output reg flg
	);

reg [1:0] val_x, val_y;
initial begin
	i = 0;
	ubCounter = 0;
	val_x = 2'b00;
	val_y = 2'b10;
end

always @(posedge clk) begin
	case (i) 
		//Inicializa el estado del sistema iniciando con un AND usando el bit mas significativo
		0: begin
				opcode = 2'b10;
				in_A = val_x[1];
				in_B = val_y[1];
				i = i + 1'b1;
			end
		1: i = i + 1'b1;
		//Se compara el resultado del AND y se hace un branch dependiendo del resultado
		//Si sale true, se usan los bits más significativos para otro AND
		2: begin
				if (res == 1'b1) begin
					flg = 1;
					in_A = val_x[0];
					in_B = val_y[0];
				end
		//Si sale false, se hace una resta para saber el mayor
				else begin
					opcode = 1'b1;
				end
				i = i + 1'b1;
			end
		
		3: begin
				if (flg == 1) begin
					if (res == 1) begin
						led = 1;
					end
					else begin
						opcode = 1;
					end
				end
				else begin
					if (status == 1) begin
						in_A = ubCounter;
						in_B = 1'b1;
						opcode = 0;
					end
					else begin
						in_A = ubCounter;
						in_B = 1'b1;
						opcode = 1;
					end
				end
				i = i + 1'b1;
			end
		4: begin
				if (flg == 1) begin
					if (status == 1) begin
						in_A = ubCounter;
						in_B = 1;
						opcode = 0;
					end
					else begin
						in_A = ubCounter;
						in_B = 1;
						opcode = 1;
					end
				end
				else begin
					ubCounter = res;
				end
				i = i + 1'b1;
			end
		5: begin
				if (flg == 1) begin
					ubCounter = res;
				end
				i = 0;
			end
	endcase	
end
 
endmodule
