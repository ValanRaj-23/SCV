module full_adder_ds(input A,B,Cin,
			output sum, cr);

	wire w1,w2,w3,w4;

	xor g0(w1, A, B);
	xor g1(sum, w1, Cin);
	and g2(w2, A, B);
	and g3(w3, A, Cin);
	and g4(w4, B, Cin);
	or g5(cr, w2, w3, w4);

	endmodule

