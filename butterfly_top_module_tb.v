`timescale 1ns / 1ps

module butterfly_top_module_tb;

	// Inputs
	reg clk;
	reg rst;
	reg new_input_flag;
	reg [15:0] input_real0;
	reg [15:0] input_real1;
	reg [15:0] input_real2;
	reg [15:0] input_real3;
	reg [15:0] input_real4;
	reg [15:0] input_real5;
	reg [15:0] input_real6;
	reg [15:0] input_real7;
	reg [15:0] input_real8;
	reg [15:0] input_real9;
	reg [15:0] input_real10;
	reg [15:0] input_real11;
	reg [15:0] input_real12;
	reg [15:0] input_real13;
	reg [15:0] input_real14;
	reg [15:0] input_real15;
	reg [15:0] input_imag0;
	reg [15:0] input_imag1;
	reg [15:0] input_imag2;
	reg [15:0] input_imag3;
	reg [15:0] input_imag4;
	reg [15:0] input_imag5;
	reg [15:0] input_imag6;
	reg [15:0] input_imag7;
	reg [15:0] input_imag8;
	reg [15:0] input_imag9;
	reg [15:0] input_imag10;
	reg [15:0] input_imag11;
	reg [15:0] input_imag12;
	reg [15:0] input_imag13;
	reg [15:0] input_imag14;
	reg [15:0] input_imag15;

	// Outputs
	wire [15:0] output_real0;
	wire [15:0] output_real1;
	wire [15:0] output_real2;
	wire [15:0] output_real3;
	wire [15:0] output_real4;
	wire [15:0] output_real5;
	wire [15:0] output_real6;
	wire [15:0] output_real7;
	wire [15:0] output_real8;
	wire [15:0] output_real9;
	wire [15:0] output_real10;
	wire [15:0] output_real11;
	wire [15:0] output_real12;
	wire [15:0] output_real13;
	wire [15:0] output_real14;
	wire [15:0] output_real15;
	wire [15:0] output_imag0;
	wire [15:0] output_imag1;
	wire [15:0] output_imag2;
	wire [15:0] output_imag3;
	wire [15:0] output_imag4;
	wire [15:0] output_imag5;
	wire [15:0] output_imag6;
	wire [15:0] output_imag7;
	wire [15:0] output_imag8;
	wire [15:0] output_imag9;
	wire [15:0] output_imag10;
	wire [15:0] output_imag11;
	wire [15:0] output_imag12;
	wire [15:0] output_imag13;
	wire [15:0] output_imag14;
	wire [15:0] output_imag15;

	// Instantiate the Unit Under Test (UUT)
	butterfly_top_module uut (
		.clk(clk), 
		.rst(rst), 
		.new_input_flag(new_input_flag), 
		.input_real0(input_real0), 
		.input_real1(input_real1), 
		.input_real2(input_real2), 
		.input_real3(input_real3), 
		.input_real4(input_real4), 
		.input_real5(input_real5), 
		.input_real6(input_real6), 
		.input_real7(input_real7), 
		.input_real8(input_real8), 
		.input_real9(input_real9), 
		.input_real10(input_real10), 
		.input_real11(input_real11), 
		.input_real12(input_real12), 
		.input_real13(input_real13), 
		.input_real14(input_real14), 
		.input_real15(input_real15), 
		.input_imag0(input_imag0), 
		.input_imag1(input_imag1), 
		.input_imag2(input_imag2), 
		.input_imag3(input_imag3), 
		.input_imag4(input_imag4), 
		.input_imag5(input_imag5), 
		.input_imag6(input_imag6), 
		.input_imag7(input_imag7), 
		.input_imag8(input_imag8), 
		.input_imag9(input_imag9), 
		.input_imag10(input_imag10), 
		.input_imag11(input_imag11), 
		.input_imag12(input_imag12), 
		.input_imag13(input_imag13), 
		.input_imag14(input_imag14), 
		.input_imag15(input_imag15), 
		.output_real0(output_real0), 
		.output_real1(output_real1), 
		.output_real2(output_real2), 
		.output_real3(output_real3), 
		.output_real4(output_real4), 
		.output_real5(output_real5), 
		.output_real6(output_real6), 
		.output_real7(output_real7), 
		.output_real8(output_real8), 
		.output_real9(output_real9), 
		.output_real10(output_real10), 
		.output_real11(output_real11), 
		.output_real12(output_real12), 
		.output_real13(output_real13), 
		.output_real14(output_real14), 
		.output_real15(output_real15), 
		.output_imag0(output_imag0), 
		.output_imag1(output_imag1), 
		.output_imag2(output_imag2), 
		.output_imag3(output_imag3), 
		.output_imag4(output_imag4), 
		.output_imag5(output_imag5), 
		.output_imag6(output_imag6), 
		.output_imag7(output_imag7), 
		.output_imag8(output_imag8), 
		.output_imag9(output_imag9), 
		.output_imag10(output_imag10), 
		.output_imag11(output_imag11), 
		.output_imag12(output_imag12), 
		.output_imag13(output_imag13), 
		.output_imag14(output_imag14), 
		.output_imag15(output_imag15)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 5;
		new_input_flag = 0;
		input_real0 = 0;
		input_real1 = 0;
		input_real2 = 0;
		input_real3 = 0;
		input_real4 = 0;
		input_real5 = 0;
		input_real6 = 0;
		input_real7 = 0;
		input_real8 = 0;
		input_real9 = 0;
		input_real10 = 0;
		input_real11 = 0;
		input_real12 = 0;
		input_real13 = 0;
		input_real14 = 0;
		input_real15 = 0;
		input_imag0 = 0;
		input_imag1 = 0;
		input_imag2 = 0;
		input_imag3 = 0;
		input_imag4 = 0;
		input_imag5 = 0;
		input_imag6 = 0;
		input_imag7 = 0;
		input_imag8 = 0;
		input_imag9 = 0;
		input_imag10 = 0;
		input_imag11 = 0;
		input_imag12 = 0;
		input_imag13 = 0;
		input_imag14 = 0;
		input_imag15 = 0;
		
		#5;
		rst = 0;

		// Wait 100 ns for global reset to finish
		#20;
      input_real0 = 1;
		input_real1 = 2;
		input_real2 = 3;
		input_real3 = 4;
		
		input_imag0 = 5;
		input_imag1 = 6;
		input_imag2 = 7;
		input_imag3 = 8;
		//input: (1+5j, 2+6j, 3+7j, 4+8j)
		//expected output: [10.+26.j -4. +0.j -2. -2.j  0. -4.j]
		//0_r = 0000000000001010
		//0_c = 0000000000011010
		//1_r = 1111111111111100
		//1_c = 0000000000000000
		//2_r = 1111111111111110
		//2_c = 1111111111111110
		//3_r = 0000000000000000
		//3_c = 1111111111111100
		new_input_flag = ~new_input_flag;

	end
	
	always #2 clk = ~clk;
      
endmodule

