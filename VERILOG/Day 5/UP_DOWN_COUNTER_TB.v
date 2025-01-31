module up_down_counter_tb;
reg clk, rst, up_down;
wire [3:0]d;

up_down_counter uut( clk, rst, up_down, d);

initial begin
	clk = 0;
	forever #5 clk = ~clk;
end

initial begin
	$monitor("%0t rst = %b  up_down = %b d = %b ", $time, rst, up_down, d);
	$dumpfile("dump.vcd");
	$dumpvars;
	
	    rst = 1; up_down = 0;
      	#10 rst = 0; 
	#80 up_down = 1;
	#200 $finish;

end
endmodule

