module testbench;
    
    import jc_pkg::*;


    bit clk, reset;
    bit [3:0] out;
    bit [3:0] Q;
    

    JohnsonCounter jc= new(clk,reset);
    Johnson_Counter_4bit dut(clk, reset, Q);
    
   
    initial begin
        $display("\nSystem Verilog - 4-BIT Johnson Counter\n");
        clk = 1'b0;
        reset = 1'b1;
        #8 reset = 1'b0  ;
       
    end

 
    always @(posedge clk, posedge reset)
    begin
        jc.performLogic(reset);
        out= jc.q;
        #3 $display("Expected Johnson Counter Output: %b %b %b %b, Actual Johnson Counter Output: %b %b %b %b",out[0],out[1],out[2],out[3],Q[0],Q[1],Q[2],Q[3]);
    end


    initial begin
        // Test case 1: Basic functionality test with no reset
        #48; 
        $display("\nTest case 1 - Basic functionality with no reset:");
        #48; 
        
        // Test case 2: Test with reset
        #2; $display("\nTest case 2 - Counter with reset:");
        #24 $display("\nAsserting the reset");
        reset = 1'b1;  
        #48; 
        #2 $display("\nDe-asserting the reset");
        reset = 1'b0; 
        #48;
  
        // Test case 3: Test with unoccured Combination
        #2 $display("\nTest case 3: Test with unoccurred combination (1010)");
        out = 4'b1010; 
        Q = 4'b1010; 

    end  
    always #5 clk=~clk;
endmodule
