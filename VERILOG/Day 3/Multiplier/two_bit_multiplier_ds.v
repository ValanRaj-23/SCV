module half_adder_ds(input a, b,
                     output sum, cout);
  assign sum = a ^ b;
  assign cout = a & b;
  
endmodule

module two_bit_multiplier_ds(input [1:0]a,b,
                             output [3:0]y);
  wire [3:0]p;
  wire [1:0]c;
  
  
  //product terms
  assign p[0] = a[0] & b[0];
  assign p[1] = a[1] & b[0];
  assign p[2] = a[0] & b[1];
  assign p[3] = a[1] & b[1];
  


  half_adder_ds ha1(.a(p[1]), .b(p[2]), .sum(y[1]), .cout(c[0]));
  half_adder_ds ha2(.a(p[3]), .b(c[0]), .sum(y[2]), .cout(c[1]));
  assign y[0] = p[0];
  assign y[3] = c[1];  

  
endmodule
         
                      