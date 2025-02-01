module t_ff_tb;
  reg clk, rst, t;
  wire [3:0]q;
  
  asyn_counter uut(clk, rst, t, q);
  
  always #5 clk = ~clk;
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  	clk = 0;
    #5 rst = 1;
    #10 rst = 0;
    t = 1;
    #200;
    $finish;
  end
endmodule
