module shift_register_ds(input clk, rst, en, s_in,
						output reg [3:0]s_out);
				
always@(posedge clk)
begin
	if(rst)begin
		s_out <= 0;
	end
	else if (en)
	begin
		s_out[3] <= s_out[2];
		s_out[2] <= s_out[1];
		s_out[1] <= s_out[0];
		s_out[0] <= s_in;
	end
		
end
endmodule 
