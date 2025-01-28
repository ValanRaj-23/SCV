module two_bit_multiplier_tb;
  reg [1:0] a,b;
  wire [3:0]y;
  integer i;
  
  two_bit_multiplier_ds uut ( a, b, y);
    
  initial begin
    $monitor("%t a = %b  b = %b y = %d ", $time, a, b, y);   
    $dumpfile("b_to_g.vcd");
    $dumpvars;
  end
              
 initial begin
   for(i = 0; i < 20; i++)
     begin
 	a = $random % 2;
    b = $random % 2; 
       a = 2'b10;
       b = 2'b10;
    #10;
     end
 end
 
 endmodule
