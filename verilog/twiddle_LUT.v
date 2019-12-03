`timescale 1ns / 1ps

module twiddle_LUT(
	input clk,
	input rst,
	input [3:0] twiddle_num,
	output reg [15:0] twiddle_val_real,
	output reg [15:0] twiddle_val_imag
);
	
	always @ (posedge clk, posedge rst) begin
		if (rst) begin
			twiddle_val_real <= 16'b0;
			twiddle_val_imag <= 16'b0;
		end
		else begin
			case (twiddle_num)
				4'd0: begin
					twiddle_val_real <= 16'b0111111111111111;
					twiddle_val_imag <= 16'b0000000000000000;
				end
				4'd1: begin
					twiddle_val_real <= 16'b0111011001000001;
					twiddle_val_imag <= 16'b1100111100000101;
				end
				4'd2: begin
					twiddle_val_real <= 16'b0101101010000010;
					twiddle_val_imag <= 16'b1010010101111110;
				end
				4'd3: begin
					twiddle_val_real <= 16'b0011000011111011;
					twiddle_val_imag <= 16'b1000100110111111;
				end
				4'd4: begin
					twiddle_val_real <= 16'b0000000000000000;
					twiddle_val_imag <= 16'b1000000000000001;
				end
				4'd5: begin
					twiddle_val_real <= 16'b1100111100000101;
					twiddle_val_imag <= 16'b1000100110111111;
				end
				4'd6: begin
					twiddle_val_real <= 16'b1010010101111110;
					twiddle_val_imag <= 16'b1010010101111110;
				end
				4'd7: begin
					twiddle_val_real <= 16'b1000100110111111;
					twiddle_val_imag <= 16'b1100111100000101;
				end
				4'd8: begin
					twiddle_val_real <= 16'b1000000000000001;
					twiddle_val_imag <= 16'b0000000000000000;
				end
				4'd9: begin
					twiddle_val_real <= 16'b1000100110111111;
					twiddle_val_imag <= 16'b0011000011111011;
				end
				4'd10: begin
					twiddle_val_real <= 16'b1010010101111110;
					twiddle_val_imag <= 16'b0101101010000010;
				end
				4'd11: begin
					twiddle_val_real <= 16'b1100111100000101;
					twiddle_val_imag <= 16'b0111011001000001;
				end
				4'd12: begin
					twiddle_val_real <= 16'b0000000000000000;
					twiddle_val_imag <= 16'b0111111111111111;
				end
				4'd13: begin
					twiddle_val_real <= 16'b0011000011111011;
					twiddle_val_imag <= 16'b0111011001000001;
				end
				4'd14: begin
					twiddle_val_real <= 16'b0101101010000010;
					twiddle_val_imag <= 16'b0101101010000010;
				end
				4'd15: begin
					twiddle_val_real <= 16'b0111011001000001;
					twiddle_val_imag <= 16'b0011000011111011;
				end
			endcase
		end
	end
endmodule