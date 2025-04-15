//8x1 mux using two 4x1 mux
module mux_4x1_ds(input [3:0]d,
                  input [1:0]sel,
                  output reg y);

  always@(*)
    begin
      case(sel)
        2'b00 : y = d[0];
        2'b01 : y = d[1];
        2'b10 : y = d[2];
        2'b11 : y = d[3];
      endcase
    end
endmodule

module mux_8x1_ds(input [7:0]d,
                  input [2:0]sel,
		output y);

  wire [1:0]m;

  mux_4x1_ds mux1(.d(d[3:0]), .sel(sel[1:0]), .y(m[0]));
  mux_4x1_ds mux2(.d(d[7:4]), .sel(sel[1:0]), .y(m[1]));
  
  assign y = sel[2] ? m[1] : m[0];
  
endmodule
