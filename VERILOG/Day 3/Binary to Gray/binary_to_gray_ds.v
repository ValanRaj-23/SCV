module binary_to_gray_ds(input [3:0]B,
                         output reg [3:0]G);
  	integer i;
  always@(*)
    for (i = 3; i >= 0; i--)
  begin
      
    if(i == 3)
        G[i] = B[i];
  	  else
        G[i] = B[i] ^ G[i+1];
  end
endmodule 