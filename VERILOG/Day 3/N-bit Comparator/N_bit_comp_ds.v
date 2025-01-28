module N_bit_comp_ds #(parameter SIZE = 8)(input [SIZE -1:0]A,B,
                      output A_greater_B,
                      output A_lesser_B,
                      output A_equal_B);
  
	assign A_greater_B = A > B;
  	assign A_lesser_B = A < B;
    assign A_equal_B = A == B;
  
endmodule