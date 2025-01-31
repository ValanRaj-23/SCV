module up_down_counter(input clk, rst, up_down,
		output reg [3:0]d);
	always@(posedge clk)
	begin
		if(rst)
			d <= 4'h0;

		else
			case(up_down)
				1'b0 : d <= d + 4'h1;
				1'b1 : d <= d - 4'h1;
			endcase
	end	
endmodule


