`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:24:16 11/29/2019 
// Design Name: 
// Module Name:    twiddle_LUT 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
parameter REAL = 0;
parameter IMAG = 1;

module twiddle_LUT(
	input clk,
	input rst,
	input real_imag,
	input [3:0] twiddle_num,
	output reg [15:0] twiddle_val);
	
	always @ (posedge clk, posedge rst) begin
		if (rst)
			twiddle_val = 16'b0;
		else if (real_imag == REAL) begin
			case (twiddle_num)
				4'd0: twiddle_val <= 16'b1000000000000000;
				4'd1: twiddle_val <= 16'b0111011001000001;
				4'd2: twiddle_val <= 16'b0101101010000010;
				4'd3: twiddle_val <= 16'b0011000011111011;
				4'd4: twiddle_val <= 16'b0000000000000000;
				4'd5: twiddle_val <= 16'b1100111100000101;
				4'd6: twiddle_val <= 16'b1010010101111110;
				4'd7: twiddle_val <= 16'b1000100110111111;
				4'd8: twiddle_val <= 16'b1000000000000000;
				4'd9: twiddle_val <= 16'b1000100110111111;
				4'd10: twiddle_val <= 16'b1010010101111110;
				4'd11: twiddle_val <= 16'b1100111100000101;
				4'd12: twiddle_val <= 16'b0000000000000000;
				4'd13: twiddle_val <= 16'b0011000011111011;
				4'd14: twiddle_val <= 16'b0101101010000010;
				4'd15: twiddle_val <= 16'b0111011001000001;
			endcase	
		end
		else if (real_imag == IMAG) begin
			case (twiddle_num)
				4'd0: twiddle_val <= 16'b1000000000000000;
				4'd1: twiddle_val <= 16'b0111011001000001;
				4'd2: twiddle_val <= 16'b0101101010000010;
				4'd3: twiddle_val <= 16'b0011000011111011;
				4'd4: twiddle_val <= 16'b0000000000000000;
				4'd5: twiddle_val <= 16'b1100111100000101;
				4'd6: twiddle_val <= 16'b1010010101111110;
				4'd7: twiddle_val <= 16'b1000100110111111;
				4'd8: twiddle_val <= 16'b1000000000000000;
				4'd9: twiddle_val <= 16'b1000100110111111;
				4'd10: twiddle_val <= 16'b1010010101111110;
				4'd11: twiddle_val <= 16'b1100111100000101;
				4'd12: twiddle_val <= 16'b0000000000000000;
				4'd13: twiddle_val <= 16'b0011000011111011;
				4'd14: twiddle_val <= 16'b0101101010000010;
				4'd15: twiddle_val <= 16'b0111011001000001;
			endcase
		end
	end

endmodule
