module moore_110_nov(input clk, rst, din,
		output reg dout);
reg [1:0]state;

 parameter s0 = 2'b00;
 parameter s1 = 2'b01;
 parameter s2 = 2'b10;
 parameter s3 = 2'b11;

 always @(posedge clk or negedge rst)
 begin
	 if(rst)begin
		 state <= s0;
	 end
	 else begin
		 case(state)
			 s0 : begin
				 dout <= 1'b0; 
				 if(din == 0)begin
					 state <= s0;
				 end
				 else begin
					 state <= s1;
				 end
			 end
			 s1 : begin
				 dout <= 1'b0; 
				 if(din == 0)begin
					 state <= s0;
				 end
				 else begin
					 state <= s2;
				 end
			 end
			 s2 : begin
				 dout <= 1'b0; 
				 if(din == 0)begin
					 state <= s3;
				 end
				 else begin
					 state <= s2;
				 end
			 end
			  s3 : begin
				  dout <= 1'b1; 
				 if(din == 0)begin
					 state <= s3;
				 end
				 else begin
					 state <= s1;
				 end
			 end
		 endcase
	 end
 end	 
endmodule
