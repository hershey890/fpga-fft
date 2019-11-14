`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:05:01 11/14/2019 
// Design Name: 
// Module Name:    complex_adder 
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
module complex_adder(
	input wire clk,
	input wire rst,
	input wire [15:0] i_data_ra,
	input wire [15:0] i_data_ca,
	input wire [15:0] i_data_rb,
	input wire [15:0] i_data_cb,
	output reg [15:0] o_data_r,
	output reg [15:0] o_data_c
    );
	
	always @ (posedge clk, posedge rst)
		if(rst) begin
			o_data_r <= 0;
			o_data_c <= 0;
		end
		else begin
			o_data_r <= i_data_ra + i_data_rb;
			o_data_c <= i_data_ca + i_data_cb;
		end


endmodule
