module d_ff_tb;
  reg clk, rst, d;
  wire q , qb;
  
  d_ff_ds uut( 
    .clk(clk),
    .rst(rst),
    .d(d),
    .q(q),
    .qb(qb));  
initial
  begin
  clk=1;
  forever #5 clk=~clk;
  end
  initial begin
    
     rst=1; #5;
     rst=0; #10;
         
    repeat(10)
      begin
        d = $urandom_range(0,1);
        #5;
      end
  end
  
  initial begin
    $monitor(" %0t  rst = %b d = %b q = %b", $time , rst , d, q);
    $dumpfile("dump.vcd");
    $dumpvars;
    
   #50;
    $finish;
  end
  
endmodule
