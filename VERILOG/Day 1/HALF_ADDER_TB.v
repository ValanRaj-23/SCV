module half_adder_tb;
reg A, B;
wire sum, cr;

half_adder_ds uut(.A(A), .B(B), .sum(sum), .cr(cr));

initial begin
	$monitor("%0t A = %b B =  %b sum =  %b cr = %b", $time, A, B, sum, cr);
	$dumpfile("half_adder.vcd");
	$dumpvars;
end

initial begin 
	A = 0; B = 0; #10;
	A = 0; B = 1; #10;
	A = 1; B = 0; #10;
	A = 1; B = 1; #10;
	$finish;
end

endmodule
