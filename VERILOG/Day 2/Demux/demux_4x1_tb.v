module demux_4x1_tb;
  reg y;
  reg [1:0]sel;
  wire [3:0]d;
  
  demux_4x1_ds uut( .y(y), .sel(sel), .d(d));
  
  initial begin
    $monitor("%t y = %b sel = %b d =%b", $time, y, d, sel);
    $dumpfile("demux_4x1.vcd");
    $dumpvars;
  end
              
              
 initial begin
   y = 1'b1; sel = 2'b00; #10;
   y = 1'b1; sel = 2'b01; #10;
   y = 1'b0; sel = 2'b10; #10; 
   y = 1'b1; sel = 2'b11; #10;
 end
endmodule