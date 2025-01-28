module half_adder_ds(input A, B,
                     output sum, cout);
  assign sum = A ^ B;
  assign cout = A & B;
  
endmodule

module full_adder_ds(input A, B, Cin,
			output sum , Cout);

	assign sum = (A ^ B) ^ Cin;
	assign Cout = (A & B) | (A & Cin) | (B & Cin);

endmodule
	

module four_bit_multiplier_ds(input [3:0]A,B,
                         output [7:0]y);
  reg signed p[4][4];
  wire [8:0]cr;
  wire [4:1]s;

  
  genvar i;
  generate 
    for (i = 0; i < 4; i++) 
      begin
        and g0( p[i][0], A[i], B[0]);
        and g1( p[i][1], A[i], B[1]);
        and g2( p[i][2], A[i], B[2]);
        and g3( p[i][3], A[i], B[3]);        
      end
  endgenerate
    
    //column1
  assign y[0] = p[0][0];
    
    //column2
    half_adder_ds u1(p[0][1], p[1][0], y[1], cr[0]);
    
    //column3
    full_adder_ds u2(cr[0], p[2][0], p[1][1], s[1], cr[1]);
    full_adder_ds u3( s[1], cr[1], p[0][2], y[2], cr[2]);
    
    //column4
    full_adder_ds u4(cr[2], p[3][0], p[2][1], s[2], cr[3]);
    full_adder_ds u5(cr[3], s[2], p[1][2], s[3], cr[4]);
    full_adder_ds u6(cr[4], s[3], p[0][3], y[3], cr[5]);
    
    //column5
    full_adder_ds u7(cr[5], p[3][1], p[2][2], s[4], cr[6]);
    full_adder_ds U8( s[4], cr[6], p[1][3], y[4], cr[7]);
    
    //column6
    full_adder_ds u9(cr[7], p[3][2], p[2][3], y[5], cr[8]);
    
    //column7
    half_adder_ds u10(cr[8], p[3][3], y[6], y[7]);
    
 endmodule
                     
                     
   
    
    
                         
                         

  