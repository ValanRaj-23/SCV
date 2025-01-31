module up_counter_tb;
reg clk, rst;
wire [3:0]d;

up_counter uut( clk, rst, d);

initial begin
	clk = 0;
	forever #5 clk = ~clk;
end

initial begin
	$monitor("%0t rst = %b d = %b", $time, rst, d);
	$dumpfile("dump.vcd");
	$dumpvars;
	
	 rst = 1;
      	#10 rst = 0;

	#200 $finish;

end
endmodule

