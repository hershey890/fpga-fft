`timescale 1ns / 1ps

module butterfly_top_module(
    input clk,
    input rst,
	 input new_input_flag,
	 input [15:0] input_real0,
	 input [15:0] input_real1,
	 input [15:0] input_real2,
	 input [15:0] input_real3,
	 input [15:0] input_real4,
	 input [15:0] input_real5,
	 input [15:0] input_real6,
	 input [15:0] input_real7,
	 input [15:0] input_real8,
	 input [15:0] input_real9,
	 input [15:0] input_real10,
	 input [15:0] input_real11,
	 input [15:0] input_real12,
	 input [15:0] input_real13,
	 input [15:0] input_real14,
	 input [15:0] input_real15,
	 
	 input [15:0] input_imag0,
	 input [15:0] input_imag1,
	 input [15:0] input_imag2,
	 input [15:0] input_imag3,
	 input [15:0] input_imag4,
	 input [15:0] input_imag5,
	 input [15:0] input_imag6,
	 input [15:0] input_imag7,
	 input [15:0] input_imag8,
	 input [15:0] input_imag9,
	 input [15:0] input_imag10,
	 input [15:0] input_imag11,
	 input [15:0] input_imag12,
	 input [15:0] input_imag13,
	 input [15:0] input_imag14,
	 input [15:0] input_imag15,
	 
	 output [15:0] output_real0,
	 output [15:0] output_real1,
	 output [15:0] output_real2,
	 output [15:0] output_real3,
	 output [15:0] output_real4,
	 output [15:0] output_real5,
	 output [15:0] output_real6,
	 output [15:0] output_real7,
	 output [15:0] output_real8,
	 output [15:0] output_real9,
	 output [15:0] output_real10,
	 output [15:0] output_real11,
	 output [15:0] output_real12,
	 output [15:0] output_real13,
	 output [15:0] output_real14,
	 output [15:0] output_real15,
	 
	 output [15:0] output_imag0,
	 output [15:0] output_imag1,
	 output [15:0] output_imag2,
	 output [15:0] output_imag3,
	 output [15:0] output_imag4,
	 output [15:0] output_imag5,
	 output [15:0] output_imag6,
	 output [15:0] output_imag7,
	 output [15:0] output_imag8,
	 output [15:0] output_imag9,
	 output [15:0] output_imag10,
	 output [15:0] output_imag11,
	 output [15:0] output_imag12,
	 output [15:0] output_imag13,
	 output [15:0] output_imag14,
	 output [15:0] output_imag15,
	 
	 output fft_ready_flag
);

	/*********************************************************************
	 * Twiddle Indices
	 *********************************************************************/
	wire [3:0] twiddle_index [15:0];
	assign twiddle_index[0] = 4'd0;
	assign twiddle_index[1] = 4'd1;
	assign twiddle_index[2] = 4'd2;
	assign twiddle_index[3] = 4'd3;
	assign twiddle_index[4] = 4'd4;
	assign twiddle_index[5] = 4'd5;
	assign twiddle_index[6] = 4'd6;
	assign twiddle_index[7] = 4'd7;
	assign twiddle_index[8] = 4'd8;
	assign twiddle_index[9] = 4'd9;
	assign twiddle_index[10] = 4'd10;
	assign twiddle_index[11] = 4'd11;
	assign twiddle_index[12] = 4'd12;
	assign twiddle_index[13] = 4'd13;
	assign twiddle_index[14] = 4'd14;
	assign twiddle_index[15] = 4'd15;
	
	/*********************************************************************
	 * Buttefly Units Layer 1/4
	 *********************************************************************/
	 wire [15:0] layer1_wire_real [7:0];
	 wire [15:0] layer1_wire_imag [7:0];
	 wire layer1_ready_flag [3:0];
	 
	 butterfly_unit_input lay1_bfu1 (
			.clk(clk),
			.rst(rst),
			.i_data_ra(input_real0),
			.i_data_ca(input_imag0),
			.i_data_rb(input_real4),
			.i_data_cb(input_imag4),
			.twiddle_num(twiddle_index[0]),
			.new_input_flag(new_input_flag), // used for synchronization
			.o_data_ra(layer1_wire_real[0]),
			.o_data_ca(layer1_wire_imag[0]),
			.o_data_rb(layer1_wire_real[4]),
			.o_data_cb(layer1_wire_imag[4]),
			.ready_flag(layer1_ready_flag[0]));
			
	 butterfly_unit_input lay1_bfu2 (
			.clk(clk),
			.rst(rst),
			.i_data_ra(input_real2),
			.i_data_ca(input_imag2),
			.i_data_rb(input_real6),
			.i_data_cb(input_imag6),
			.twiddle_num(twiddle_index[0]),
			.new_input_flag(new_input_flag), // used for synchronization
			.o_data_ra(layer1_wire_real[2]),
			.o_data_ca(layer1_wire_imag[2]),
			.o_data_rb(layer1_wire_real[6]),
			.o_data_cb(layer1_wire_imag[6]),
			.ready_flag(layer1_ready_flag[1]));
	
	butterfly_unit_input lay1_bfu3 (
			.clk(clk),
			.rst(rst),
			.i_data_ra(input_real1),
			.i_data_ca(input_imag1),
			.i_data_rb(input_real5),
			.i_data_cb(input_imag5),
			.twiddle_num(twiddle_index[0]),
			.new_input_flag(new_input_flag), // used for synchronization
			.o_data_ra(layer1_wire_real[1]),
			.o_data_ca(layer1_wire_imag[1]),
			.o_data_rb(layer1_wire_real[5]),
			.o_data_cb(layer1_wire_imag[5]),
			.ready_flag(layer1_ready_flag[2]));
			
	 butterfly_unit_input lay1_bfu4 (
			.clk(clk),
			.rst(rst),
			.i_data_ra(input_real3),
			.i_data_ca(input_imag3),
			.i_data_rb(input_real7),
			.i_data_cb(input_imag7),
			.twiddle_num(twiddle_index[0]),
			.new_input_flag(new_input_flag), // used for synchronization
			.o_data_ra(layer1_wire_real[3]),
			.o_data_ca(layer1_wire_imag[3]),
			.o_data_rb(layer1_wire_real[7]),
			.o_data_cb(layer1_wire_imag[7]),
			.ready_flag(layer1_ready_flag[3]));
	 
	/*********************************************************************
	 * Buttefly Units Layer 2/4
	 *********************************************************************/
	wire [15:0] layer2_wire_real [7:0];
	wire [15:0] layer2_wire_imag [7:0];
	wire layer2_ready_flag [3:0];
	wire lay1_new_input_flag [1:0];
	assign lay1_new_input_flag[0] = layer1_ready_flag[0] & layer1_ready_flag[1]; 
	assign lay1_new_input_flag[1] = layer1_ready_flag[2] & layer1_ready_flag[3];
	
	//top 2
	butterfly_unit_intermediate lay2_bfu1 (
		.clk(clk),
		.rst(rst),
		.i_data_ra(layer1_wire_real[0]),
		.i_data_ca(layer1_wire_imag[0]),
		.i_data_rb(layer1_wire_real[2]),
		.i_data_cb(layer1_wire_imag[2]),
		.twiddle_num(twiddle_index[0]), //twiddle 0
		.new_input_flag(lay1_new_input_flag[0]), // used for synchronization
		.o_data_ra(layer2_wire_real[0]),
		.o_data_ca(layer2_wire_imag[0]),
		.o_data_rb(layer2_wire_real[2]),
		.o_data_cb(layer2_wire_imag[2]),
		.ready_flag(layer2_ready_flag[0]));

	butterfly_unit_intermediate lay2_bfu2 (
		.clk(clk),
		.rst(rst),
		.i_data_ra(layer1_wire_real[4]),
		.i_data_ca(layer1_wire_imag[4]),
		.i_data_rb(layer1_wire_real[6]),
		.i_data_cb(layer1_wire_imag[6]),
		.twiddle_num(twiddle_index[4]), //twiddle index 2/8->4
		.new_input_flag(lay1_new_input_flag[0]), // used for synchronization
		.o_data_ra(layer2_wire_real[4]),
		.o_data_ca(layer2_wire_imag[4]),
		.o_data_rb(layer2_wire_real[6]),
		.o_data_cb(layer2_wire_imag[6]),
		.ready_flag(layer2_ready_flag[1]));
	
	//bottom 2
	butterfly_unit_intermediate lay2_bfu3 (
		.clk(clk),
		.rst(rst),
		.i_data_ra(layer1_wire_real[1]),
		.i_data_ca(layer1_wire_imag[1]),
		.i_data_rb(layer1_wire_real[3]),
		.i_data_cb(layer1_wire_imag[3]),
		.twiddle_num(twiddle_index[0]),
		.new_input_flag(lay1_new_input_flag[1]), // used for synchronization
		.o_data_ra(layer2_wire_real[1]),
		.o_data_ca(layer2_wire_imag[1]),
		.o_data_rb(layer2_wire_real[3]),
		.o_data_cb(layer2_wire_imag[3]),
		.ready_flag(layer2_ready_flag[2]));

	butterfly_unit_intermediate lay2_bfu4 (
		.clk(clk),
		.rst(rst),
		.i_data_ra(layer1_wire_real[5]),
		.i_data_ca(layer1_wire_imag[5]),
		.i_data_rb(layer1_wire_real[7]),
		.i_data_cb(layer1_wire_imag[7]),
		.twiddle_num(twiddle_index[4]), //twiddle index 2/8->4
		.new_input_flag(lay1_new_input_flag[1]), // used for synchronization
		.o_data_ra(layer2_wire_real[5]),
		.o_data_ca(layer2_wire_imag[5]),
		.o_data_rb(layer2_wire_real[7]),
		.o_data_cb(layer2_wire_imag[7]),
		.ready_flag(layer2_ready_flag[3]));
		
	/*********************************************************************
	 * Buttefly Units Layer 3/4
	 *********************************************************************/
	wire layer3_ready_flag [3:0];
	wire lay2_new_input_flag [3:0];
	assign lay2_new_input_flag[0] = layer1_ready_flag[0] & layer1_ready_flag[2];
	assign lay2_new_input_flag[1] = layer1_ready_flag[1] & layer1_ready_flag[3];
	
	//top 2
	butterfly_unit_intermediate lay3_bfu1 (
		.clk(clk),
		.rst(rst),
		.i_data_ra(layer2_wire_real[0]),
		.i_data_ca(layer2_wire_imag[0]),
		.i_data_rb(layer2_wire_real[1]),
		.i_data_cb(layer2_wire_imag[1]),
		.twiddle_num(twiddle_index[0]), //twiddle 0
		.new_input_flag(lay1_new_input_flag[0]), //bfu0,2 used for synchronization
		.o_data_ra(output_real0),
		.o_data_ca(output_imag0),
		.o_data_rb(output_real4),
		.o_data_cb(output_imag4),
		.ready_flag(layer3_ready_flag[0]));

	butterfly_unit_intermediate lay3_bfu2 (
		.clk(clk),
		.rst(rst),
		.i_data_ra(layer2_wire_real[4]),
		.i_data_ca(layer2_wire_imag[4]),
		.i_data_rb(layer2_wire_real[5]),
		.i_data_cb(layer2_wire_imag[5]),
		.twiddle_num(twiddle_index[2]), //twiddle 1/8=2/16
		.new_input_flag(lay1_new_input_flag[1]), //bfu1,3 used for synchronization
		.o_data_ra(output_real1),
		.o_data_ca(output_imag1),
		.o_data_rb(output_real5),
		.o_data_cb(output_imag5),
		.ready_flag(layer3_ready_flag[1]));
	
	//bottom 2
	butterfly_unit_intermediate lay3_bfu3 (
		.clk(clk),
		.rst(rst),
		.i_data_ra(layer2_wire_real[2]),
		.i_data_ca(layer2_wire_imag[2]),
		.i_data_rb(layer2_wire_real[3]),
		.i_data_cb(layer2_wire_imag[3]),
		.twiddle_num(twiddle_index[4]), //twiddle 2/8=4/16
		.new_input_flag(lay1_new_input_flag[0]), //bfu0,2 used for synchronization
		.o_data_ra(output_real2),
		.o_data_ca(output_imag2),
		.o_data_rb(output_real6),
		.o_data_cb(output_imag6),
		.ready_flag(layer3_ready_flag[2]));

	butterfly_unit_intermediate lay3_bfu4 (
		.clk(clk),
		.rst(rst),
		.i_data_ra(layer2_wire_real[6]),
		.i_data_ca(layer2_wire_imag[6]),
		.i_data_rb(layer2_wire_real[7]),
		.i_data_cb(layer2_wire_imag[7]),
		.twiddle_num(twiddle_index[6]), //twiddle 3/8=6/16
		.new_input_flag(lay1_new_input_flag[1]), //bfu 1,3 used for synchronization
		.o_data_ra(output_real3),
		.o_data_ca(output_imag3),
		.o_data_rb(output_real7),
		.o_data_cb(output_imag7),
		.ready_flag(layer3_ready_flag[3]));

	assign fft_ready_flag = layer3_ready_flag[0] & layer3_ready_flag[1] & 
									layer3_ready_flag[2] & layer3_ready_flag[3];

endmodule
