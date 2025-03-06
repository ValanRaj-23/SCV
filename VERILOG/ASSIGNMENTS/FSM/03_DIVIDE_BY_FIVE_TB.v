module fsm2_tb;
  reg clk, reset, x;
  wire z;
  
  divide_by_five sd(clk, reset, x, z);
  initial clk = 0;   
  always #2 clk = ~clk;
    
  initial begin
    x = 0;
    #2 reset = 0;
    #4 reset = 1;
    
   repeat(29)
   	begin
		#4;
		x = $random;
	end

    $finish;
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0);
    $monitor("%0t clk = %0b x = %0b z = %0b", $time, clk, x, z);
   end
endmodule
