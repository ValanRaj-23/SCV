module decoder_8x3_tb;
  reg [2:0]addr;
  wire [7:0]d;
 
  integer i;
  
  decoder_3x8_ds uut(.addr(addr), .d(d));
  
  initial begin
    $monitor("%t addr = %b d = %b", $time, addr, d);
    $dumpfile("decoder_8x3.vcd");
    $dumpvars;
  end
          
                
              
 initial begin
   addr = 0;   
   for(i = 0; i < 8; i++)
     begin
       addr = addr + i;
       #10;
     end
 end
 
 endmodule
