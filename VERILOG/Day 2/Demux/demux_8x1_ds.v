module demux_8x1_ds(input y,
                    input [2:0]sel,
                    output reg [7:0]d);
  
  always@ (*)
    begin
      case(sel)
        
        3'b000 : d = {7'b0, y};
        3'b001 : d = {6'b0, y, 1'b0};
        3'b010 : d = {5'b0, y, 2'b0};
        3'b011 : d = {4'b0, y, 3'b0};
        3'b100 : d = {3'b0, y, 4'b0};
        3'b101 : d = {2'b0, y, 5'b0};
        3'b110 : d = {1'b0, y, 6'b0};
        3'b111 : d = {y, 7'b0};       
        
      endcase    
    end
endmodule