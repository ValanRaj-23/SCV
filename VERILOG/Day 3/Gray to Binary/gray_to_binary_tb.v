`define SIZE 4

module gray_to_binary_tb;
  reg [`SIZE - 1:0]G;
  wire [`SIZE - 1:0]B;
 
  
  integer i;
  
  gray_to_binary_ds #(`SIZE) uut( .B(B), .G(G));
    
  initial begin
    $monitor("%t G = %b  B = %b ", $time, G, B);   
    $dumpfile("b_to_g.vcd");
    $dumpvars;
  end
              
 initial begin   
   for(i = 0; i < 20; i++)
     begin
 	G = $random % `SIZE - 1;
        #10;
     end
 end
 
 endmodule
