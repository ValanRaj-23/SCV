module divide_by_five(	input clk,
			input rst,
			input x,
			output z);

reg[31:0] temp1 = 0;
reg[31:0] count;
reg [1:0] present, next;

parameter [1:0] IDLE = 1,
		STATE1 = 2,
		STATE2 = 3;

always@(posedge clk)
begin
	if(!rst)
	begin
		present <= IDLE;
		count <= 1;
		temp1[0] = x;
		
	end
	else
	begin
		present <= next;
		temp1[count] <= x;
		count = count + 1;
	end
end

always@(*)
begin
	case(present)
	IDLE	:	begin
				next = STATE1;
			end
	STATE1	: 	begin
				if(!(temp1 % 5))
					next = STATE2;
				else
					next = STATE1;
			end
	STATE2	: 	begin
				if(!(temp1 % 5))
					next = STATE2;
				else
					next = STATE1;
			end
	endcase
end

assign z = (present == STATE2);
    
endmodule
