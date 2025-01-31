module sipo_tb;
reg  clk, rst, en;
reg s_in;
wire [3:0] p_out;

sipo uut( .clk(clk), .rst(rst), .en(en), .s_in(s_in), .p_out(p_out));

initial begin
	forever
	begin
		#5 clk =~clk;
	end
end



initial begin
	$monitor("%0t rst = %b en = %b data = %b , sout =%b", $time, rst, en, s_in, p_out);
	$dumpfile("dump.vcd");
	$dumpvars;

end

initial begin
	clk = 0;
       	rst = 1;
       	s_in = 0;
	en = 0;
end

initial begin
	#15 rst = 0;
        en = 1;

        #10 s_in = 1;
        #10 s_in = 0;
        #10 s_in = 1;
        #10 s_in = 1;
        #10 s_in = 0;
     	#50 $finish;
end
endmodule
