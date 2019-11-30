`timescale 1ns / 1ps

module butterfly_unit_tb;
	reg clk;
	reg rst;
	reg[3:0] valid_result;
	reg [data_size:0] i_data_ra;
	reg [data_size:0] i_data_ca;
	reg [data_size:0] i_data_rb;
	reg [data_size:0] i_data_cb;
	reg [3:0] twiddle_num;
	wire [data_size:0] o_data_ra;
	wire [data_size:0] o_data_ca;
	wire [data_size:0] o_data_rb;
	wire [data_size:0] o_data_cb;
	
	butterfly_unit but(	.clk(clk),
								.rst(rst),
								.i_data_ra(i_data_ra),
								.i_data_ca(i_data_ca),
								.i_data_rb(i_data_rb),
								.i_data_cb(i_data_cb),
								.twiddle_num(twiddle_num),
								.o_data_ra(o_data_ra),
								.o_data_ca(o_data_ca),
								.o_data_rb(o_data_rb),
								.o_data_cb(o_data_cb));
								
	initial begin
		clk = 0;
		rst = 1;
		#5 
		rst = 0;
		twiddle_num = 0;
		
		#20
		i_data_ra = 16'd2;
		i_data_ca = 16'd4;
		i_data_rb = 16'b1111111111111011; //-5
		i_data_cb = 16'd35;
		//expected result: -3+39j, 7-31j
		//a_r=1111111111111101
		//a_c=0000000000100111
		//b_r=0000000000000111
		//b_c=1111111111100001
		
		#40
		i_data_ra = 16'd100;
		i_data_ca = 16'd70;
		i_data_rb = 16'b1111111100111000; //-200
		i_data_cb = 16'd35;
		//expectd result: [-100.+105.j  300. +35.j]
		//a_r=1111111110011100
		//a_c=0000000001101001
		//b_r=0000000100101100
		//b_c=0000000000100011
	end

	always #5 clk = ~clk;

endmodule
