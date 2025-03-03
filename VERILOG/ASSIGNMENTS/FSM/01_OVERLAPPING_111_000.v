module overlapping(	input clk,
			input reset,
			input x,
			output reg y);
 
reg temp1;
reg [3:0] present, next;

parameter [3:0] IDLE 	= 4'b0001,
		S1	= 4'b0010,
		S2	= 4'b0100,
		S3	= 4'b1000;

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
	    y = 0;
	    next = present;
		case(present)
			IDLE	: begin
					y = 0;
					temp1 = x;
					next = S1;
				end

			S1	: begin
					if(temp1 == x)
					begin
						temp1 = x;
						next = S2;
					end
					else
					begin
						next = IDLE;
					    	temp1 = 0;
				    end
				end

			S2	: begin
					if(temp1 == x)
					begin
					    	temp1 = x;						
						next = S3;
					end
					else
					begin
						next = IDLE;
					    	temp1 = 0;
				    end
				end
			S3	: begin
					y = 1'b1;
					if(temp1 == x)
					begin
					    	temp1 = x;
						next = S3;
					end
					else
					begin
						next = IDLE;
					    	temp1 = 0;
				    end				
                   end

		endcase
	end

	

endmodule


	
