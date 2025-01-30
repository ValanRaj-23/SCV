module sr_ff_tb;
  reg clk, rst, s, r;
  wire q, q_bar;
  
  sr_ff_ds uut ( clk, rst, s, r, q, q_bar);
  
  always #5 clk = ~clk;
  
  initial begin 
     clk = 0; rst =1;
    
    #10 rst = 0;
    push(2'b01);
    push(2'b10);   
    #5 rst = 1;
    #5 rst = 0;    
	  push(2'b00);
    push(2'b11);
    
  end
  
  task push(input [1:0]d);
    begin
    @(posedge clk)
      {s,r} = d;
    #5;
    end
  endtask
  
  initial begin
    $monitor(" %0t  rst = %b s = %b r = %b q = %b", $time , rst , s, r, q);
    $dumpfile("dump.vcd");
    $dumpvars;
    #50;
    $finish;

  end
endmodule
