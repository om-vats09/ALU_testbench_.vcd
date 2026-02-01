module alu(
  input [7:0] a,
  input [7:0] b,
  input [2:0] select,
  output reg [7:0] out,
  output reg zero,
  output reg carry
);
  
  reg [8:0] temp_res;
  
  always @(*) begin
    
    carry = 1'b0;
    temp_res = 9'b0;
    out = 8'b0;

    case(select)
      3'b000: begin 
                temp_res = a + b;
                out = temp_res[7:0];
                carry = temp_res[8]; 
              end       
      3'b001: out = (a - b);       
      3'b010: out = a & b;       
      3'b011: out = a | b;       
      3'b100: out = a ^ b;       
      3'b101: out = ~(a | b);    
      3'b110: out = (a << 1);    
      3'b111: out = (a > b) ? 8'd1 : 8'd0;
      default: out = 8'b0;
    endcase 

    if (out == 8'b0) begin
      zero = 1'b1;
    end 
    else begin
      zero = 1'b0;
    end

  end 
  
endmodule
      
      
  
  