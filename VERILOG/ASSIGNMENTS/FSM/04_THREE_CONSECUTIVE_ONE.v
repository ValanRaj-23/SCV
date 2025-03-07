module three_ones(	input clk,
			input rst,
			input x,
			output z);
reg [2:0]temp1;
reg [1:0]present, next;
parameter [1:0] IDLE = 0,
		S1 = 1,
		S2 = 2;

always@(posedge clk,negedge rst)
begin
	if(!rst)
	begin
		present <= IDLE;
		temp1 <= 0;
	end	
	else
	begin
		temp1 <= {temp1[1:0],x};
		present <= next;
	end
end

always@(*)
begin
	case(present)
		IDLE :	next = S1;

		S1   :	begin
		 	if(temp1 > 1)
				next = S2;
			else 
				next = S1;
			end

		S2   :  begin
			if(temp1 > 1)
				next = S2;
			else
				next = S1;
			end
	endcase
end

assign z = (present == S2);

endmodule


