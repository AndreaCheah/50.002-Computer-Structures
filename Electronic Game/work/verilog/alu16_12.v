/*
   This file was generated automatically by Alchitry Labs version 1.2.7.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module alu16_12 (
    input clk,
    input rst,
    input [5:0] alufn,
    input [15:0] x,
    input [15:0] y,
    output reg [15:0] out,
    output reg z,
    output reg v,
    output reg n,
    output reg err
  );
  
  
  
  wire [16-1:0] M_addormul16_s;
  wire [1-1:0] M_addormul16_cout;
  wire [1-1:0] M_addormul16_z;
  wire [1-1:0] M_addormul16_v;
  wire [1-1:0] M_addormul16_n;
  wire [1-1:0] M_addormul16_err;
  adder16_16 addormul16 (
    .clk(clk),
    .rst(rst),
    .x(x),
    .y(y),
    .alufn(alufn),
    .s(M_addormul16_s),
    .cout(M_addormul16_cout),
    .z(M_addormul16_z),
    .v(M_addormul16_v),
    .n(M_addormul16_n),
    .err(M_addormul16_err)
  );
  
  wire [16-1:0] M_boolean16_result;
  boolean16_17 boolean16 (
    .x(x),
    .y(y),
    .alufn(alufn),
    .result(M_boolean16_result)
  );
  
  wire [16-1:0] M_shifter16_result;
  shifter16_18 shifter16 (
    .x(x),
    .y(y),
    .alufn(alufn),
    .result(M_shifter16_result)
  );
  
  wire [16-1:0] M_comparator16_result;
  comparator16_19 comparator16 (
    .x(x),
    .y(y),
    .alufn(alufn),
    .result(M_comparator16_result)
  );
  
  always @* begin
    z = 1'h0;
    v = 1'h0;
    n = 1'h0;
    err = 1'h0;
    
    case (alufn[4+1-:2])
      2'h0: begin
        out = M_addormul16_s;
        z = M_addormul16_z;
        v = M_addormul16_v;
        n = M_addormul16_n;
        err = M_addormul16_err;
      end
      2'h1: begin
        out = M_boolean16_result;
      end
      2'h2: begin
        out = M_shifter16_result;
      end
      2'h3: begin
        out = M_comparator16_result;
      end
      default: begin
        out = 16'h0000;
      end
    endcase
  end
endmodule