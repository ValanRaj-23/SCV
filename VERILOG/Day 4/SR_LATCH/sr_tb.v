module sr_tb;

reg en, rst, s, r;
wire q, qb;

sr_ds uut( en, rst, s, r , q, qb);

initial begin
	$monitor("%0t en = %b, rst = %b s = %b r = %b, q = %b qb = %b", $time, en, rst, s, r , q, qb);
	$dumpfile("dump.vcd");
	$dumpvars;
	#50 $finish;
end

initial begin
	en = 0;
	rst = 0;
	s = 0;
	r = 0;
end

initial begin
	#2 en = 1; rst = 1; 

	repeat(4)begin
		s = $random % 2;
		r = $random % 2;
		#2;
	end
end
endmodule
