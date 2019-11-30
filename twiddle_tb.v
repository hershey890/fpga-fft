`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:05:54 11/30/2019
// Design Name:   twiddle_LUT
// Module Name:   /home/ise/ise_projects/FFT/twiddle_tb.v
// Project Name:  FFT
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: twiddle_LUT
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module twiddle_tb;

	// Inputs
	reg clk;
	reg rst;
	reg [3:0] twiddle_num;

	// Outputs
	wire [15:0] twiddle_val_real;
	wire [15:0] twiddle_val_imag;

	// Instantiate the Unit Under Test (UUT)
	twiddle_LUT uut (
		.clk(clk), 
		.rst(rst), 
		.twiddle_num(twiddle_num), 
		.twiddle_val_real(twiddle_val_real), 
		.twiddle_val_imag(twiddle_val_imag)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 1;
		twiddle_num = 0;
		#10 rst = 0;
        
		// Add stimulus here
		#40 twiddle_num = 0;
		#80 twiddle_num = 4;
		#120 twiddle_num = 8;
		#160 twiddle_num = 12;

	end
	
	always #5 clk = ~clk;
      
endmodule

