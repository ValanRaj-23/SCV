module d_ff_ds(input clk, rst, d,
               output reg q, qb);
  
  always@(posedge clk)
    begin
      if(!rst)
       q <= 0;
  	else 
        if(d == 0)
        q <= 1'b0;
        else if(d)
        q <= 1'b1;     
    end
assign qb = ~q;
endmodule
  
