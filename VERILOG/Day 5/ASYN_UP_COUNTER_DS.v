module t_ff(input clk, reset, t,
           output reg q);
  
  always @(negedge clk) 
    if(reset)
      q<=1'b0;
   else 
     q<=~q;
endmodule

module asyn_counter(input clk, rst, t,
                    output reg [3:0]q);
  
  t_ff f1( clk, rst, t, q[0]);
  t_ff f2( q[0], rst, t, q[1]);
  t_ff f3( q[1], rst, t, q[2]);
  t_ff f4( q[2], rst, t, q[3]);
endmodule
