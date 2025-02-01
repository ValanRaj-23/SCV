module PIPO(input clk, rst,
		input [3:0]p_in,
		output reg [3:0]p_out);
	always@(posedge clk or negedge rst)
	begin
		if(rst)
			p_out <= 0;
		else 
			p_out = p_in;
	end
endmodule

	

