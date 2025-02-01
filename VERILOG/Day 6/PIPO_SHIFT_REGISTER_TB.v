module PIPO_TB;
reg clk, rst;
reg [3:0]p_in;
wire [3:0]p_out;

PIPO uut(clk, rst, p_in, p_out);

initial begin
clk =0;
forever #5 clk = ~clk;
end

initial begin
	$monitor("%0t rst = %b pin = %b p_out = %b", $time, rst, p_in, p_out);
	$dumpfile("dump.vcd");
	$dumpvars;
	#5 rst = 1;
	#10 rst = 0; 
	repeat(10)
	begin
	p_in = $random % 4;
	#10;
	end
	#100;
	$finish;	
end
endmodule

