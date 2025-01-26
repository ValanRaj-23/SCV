module demux_8x1_tb;
  reg y;
  reg [2:0]sel;
  wire [7:0]d;
  integer i;
  
  demux_8x1_ds uut( .y(y), .sel(sel), .d(d));
  
  initial begin
    $monitor("%t y = %b sel = %b d =%b", $time, y, sel, d);
    $dumpfile("demux_8x1.vcd");
    $dumpvars;
  end
          
                
              
 initial begin
   for (i = 0; i < 8; i++)
     begin
       y = {$random} % 2; sel = {$random} % 7;
    #10;
     end
   $finish;
 end
endmodule