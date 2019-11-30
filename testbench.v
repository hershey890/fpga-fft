`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:20:05 11/14/2019 
// Design Name: 
// Module Name:    testbench 
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
module testbench;
	reg clk;
	reg rst;
	reg[3:0] valid_result;
	reg [data_size:0] i_data_ra;
	reg [data_size:0] i_data_ca;
	reg [data_size:0] i_data_rb;
	reg [data_size:0] i_data_cb;
	reg [data_size:0] i_twiddle_r;
	reg [data_size:0] i_twiddle_c;
	wire [data_size:0] o_data_ra;
	wire [data_size:0] o_data_ca;
	wire [data_size:0] o_data_rb;
	wire [data_size:0] o_data_cb;
	
	// Twiddle module Input/Outputs
	wire twiddle_real;
	wire twiddle_imag;
	reg [3:0] twiddle_index;
	wire [data_size:0] twiddle_val;
	
	butterfly_unit but(	clk,
								rst,
								i_data_ra,
								i_data_ca,
								i_data_rb,
								i_data_cb,
								i_twiddle_r,
								i_twiddle_c,
								o_data_ra,
								o_data_ca,
								o_data_rb,
								o_data_cb);
								
	/*twiddle_LUT omega_real(	.clk(clk),
									.rst(rst),
									.real_imag(REAL),
									.twiddle_num(twiddle_index),
									.twiddle_val(i_twiddle_r));
									
	twiddle_LUT omega_imag(	.clk(clk),
									.rst(rst),
									.real_imag(IMAG),
									.twiddle_num(twiddle_index),
									.twiddle_val(i_twiddle_c));*/
								
	initial begin
		clk = 0;
		rst = 1;
		#5 rst = 0;
		
		i_data_ra = 16'd1;
		i_data_ca = 16'd2;
		i_data_rb = 16'd3;
		i_data_cb = 16'd4;
		// a_r = 4
		// a_c = 6
		// b_r = -2
		// b_c = -2
		//twiddle_index = 4'd0;
		i_twiddle_r = 16'b0111111111111111;
		i_twiddle_c = 16'b0000000000000000;
		
		#20 
		valid_result[0] = (o_data_ra == i_data_ra+i_data_rb);
		valid_result[1] = (o_data_rb == i_data_ra-i_data_rb);
		valid_result[2] = (o_data_ca == i_data_ca+i_data_cb);
		valid_result[3] = (o_data_cb == i_data_ca-i_data_cb);
	end
	/*
	wire [31:0] wire_mult_out_r;
	wire [31:0] wire_mult_out_c;
	
	mult_test mult (	.clk(clk),
							.rst(rst),
							.i_data_ra(i_data_ra),
							.i_data_rb(i_data_rb),
							.i_data_ca(i_data_ca),
							.i_data_cb(i_data_cb),
							.mult_out_r(wire_mult_out_r),
							.mult_out_c(wire_mult_out_c));
							
	initial begin
		clk = 0;
		rst = 1;
		#5 rst = 0;
		
		i_data_ra = 16'd1;
		i_data_ca = 16'd2;
		i_data_rb = 16'd3;
		i_data_cb = 16'd4;
		//o_data_r = 1*3-2*4=3-8=-5  =11111111111111111111111111111011
		//o_data_c = 1*4+2*3=4+6=  10=00000000000000000000000000001010
		
		#20
		i_data_ra = ~(16'd1)+1;
		i_data_ca = ~(16'd2)+1;
		i_data_rb = ~(16'd3)+1;
		i_data_cb = ~(16'd4)+1;
		
		#20
		i_data_ra = ~(16'd1)+1;
		i_data_ca = 16'd2;
		i_data_rb = 16'd3;
		i_data_cb = ~(16'd4)+1;
		//r = -1*3-2*-4=-3+8=5
		//c = -1*-4+2*3=4+6=10
	end*/

	always #5 clk = ~clk;

endmodule
