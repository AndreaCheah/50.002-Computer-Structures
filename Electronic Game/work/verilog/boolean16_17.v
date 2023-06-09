/*
   This file was generated automatically by Alchitry Labs version 1.2.7.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module boolean16_17 (
    input [5:0] alufn,
    input [15:0] x,
    input [15:0] y,
    output reg [15:0] result
  );
  
  
  
  always @* begin
    
    case (alufn[0+3-:4])
      4'h0: begin
        result = 16'h0000;
      end
      4'h1: begin
        result = ~(x | y);
      end
      4'h6: begin
        result = x ^ y;
      end
      4'h7: begin
        result = ~(x & y);
      end
      4'h8: begin
        result = x & y;
      end
      4'h9: begin
        result = ~(x ^ y);
      end
      4'he: begin
        result = x | y;
      end
      default: begin
        result = 16'h0000;
      end
    endcase
  end
endmodule
