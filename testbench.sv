// Code your testbench here
// or browse Examples
`timescale 1ns/1ps 

module testy;
  
  reg [7:0]a;
  reg [7:0]b;
  reg [2:0]select;
  wire [7:0]out;
 
 wire zero;
  wire carry;
  

  
  
  alu uut (.a(a), 
           .b(b), 
           .select(select), 
           .out(out), 
           .zero(zero), 
           .carry(carry));
  
  
  initial 
    begin
  
  $dumpfile("testy.vcd");  //to use to check every changes occuring in the testbench 
      $dumpvars(0,testy);
  
   a = 8'd8; b = 8'd5; select = 3'b000; 
        #10; // Wait 10 time units
        
        // Test Case 2: Subtraction (10 - 10) -> Check Zero Flag
        a = 8'd10; b = 8'd10; select = 3'b001;
        #10;
        
        // Test Case 3: Bitwise AND
        a = 8'b10101010; b = 8'b11110000; select= 3'b010;
        #10;
      
         //Bitwise or 
        a = 8'b10101010; b=8'b11110101; select= 3'b011;
      #10;
      
      // Bitwise XOR
      a= 8'b01010110; b=8'b01011100; select= 3'b100;
      #10;
      
      //bitwise XNOR
       a = 8'b10101010; b = 8'b11110000; select= 3'b101;
      #10;
      
      // left shift 
        a = 8'b10101010; b=8'b11110101; select= 3'b110;
      #10;
      
           $display("\nTestbench finished.");
        $finish;
    end

endmodule 

  
  