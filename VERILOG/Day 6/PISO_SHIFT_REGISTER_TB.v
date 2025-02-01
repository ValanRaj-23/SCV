module PISO_TB;
reg clk, rst, load;
reg [3:0]p_in;
wire s_out;

PISO uut( clk, rst,load, p_in, s_out);

initial begin
clk =0;
forever #5 clk = ~clk;
end

initial begin
	$monitor("%0t rst = %b pin = %b s_out = %b", $time, rst, p_in, s_out);
	$dumpfile("dump.vcd");
	$dumpvars;
	#5 rst = 1;
	#10 rst = 0; 
	#10 load = 1'b1; p_in = 4'hf;
	#10 load = 1'b0;
	#40;
        #10;load = 1'b1; p_in = 4'he;
	#10;load = 1'b0;
	#1000;
	$finish;	
end
endmodule
