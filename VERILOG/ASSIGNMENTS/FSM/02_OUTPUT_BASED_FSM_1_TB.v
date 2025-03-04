module sequence_detector_tb;
  reg clk, reset, x;
  wire z;
  
  sequence_detector sd(clk, reset, x, z);
  initial clk = 0;   
  always #2 clk = ~clk;
    
  initial begin
    x = 0;
    #2 reset = 0;
    #4 reset = 1;
    
    #4 x = 0;
    #4 x = 0;
    #4 x = 0;
    #4 x = 1;
    #4 x = 0;
    #4 x = 1;
    #4 x = 1;
    #4 x = 1;
    #4 x = 0;
    #4 x = 0;
    #4 x = 0;
    #4 x = 0;
    #4 x = 0;
    #4 x = 1;
    #4 x = 0;
    #8;
    #4 x = 0;
    #4 x = 0;
    #4 x = 0;
    #4 x = 1;
    #4 x = 0;
    #4 x = 0;
    #4 x = 0;
    #4 x = 1;
    #4 x = 0;
    #4 x = 0;
    #4 x = 0;
    
    $finish;
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0);
    $monitor("%0t clk = %0b x = %0b z = %0b", $time, clk, x, z);
   end
endmodule
