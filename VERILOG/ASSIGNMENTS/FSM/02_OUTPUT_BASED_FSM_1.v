module sequence_detector(input bit clk,reset,x,output z);
  parameter A = 4'h1;
  parameter B = 4'h2;
  parameter C = 4'h3;
  parameter D = 4'h4;
  
  bit[2:0]state,next_state;
  
  always@(posedge clk or negedge reset)
  if(!reset)begin
    state<=A;
  end
  else begin
    state<=next_state;
  end
  
  always@(state or x)begin
    case(state)
      A:next_state=x?B:A;
      B:next_state=x?D:C;
      C:next_state=x?C:D;
      D:next_state=x?A:A;
      default:next_state=A;
    endcase
  end
  assign z=(state==C); 
  
endmodule
