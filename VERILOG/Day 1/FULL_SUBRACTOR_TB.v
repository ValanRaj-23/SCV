module full_subractor_tb;

reg A, B, Cin;
wire Diff, Br;

	full_subractor_ds uut( .A(A), .B(B), .Cin(Cin), .Diff(Diff), .Br(Br));

initial begin
	$monitor("%0t A = %b B = %b Cin = %b Diff = %b Br = %b", $time, A, B, Cin, Diff, Br);
	$dumpfile("full_subractor.vcd");
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


