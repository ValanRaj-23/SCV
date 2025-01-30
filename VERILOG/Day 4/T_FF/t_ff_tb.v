module t_ff_tb;
  reg clk, rst, t;
  wire q , qb;
  
  t_ff_ds uut( 
    .clk(clk),
    .rst(rst),
    .t(t),
    .q(q),
    .qb(qb));
  
initial
  begin
  clk=1;
  forever #5 clk=~clk;
  end
  
initial begin  
     rst=1;  #5;
     rst=0;  #5;      
    repeat(10)
      begin
   		 t = $random % 2;
        #5;
      end
  end       
  
  initial begin
    $monitor(" %0t  rst = %b d = %b q = %b", $time , rst , t, q);
    $dumpfile("dump.vcd");
    $dumpvars;
    
   #50;
    $finish;
  end
  
endmodule
