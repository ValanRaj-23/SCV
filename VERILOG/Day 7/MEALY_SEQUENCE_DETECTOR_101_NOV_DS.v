module mealy_101(input clk, rst, din,
		output reg dout);
reg [1:0]state;

 parameter s0 = 2'b00;
 parameter s1 = 2'b01;
 parameter s2 = 2'b10;

 always @(posedge clk or negedge rst)
 begin
	 if(rst)begin
		 state <= s0;
		 dout <= 1'b0;
	 end
	 else begin
		 case(state)
			 s0 : begin
				 if(din)begin
					 state <= s1;
					 dout <= 1'b0;
				 end
				 else begin
					 state <= s0;
					 dout <= 1'b0;
				 end
			 end
			 s1 : begin
				 if(din)begin
					 state <= s1;
					 dout <= 1'b0;
				 end
				 else begin
					 state <= s2;
					 dout <= 1'b0;
				 end
			 end
			 s2 : begin
				 if(din)begin
					 state <= s0;
					 dout <= 1'b1;
				 end
				 else begin
					 state <= s0;
					 dout <= 1'b0;
				 end
			 end
		 endcase
	 end
 end	 
endmodule
