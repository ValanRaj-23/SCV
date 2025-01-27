module gray_to_binary_ds #(parameter SIZE = 4)(input [SIZE - 1:0]G,
                                               output reg [SIZE -1:0]B);
  	integer i;
  
  always@(*)
    for (i = SIZE - 1; i >= 0; i--)
  begin 
    if(i == SIZE - 1)
      B[i] = G[i];
  	  else
      B[i] = G[i] ^ G[i+1];
  end
endmodule 