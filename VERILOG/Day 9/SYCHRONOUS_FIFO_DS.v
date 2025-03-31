module SYNC_FIFO #(parameter WIDTH = 8,
		   parameter DEPTH = 8)
		   (input clk, rst,
		   input [WIDTH-1:0] din,
		   input wr_en,
	      	   input rd_en,
	           output full,
	           output empty,
	           output reg [7:0]dout);

reg [WIDTH-1:0] mem [DEPTH-1:0];
reg [2:0] wrptr, rdptr;
	always@(posedge clk or negedge rst)
	if(rst)begin
		dout <= 0;
	end

	always@(posedge clk or posedge rst)begin
	if(rst)
		wrptr <= 0;
	else if(wr_en && (!full))
	begin
		mem[wrptr] <= din;
		wrptr <= wrptr + 1'b1; // write pointer
	end
	end
	always@(posedge clk or posedge rst)begin
	if(rst)
		rdptr <= 0;
	else if(rd_en && (!empty))
	begin
		dout <= mem[rdptr];
		rdptr <= rdptr + 1'b1;// read poiner
	end
	end

	assign full = ((wrptr + 1'b1) % DEPTH) == rdptr;
	assign empty = (wrptr == rdptr) && !wr_en;
endmodule
		
		



	

