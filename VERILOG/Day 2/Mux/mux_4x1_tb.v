module mux_4x1_tb;

reg [3:0]d;
reg [1:0]s;
wire y;

mux_4x1_ds uut(.d(d),
               .sel(s),
               .y(y));

initial 
begin
    d = 4'b0001; s = 4'b00; #10;
    d = 4'b0010; s = 4'b01; #10;
    d = 4'b0100; s = 4'b10; #10
    d = 4'b1000; s = 4'b11; #10;
    $finish;
end

initial
  begin
    $monitor("%0t d = %b s = %b y = %b", $time, d, s, y);
    $dumpfile("mux_4x1.vcd");
    $dumpvars; 
  end
    
endmodule
