module siso_ds(input clk, rst, en, s_in,
						output reg s_out);
reg [3:0]reg1;
				
always@(posedge clk)
begin
	if(rst)begin
		reg1 <= 0;
	end
	else if (en)
	begin
      reg1 <= {reg1[2:0], s_in};
      s_out <= reg1[3];
	end		
end
endmodule 
