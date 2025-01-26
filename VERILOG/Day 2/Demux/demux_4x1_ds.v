module demux_4x1_ds(input y,
                    input [1:0]sel,
                    output reg [3:0]d);
  
  always@ (*)
    begin
      case(sel)
        
        2'b00 : d = {3'b0, y};
        2'b01 : d = {2'b0, y, 1'b0};
        2'b10 : d = {1'b0, y, 2'b0};
        2'b11 : d = {y, 3'b0};
        default d = 4'b0;
        
      endcase    
    end
endmodule