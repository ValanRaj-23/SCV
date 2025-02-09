module half_subractor_ds(input A, B,
		    output Diff, Br);

	wire w1;
	not g0( w1, A);
	xor g1(Diff, A, B);
	and g2(Br, w1, B);

endmodule

 
