/*
   This file was generated automatically by Alchitry Labs version 1.2.7.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module adder16_16 (
    input clk,
    input rst,
    input [15:0] x,
    input [15:0] y,
    input [5:0] alufn,
    output reg [15:0] s,
    output reg cout,
    output reg z,
    output reg v,
    output reg n,
    output reg err
  );
  
  
  
  reg [15:0] result;
  
  wire [16-1:0] M_multiplier16_s;
  wire [1-1:0] M_multiplier16_error;
  multiplier16_22 multiplier16 (
    .x(x),
    .y(y),
    .alufn(alufn),
    .s(M_multiplier16_s),
    .error(M_multiplier16_error)
  );
  
  
  always @* begin
    err = 1'h0;
    
    case (alufn[2+1-:2])
      2'h0: begin
        
        case (alufn[0+0-:1])
          1'h0: begin
            result = x + y;
          end
          1'h1: begin
            result = x - y;
          end
          default: begin
            result = 16'h0000;
          end
        endcase
      end
      2'h1: begin
        result = M_multiplier16_s;
        err = M_multiplier16_error;
      end
      default: begin
        result = 16'h0000;
      end
    endcase
    z = ~(|result);
    v = (x[15+0-:1] & (y[15+0-:1] ^ alufn[0+0-:1]) & ~result[15+0-:1]) | (~x[15+0-:1] & ~(y[15+0-:1] ^ alufn[0+0-:1]) & result[15+0-:1]);
    n = result[15+0-:1];
    s = result;
    cout = (x[15+0-:1] & y[15+0-:1] & ~result[15+0-:1]) | (~x[15+0-:1] & ~y[15+0-:1] & result[15+0-:1]);
  end
endmodule
