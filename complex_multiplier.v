`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:35:38 11/12/2019 
// Design Name: 
// Module Name:    complex_multiplier 
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
module complex_multiplier(
	input wire clk,
	input wire rst,
	input wire [15:0] i_data_ra, //twiddle factor
	input wire [15:0] i_data_ca, //twiddle factor
	input wire [15:0] i_data_rb,
	input wire [15:0] i_data_cb,
	output reg [31:0] o_data_r,
	output reg [31:0] o_data_c
	);

	always @ (posedge clk, posedge rst)
		if(rst) begin
			o_data_r <= 0;
			o_data_c <= 0;
		end
		else begin
			o_data_r <= i_data_ra*i_data_rb - i_data_ca*i_data_cb;
			o_data_c <= i_data_ra*i_data_cb + i_data_ca*i_data_rb;
		end

endmodule
