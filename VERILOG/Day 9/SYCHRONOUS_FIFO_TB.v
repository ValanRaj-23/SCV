module SYNC_FIFO_TB;
parameter WIDTH = 8;
parameter DEPTH = 8;

reg clk, rst, wr_en, rd_en;
wire full, empty;
reg [WIDTH-1:0]din;
wire [WIDTH-1:0]dout;

SYNC_FIFO uut( .clk(clk),
	       .rst(rst),
	       .din(din),
	       .wr_en(wr_en),
	       .rd_en(rd_en),
	       .full(full),
	       .empty(empty),
	       .dout(dout));

initial begin
	clk = 0;
	forever #5 clk = ~clk;
end

initial begin
	#5 rst = 1'b1;
	#10 rst = 0;
	rd_en = 0;
	wr_en = 1;
       	din = 8'h45; #10;
       	din = 8'h45; #10;
	din = 8'h32; #10;
	din = 8'h23; #10;
	din = 8'h98; #10;
	din = 8'h11; #10;
	din = 8'h33; #10;
	wr_en = 0;

	#20; rd_en = 1;
	#80; rd_en = 0;
end

initial begin
	$monitor("%0t rst = %b wr_en = %b rd_en = %b din = %b dout = %b ", $time, rst, wr_en, rd_en, din, dout);
	$dumpfile("dump.vcd");
	$dumpvars;
	#200;
	$finish;
end
endmodule
