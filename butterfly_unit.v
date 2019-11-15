`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:00:23 11/14/2019 
// Design Name: 
// Module Name:    butterfly_unit 
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
module butterfly_unit(
	input wire clk,
	input wire rst,
	input wire [15:0] i_data_ra,
	input wire [15:0] i_data_ca,
	input wire [15:0] i_data_rb,
	input wire [15:0] i_data_cb,
	input wire [15:0] i_twiddle_r,
	input wire [15:0] i_twiddle_c,
	output wire [15:0] o_data_ra,
	output wire [15:0] o_data_ca,
	output wire [15:0] o_data_rb,
	output wire [15:0] o_data_cb
    );
	 
	wire [31:0] mult_out_r;
	wire [31:0] mult_out_c;
	 
	complex_multiplier mult(.clk(clk), 
									.rst(rst),
									.i_data_ra(i_twiddle_r),
									.i_data_ca(i_twiddle_c),
									.i_data_rb(i_data_rb),
									.i_data_cb(i_data_cb),
									.o_data_r(mult_out_r),
									.o_data_c(mult_out_c));
									
	complex_adder add_a(	.clk(clk), 
								.rst(rst),
								.i_data_ra(i_data_ra),
								.i_data_ca(i_data_ca),
								.i_data_rb(mult_out_r[30:15]),
								.i_data_cb(mult_out_c[30:15]),
								.o_data_r(o_data_ra),
								.o_data_c(o_data_ca));
								
	complex_adder add_b(	.clk(clk), 
								.rst(rst),
								.i_data_ra(i_data_ra),
								.i_data_ca(i_data_ca),
								.i_data_rb(~(mult_out_r[30:15])+1), //may not work
								.i_data_cb(~(mult_out_c[30:15])+1), //may not work
								.o_data_r(o_data_rb),
								.o_data_c(o_data_cb));
	
endmodule
