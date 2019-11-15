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
`timescale 1ns / 1ps

module testbench;

	reg clk;
	reg rst;
	reg[4:0] valid_result;
	reg [15:0] i_data_ra;
	reg [15:0] i_data_ca;
	reg [15:0] i_data_rb;
	reg [15:0] i_data_cb;
	reg [15:0] i_twiddle_r;
	reg [15:0] i_twiddle_c;
	wire [15:0] o_data_ra;
	wire [15:0] o_data_ca;
	wire [15:0] o_data_rb;
	wire [15:0] o_data_cb;

	butterfly_unit butt(	clk,
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
								
	initial begin
		clk = 0;
		rst = 1;
		#5 rst = 0;
		
		i_data_ra = 5;
		i_data_ca = 6;
		i_data_rb = 10;
		i_data_cb = 3;
		i_twiddle_r = 1;
		i_twiddle_c = 0;
		
		#20 valid_result[0] = (o_data_ra == i_data_ra+i_data_rb) && (o_data_rb == i_data_ra-i_data_rb) &&
								 (o_data_ca == i_data_ca+i_data_cb) && (o_data_cb == i_data_ca-i_data_cb);
		valid_result[1] = (o_data_ra == i_data_ra+i_data_rb);
		valid_result[2] = (o_data_rb == i_data_ra-i_data_rb);
		valid_result[3] = (o_data_ca == i_data_ca+i_data_cb);
		valid_result[4] = (o_data_cb == i_data_ca-i_data_cb);
	end

	always #5 clk = ~clk;

endmodule
