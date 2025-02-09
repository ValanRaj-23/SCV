module half_adder_ds(input A, B,
			output sum, cr);

	assign sum = A ^ B;
	assign cr = A & B;

endmodule
