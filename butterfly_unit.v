`timescale 1ns / 1ps
`include "parameters.v"

module butterfly_unit(	
	input wire clk,
	input wire rst,
	input wire [data_size:0] i_data_ra,
	input wire [data_size:0] i_data_ca,
	input wire [data_size:0] i_data_rb,
	input wire [data_size:0] i_data_cb,
	input wire [data_size:0] i_twiddle_r,
	input wire [data_size:0] i_twiddle_c,
	output reg [data_size:0] o_data_ra,
	output reg [data_size:0] o_data_ca,
	output reg [data_size:0] o_data_rb,
	output reg [data_size:0] o_data_cb
    );
	 
	/*********************************************************************
	 * Multiplication 
	 *********************************************************************/
	reg [31:0] mult_out_r;
	reg [31:0] mult_out_c;
	reg [63:0] temp_r;
	reg [63:0] temp_c;
	
	/* Sign extend top bit of inputs for 2's complement multiplication*/
	wire [31:0] i_data_rb_extend;
	wire [31:0] i_data_cb_extend;
	wire [31:0] i_twiddle_r_extend;
	wire [31:0] i_twiddle_c_extend;
	
	assign i_data_rb_extend = {{(data_size+1){i_data_rb[data_size]}}, i_data_rb};
	assign i_data_cb_extend = {{(data_size+1){i_data_cb[data_size]}}, i_data_cb};
	assign i_twiddle_r_extend = {{(data_size+1){i_twiddle_r[data_size]}}, i_twiddle_r};
	assign i_twiddle_c_extend = {{(data_size+1){i_twiddle_c[data_size]}}, i_twiddle_c};
	
	/*********************************************************************
	 * Butterfly Computation
	 *********************************************************************/
		 
	always @ (posedge clk, posedge rst)
		if(rst) begin
			o_data_ra <= 0;
			o_data_ca <= 0;
			o_data_rb <= 0;
			o_data_cb <= 0;
			mult_out_r <= 31'd0;
			mult_out_c <= 31'd0;
			temp_r <= 63'd0;
			temp_c <= 63'd0;
		end
		else begin
			// Multiplication
			temp_r <= i_data_rb_extend*i_twiddle_r_extend + (~(i_data_cb_extend*i_twiddle_c_extend) + 1);
			temp_c <= i_data_rb_extend*i_twiddle_c_extend + i_data_cb_extend*i_twiddle_r_extend;
			mult_out_r <= temp_r[31:0];
			mult_out_c <= temp_c[31:0];

			// Addition
			o_data_ra <= i_data_ra + mult_out_r[2*data_size:data_size];
			o_data_ca <= i_data_ca + mult_out_c[2*data_size:data_size];
			o_data_rb <= i_data_ra + (~mult_out_r[2*data_size:data_size]+1);
			o_data_cb <= i_data_ca + (~mult_out_c[2*data_size:data_size]+1);
		end
	
endmodule