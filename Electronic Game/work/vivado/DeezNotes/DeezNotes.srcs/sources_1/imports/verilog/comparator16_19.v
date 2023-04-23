/*
   This file was generated automatically by Alchitry Labs version 1.2.7.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module comparator16_19 (
    input [15:0] x,
    input [15:0] y,
    input [5:0] alufn,
    output reg [15:0] result
  );
  
  
  
  always @* begin
    result[1+14-:15] = 15'h0000;
    
    case (alufn[3+0-:1])
      1'h0: begin
        
        case (alufn[1+1-:2])
          2'h0: begin
            result[0+0-:1] = 1'h0;
          end
          2'h1: begin
            result[0+0-:1] = (x == y);
          end
          2'h2: begin
            result[0+0-:1] = (x < y);
          end
          2'h3: begin
            result[0+0-:1] = (x <= y);
          end
          default: begin
            result[0+0-:1] = 1'h0;
          end
        endcase
      end
    endcase
  end
endmodule
