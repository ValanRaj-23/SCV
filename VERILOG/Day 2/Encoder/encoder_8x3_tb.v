module encoder_8x3_tb;
  reg [7:0]d;
  wire [2:0]y;
 
  integer i;
  
  encoder_8x3_ds uut(.d(d), .y(y));
  
  initial begin
    $monitor("%t d = %b y = %b", $time, d, y);
    $dumpfile("encoder_8x3.vcd");
    $dumpvars;
  end
          
                
              
 initial begin
   
       d = 8'b00000001;  #10;
       d = 8'b00000010;  #10;
       d = 8'b00000100;  #10;
       d = 8'b00001000;  #10;
   $finish;
 end
 endmodule
