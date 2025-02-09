module full_adder_tb;

reg A, B, Cin;
wire sum, cr;

	full_adder_ds uut( .A(A), .B(B), .Cin(Cin), .sum(sum), .cr(cr));

initial begin
	$monitor("%0t A = %b B = %b Cin = %b sum = %b cr = %b", $time, A, B, Cin, sum, cr);
	$dumpfile("full_adder.vcd");
	$dumpvars; 
end

initial begin

	A = 0; B = 0; Cin = 0; #10;
	A = 0; B = 0; Cin = 1; #10;
	A = 0; B = 1; Cin = 0; #10;
	A = 0; B = 1; Cin = 1; #10;
	A = 1; B = 0; Cin = 0; #10;
	A = 1; B = 0; Cin = 1; #10;
	A = 1; B = 1; Cin = 0; #10;
	A = 1; B = 1; Cin = 1; #10;
	$finish;
end
endmodule


