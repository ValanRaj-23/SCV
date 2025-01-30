module t_ff_ds(input clk, rst, t,
               output reg q, qb);
  
  always@(posedge clk)
    begin
    if(rst)
      q = 0;
    else
      case(t)
        1'b0 : q = q;
        1'b1 : q = ~q;
      endcase
    end
  assign qb = ~q;
endmodule
    
