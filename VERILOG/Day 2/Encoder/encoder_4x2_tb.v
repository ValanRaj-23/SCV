module encoder_4x2_tb;
  
  reg [3:0]d;
  wire [1:0]y;
  integer i;
  
  encoder_4x2_ds uut(.d(d), .y(y));
  
  initial begin
    $monitor("%t d = %b y = %b", $time, d, y);
    $dumpfile("encoder_4x2.vcd");
    $dumpvars;
  end
          
                
              
 initial begin
   for (i = 0; i < 4; i++)
     begin
       d = {$random} % 3;  #10;
     end
   $finish;
 end
endmodule
