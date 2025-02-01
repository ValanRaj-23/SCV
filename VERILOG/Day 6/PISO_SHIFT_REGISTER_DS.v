module PISO(input clk, rst, load,
	input [3:0]p_in,
	output reg s_out);
reg [3:0]reg1;

always@(posedge clk or negedge rst)
	if(rst)
		reg1 <= 4'h0;
	else if(load)
     		reg1 <= p_in;
	else begin
		s_out <= reg1[3];		
		reg1 = {reg1[2:0],1'b0};
	end	
endmodule


