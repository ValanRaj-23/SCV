module nbit_counter_tb;
  reg clk, rst, t;
  reg up_down;
  wire [3:0]q;
  wire [3:0]qb;
  
  asyn_counter uut(clk, rst, t, up_down, q, qb);
  
  always #5 clk = ~clk;

  initial begin
    clk = 0;
    rst = 0;
    t = 0;
    up_down = 0;    
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  	clk = 0;
    #5 rst = 1;
    #10 rst = 0; up_down = 1;
    t = 1;
    #100;
    up_down = 0;
    #200;
    $finish;
  end
endmodule
