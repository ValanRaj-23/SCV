module dram_tb;
parameter WIDTH = 8;
parameter ADDR = 6;
reg clk;
reg ena, enb;
reg wra, wrb;
reg [WIDTH-1:0]din_a;
reg [WIDTH-1:0]din_b;
reg [ADDR-1:0]addr_a;
reg [ADDR-1:0]addr_b;
wire [WIDTH-1:0]dout_a;
wire [WIDTH-1:0]dout_b;

dram_ds uut( .clk(clk),
	     .ena(ena),
	     .enb(enb),
	     .wra(wra),
	     .wrb(wrb),
	     .din_a(din_a),
	     .din_b(din_b),
	     .addr_a(addr_a),
	     .addr_b(addr_b),
	     .dout_a(dout_a),
	     .dout_b(dout_b));

     initial begin
	     clk = 0;
	     forever #5 clk = ~clk;
     end

     initial begin
	     $dumpfile("dump.vcd");
	     $dumpvars;
	     #200;
	     $finish;
     end

/// PORT A
initial begin
	#5;
     	ena = 1'b1; wra = 1'b1;
	write_a(8'h22,3'h3);
	write_a(8'h33,3'h2);

	#5;
     	ena = 1'b1; wra = 1'b0;

	read_a(3'h2);
	read_a(3'h3);
   end
//PORT B
initial begin
	#15;
     	enb = 1; wrb = 1;
	write_b(8'h44,3'h4);
	write_b(8'h55,3'h5);
	#5;
     	enb = 1; wrb = 0;

	read_b(3'h4);
	read_b(3'h5);
   end


task write_a;
	input [WIDTH-1:0]data0;
	input [ADDR-1:0]addr0;
	begin
	@(posedge clk)
	$display("%0t writea ena = %h wra = %h addr_a = %h din_a = %h dout_a = %h ", $time, ena, wra, addr_a, din_a , dout_a);	
	addr_a = addr0;
	din_a = data0;
	#10;
	end
endtask

task read_a;
	input [ADDR-1:0]addr1;
	begin
	@(posedge clk)	
	$display("%0t reada ena = %h wra = %h addr_a = %h din_a = %h dout_a = %h ", $time, ena, wra, addr_a, din_a, dout_a);	
	addr_a = addr1;
	#10;
	end
endtask
task write_b;
	input [WIDTH-1:0]data1;
	input [ADDR-1:0]addr2;
	begin
	@(posedge clk)	
	$display("%0t writeb enb = %h wrb = %h addr_b = %h din_b = %h dout_b = %h ", $time, enb, wrb, addr_b, din_b, dout_b);	
	addr_b = addr2;
	din_b = data1;
	#10;
	end
endtask

task read_b;
	input [ADDR-1:0]addr3;
	begin
	@(posedge clk)
	$display("%0t readb enb = %h wrb = %h addr_b = %h din_b = %h dout_b = %h ", $time, enb, wrb, addr_b, din_b, dout_b);	
	addr_b = addr3;
	#10;
	end
endtask

endmodule
