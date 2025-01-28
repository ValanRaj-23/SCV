module four_bit_multiplier_tb;
  reg [3:0] A,B;
  wire [7:0]y;
  integer i;
  
  four_bit_multiplier_ds uut( A, B, y);
    
  initial begin
    $monitor("%t a = %d b = %d y = %d ", $time, A, B, y);   
    $dumpfile("b_to_g.vcd");
    $dumpvars;
  end
              
 initial begin
   
//    for(i = 0; i < 20; i++)
     begin
 	A = 2; B = 3; #10;
    A = 3; B = 3; #10;
    A = 7; B = 3; #10;
    A = 11; B = 7; #10;
     end
 end
 
 endmodule
