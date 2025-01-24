module mux_2x1_ds(input [1:0]d,
		input sel,
		output y);

	wire w1, w2, w3;

	not G0(w1, sel);
	and G1(w2, w1, d[0]);
	and G2(w3, sel, d[1]);
	or G3(y, w2, w3);
endmodule

module mux_4x1_ds(input [3:0]d,
                  input [1:0]sel,
		output y);

	wire [1:0]m;

  mux_2x1_ds mux1(.d(d[1:0]), .sel(sel[0]), .y(m[0]));
  mux_2x1_ds mux2(.d(d[3:2]), .sel(sel[0]), .y(m[1]));
  mux_2x1_ds mux3(.d(m), .sel(sel[1]), .y(y));


endmodule