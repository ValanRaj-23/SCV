module pri_encoder_8x3_tb;
  reg [7:0]d;
  wire [2:0]y;
 
  integer i;
  
  pri_encoder_8x3_ds uut(.d(d), .y(y));
  
  initial begin
    $monitor("%t d = %b y = %b", $time, d, y);
    $dumpfile("pri_encoder_8x3.vcd");
    $dumpvars;
  end
          
                
              
 initial begin
   
   for( i = 0; i < 7; i++)
     begin
       d = $random; #10;
     end
       $finish;
 end
 endmodule
