module sipo(input clk, rst, en, s_in,
			output reg [3:0]p_out);
				
always@(posedge clk)
begin
	if(rst)begin
		p_out <= 0;
	end
	else if (en)
	begin
		p_out[3] <= s_out[2];
		p_out[2] <= s_out[1];
		p_out[1] <= s_out[0];
		p_out[0] <= s_in;
	end
		
end
endmodule 
