module mealy_1011_nov(input clk, rst, din,
		output dout);

reg [1:0]p_state, n_state;

 parameter s0 = 2'b00;
 parameter s1 = 2'b01;
 parameter s2 = 2'b10;
 parameter s3 = 2'b11;

 always @(posedge clk or negedge rst)
 begin
	 if(rst)
		 p_state <= s0;
	 else 
		 p_state <= n_state;
 end
	 
 always@(p_state or din)begin
	case(p_state)
		s0 : begin
			if(din == 0)
				n_state <= s0;
			else
				n_state <= s1;
		end
		s1 : begin
			if(din == 0)
				n_state <= s2;
			else
				n_state <= s1;
		end
		s2 : begin
			if(din == 0)
				n_state <= s0;
			else
				n_state <= s3;
		end
		s3 : begin
			if(din == 0)
				n_state <= s0;
			else
				n_state <= s1;
		end
	endcase
end

assign dout = (p_state == s3 ) && (din == 1);  
endmodule
