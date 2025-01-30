module jk_ff_tb;
  reg clk, rst, j, k;
  wire q, q_bar;
  
  jk_ff_ds uut ( clk, rst, j, k, q, q_bar);
  
  always #5 clk = ~clk;
  
  initial begin 
     clk = 0; rst =1;
  end
    
    #10 rst = 0;
    repeat(10)
      begin
   		 push();
        #5;
      end

  function push;
    begin
      {j,k} = {$random} % 3;
    end
  endfunction
  
  initial begin
    $monitor(" %0t  rst = %b j = %b k = %b q = %b", $time , rst , j, k, q);
    $dumpfile("dump.vcd");
    $dumpvars;
    #80;
    $finish;

  end
endmodule
