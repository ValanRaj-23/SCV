module ram(input clk,
		en,
		wr,
	input[3:0]data_in,
	input[1:0]addr,
	output reg [3:0] data_out);

reg [3:0] mem [3:0];


always@(posedge clk)
begin
	if(en && wr)
		mem[addr] <= data_in;
	else if (en && !wr)
	data_out <= mem[addr];
end

endmodule
