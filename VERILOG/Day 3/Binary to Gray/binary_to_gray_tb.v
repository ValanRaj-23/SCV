module binary_to_gray_tb;
  reg [3:0]B;
  wire [3:0]G;
 
  
  integer i;
  
  binary_to_gray_ds uut( .B(B), .G(G));
    
  initial begin
    $monitor("%t B = %b G = %b ", $time, B, G);   
    $dumpfile("b_to_g.vcd");
    $dumpvars;
  end
              
 initial begin
   
   for(i = 0; i < 15; i++)
     begin
 	B = $random % 3;
    #10;
     end
 end
 
 endmodule
