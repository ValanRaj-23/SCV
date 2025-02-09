module half_subractor_ds(input A, B,
		    output Diff, Br);

	wire w1;
	not g0( w1, A);
	xor g1(Diff, A, B);
	and g2(Br, w1, B);

endmodule

module full_subractor_ds(input A, B, Cin,
			output Diff, Br);

	half_subractor_ds m1(.A(A), .B(B), .Diff(w2), .Br(w3));
	half_subractor_ds m2(.A(w2), .B(Cin), .Diff(Diff), .Br(w4));
	or g1(Br, w3, w4);

endmodule






 
