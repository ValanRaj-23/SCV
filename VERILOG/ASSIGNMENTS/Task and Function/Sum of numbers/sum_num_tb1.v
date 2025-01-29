module sum_func_tb;
reg [3:0]A, B;
wire [5:0]sum;

sum_func s1( A, B, sum);

initial begin
	$monitor("%t A = %h B = %h sum = %h ",$time, A, B, sum);
	$dumpfile("dump.vcd");
	$dumpvars;
	#100; $finish;
end

initial begin
	A = 4'h5; B = 4'h6; #5;
	A = 4'h2; B = 4'hA; #5;
	A = 4'h1; B = 4'h7; #5;	
end

endmodule
