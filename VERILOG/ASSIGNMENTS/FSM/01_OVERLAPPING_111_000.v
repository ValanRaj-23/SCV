module overlapping(	input clk,
			input reset,
			input x,
			output reg y);
 
reg temp1, temp2, temp3;
reg [1:0] present, next;

parameter [1:0] IDLE 	= 0,
		S1	= 1,
		S2	= 2,
		S3	= 3;

always@(posedge clk)
begin
	if(!reset)
		present <= IDLE;
	else 
	begin
		present <= next;
	end
end

always@(*)
begin
	if(!reset)
	begin
		y = 0;
		temp1 = 0;
		temp2 = 0;
		temp3 = 0;
	end
	else
	begin
	    y = 0;
	    temp1 = temp1;
		temp2 = temp2;
		temp3 = temp3;
	    next = IDLE;
		case(present)
			IDLE	: begin
					y = 0;
					temp1 = x;
					next = S1;
					
				end

			S1	: begin
					if(temp1 == x)
					begin
						temp2 = x;
						next = S2;
					end
					else
						next = IDLE;
				end

			S2	: begin
					if(temp2 == x)
					begin
						temp3 = x;
						next = S3;
					end
					else
						next = IDLE;
				end
			S3	: begin
					y = 1'b1;
					if(temp3 == x)
					begin
						temp3 = x;
						next = S3;
					end
					else
						next = IDLE;
				end

		endcase
	end
end
	

endmodule


	
