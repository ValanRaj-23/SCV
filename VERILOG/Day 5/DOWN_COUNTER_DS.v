module down_counter (input clk, rst, 
		output reg [3:0]d);
	always@(posedge clk)
	begin
		if(rst)
			d <= 4'hF;
		else 
		begin
			d <= d - 4'h1;
		end
	end
	endmodule


