module t_ff(input clk, rst, t,
           output reg q,
            output  qb);
  
  always @(posedge clk or negedge rst) 
    begin
    if(rst)
      q<=1'b1;
   else 
     q<=~q;
    end
  assign qb = ~q;  
endmodule


module asyn_counter(input clk, rst, t,
                    input up_down,
                    output   [3:0]q,
                    output   [3:0]qb);
  
  genvar i;
  t_ff f3( .clk(clk), .rst(rst), .t(t), .q(q[0]), .qb(qb[0]));
    generate
      for (i = 1; i < 4; i=i+1)
        begin
          t_ff f2(.clk(up_down ? qb[i-1] : q[i-1]), .rst(rst), .t(t), .q(q[i]), .qb(qb[i]));
        end
endgenerate
endmodule

