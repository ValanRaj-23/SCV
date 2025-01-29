module sr_ds(input en, rst, s, r,
		output reg q,
	       output reg qb);
	always@(*)begin
		if(!rst)
			{q,qb} <= 2'b0;
		else if(en)
		begin
			case({s,r})
				2'b00 : {q, qb} = {q,~q};
				2'b01 : {q, qb} = {1'b0,1'b1};
				2'b10 : {q, qb} = {1'b1,1'b0};
				default: {q, qb} = 2'bx;
			endcase
		end
	end
endmodule 
