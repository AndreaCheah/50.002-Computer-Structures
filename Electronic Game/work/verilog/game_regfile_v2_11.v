/*
   This file was generated automatically by Alchitry Labs version 1.2.7.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module game_regfile_v2_11 (
    input clk,
    input rst,
    input [3:0] write_address,
    input we,
    input [15:0] data,
    input [3:0] read_address_a,
    input [3:0] read_address_b,
    output reg [15:0] out_a,
    output reg [15:0] out_b
  );
  
  
  
  reg [15:0] M_button_input_d, M_button_input_q = 1'h0;
  reg [15:0] M_level_input_d, M_level_input_q = 1'h0;
  reg [15:0] M_score_d, M_score_q = 1'h0;
  reg [15:0] M_temp1_d, M_temp1_q = 1'h0;
  
  always @* begin
    M_level_input_d = M_level_input_q;
    M_score_d = M_score_q;
    M_button_input_d = M_button_input_q;
    M_temp1_d = M_temp1_q;
    
    if (we) begin
      
      case (write_address)
        4'h0: begin
          M_button_input_d = data;
        end
        4'h1: begin
          M_level_input_d = data;
        end
        4'h2: begin
          M_score_d = data;
        end
        4'hf: begin
          M_temp1_d = data;
        end
      endcase
    end
    
    case (read_address_a)
      4'h0: begin
        out_a = M_button_input_q;
      end
      4'h1: begin
        out_a = M_level_input_q;
      end
      4'h2: begin
        out_a = M_score_q;
      end
      4'hf: begin
        out_a = M_temp1_q;
      end
      default: begin
        out_a = 1'h0;
      end
    endcase
    
    case (read_address_b)
      4'h0: begin
        out_b = M_button_input_q;
      end
      4'h1: begin
        out_b = M_level_input_q;
      end
      4'h2: begin
        out_b = M_score_q;
      end
      4'hf: begin
        out_b = M_temp1_q;
      end
      default: begin
        out_b = 1'h0;
      end
    endcase
  end
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_button_input_q <= 1'h0;
      M_level_input_q <= 1'h0;
      M_score_q <= 1'h0;
      M_temp1_q <= 1'h0;
    end else begin
      M_button_input_q <= M_button_input_d;
      M_level_input_q <= M_level_input_d;
      M_score_q <= M_score_d;
      M_temp1_q <= M_temp1_d;
    end
  end
  
endmodule