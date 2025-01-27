module decoder_3x8_ds(input [2:0]addr,
                      output reg [7:0]d);
  always@(*)
    begin
    d = 0;      
    case(addr)
      
      
      3'b000 : d[0] = 8'b1;
      3'b001 : d[1] = 8'b1;
      3'b010 : d[2] = 8'b1;
      3'b011 : d[3] = 8'b1;
      3'b100 : d[4] = 8'b1;
      3'b101 : d[5] = 8'b1;
      3'b110 : d[6] = 8'b1;
      3'b111 : d[7] = 8'b1;
     
    endcase
    end
endmodule
      