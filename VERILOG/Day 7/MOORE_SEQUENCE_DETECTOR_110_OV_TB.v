module  mealy_110_nov_tb;
reg clk, rst, din;
wire dout;

moore_110_nov uut(clk, rst, din, dout);


initial begin
	$monitor("%0t rst = %b din = %b dout = %b", $time, rst, din, dout);
	$dumpfile("dump.vcd");
	$dumpvars;
end

initial begin
clk = 0;
forever #5 clk = ~clk;	
end

initial begin
  #5 rst = 1; din = 1;
  #10 rst = 0; din = 0;
  #10 din = 1;
  #10 din  = 1;
  #10 din  = 0;
  #10 din = 1;
  #10 din = 0;
  #10 din = 1;
  #10 din = 0;
  #10 din = 1;
  #10 din = 1;
  #10 din = 0;
  #10 din = 1;
  #10 din = 0;
  #10;
  $finish;
end
endmodule
