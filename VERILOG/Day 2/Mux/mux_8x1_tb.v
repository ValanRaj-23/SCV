module mux_8x1_tb;

  reg [7:0]d;
  reg [2:0]s;
  wire y;

mux_8x1_ds uut(.d(d),
               .sel(s),
               .y(y));

initial 
begin
	d = 8'b00000001; s = 3'b000; #10;
	d = 8'b00000010; s = 3'b001; #10;
	d = 8'b00000100; s = 3'b010; #10;
	d = 8'b00001000; s = 3'b011; #10;
	$finish;
end

initial
  begin
    $monitor("%0t d = %b s = %b y = %b", $time, d, s, y);
    $dumpfile("mux_8x1.vcd");
    $dumpvars; 
  end
	
endmodule
