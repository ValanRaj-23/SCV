module fsm1_tb;
reg clk;
reg reset;
reg x;
wire y;

overlapping uut(	clk,
			reset,
			x,
			y);

always #5 clk = ~clk;

initial begin 
	clk = 0;
	reset = 0;
	x = 1;
	#15;
	reset = 1;
end

always@(posedge clk)
begin
	#10;
	x = $random;
end

initial begin
	$dumpfile("test.vcd");
	$dumpvars;
	#1000;
	$finish;
end
	
endmodule
	

