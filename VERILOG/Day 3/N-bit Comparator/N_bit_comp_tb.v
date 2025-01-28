module N_bit_comp_tb;
  parameter SIZE = 8;
  reg [SIZE-1:0]A,B;
  wire A_greater_B, A_lesser_B, A_equal_B;
 
  
  integer i;
  
  N_bit_comp_ds uut(.A(A),
                 .B(B),
                 .A_greater_B( A_greater_B),
                 .A_lesser_B(A_lesser_B),
                 .A_equal_B(A_equal_B));
  
  initial begin
    $monitor("%t A = %b B = %b A > B = %b, A < B = %b, A == B = %b", $time, A, B, A_greater_B, A_lesser_B, A_equal_B);
    $dumpfile("N_bit_comp.vcd");
    $dumpvars;
  end
              
 initial begin
   
   for(i = 0; i < 15; i++)
     begin
 	A = $random % SIZE - 1;  
    B = $random % SIZE - 1;
    #10;
     end
 end
 
 endmodule
