module ram_tb;
reg clk, en, wr;
reg [3:0]data_in;
reg [1:0]addr;
wire [3:0]data_out;

ram uut(clk, en, wr, data_in, addr, data_out);

initial begin
	clk = 0;
	forever #5 clk = ~clk;
end

initial begin
	$monitor("%t  en = %b wr = %b data_in = %b addr = %b data_out  = %b", $time, en, wr, data_in, addr, data_out);
	$dumpfile("dump.vcd");
	$dumpvars;
end

initial begin
       	en = 1; wr = 1;
	#5;
	write(2'b01,4'hA);
	write(2'b00,4'h1);
	write(2'b10,4'hC);
	write(2'b11,4'h3);
	
	 en = 1; wr = 0;

	 read(2'b01);
	 read(2'b11);
	 read(2'b10);
	 read(2'b00);

	#200;
	$finish;
end

task write;
	input [3:0]data;
	input [1:0]addr1;
	begin
	addr = addr1;
	data_in = data;
	#10;
	end
endtask

task read;
	input [1:0]addr1;
	begin
	addr = addr1;
	#10;
	end
endtask


endmodule
