module half_subractor_tb;
reg A, B;
wire Diff, Br;

half_subractor_ds uut(.A(A), .B(B), .Diff(Diff), .Br(Br));

initial begin
	$monitor("%0t A = %b B =  %b Diff =  %b Br = %b", $time, A, B, Diff, Br);
	$dumpfile("half_subractor.vcd");
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
