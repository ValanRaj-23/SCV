module pri_encoder_8x3_ds(input [7:0]d,
                      output reg [2:0]y);
  
  always@(*)
    casex(d)
      
      8'b1zzzzzzz : y = 3'b111;
      8'b01xzxzxz : y = 3'b110;
      8'b001xxzxx : y = 3'b101;
      8'b0001zzzz : y = 3'b100;
      8'b00001zxz : y = 3'b011;
      8'b000001xx : y = 3'b010;
      8'b0000001z : y = 3'b001;
      8'b00000001 : y = 3'b000;

      default y = 3'b001;
    endcase
  
endmodule 