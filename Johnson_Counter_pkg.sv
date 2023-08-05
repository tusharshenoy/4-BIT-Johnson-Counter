package jc_pkg;

class JohnsonCounter;
   
    bit [3:0] q;      
    bit clk;          
    bit reset;         


    function new(bit clk1, bit reset1);
        clk = clk1;   
        reset = reset1; 
    endfunction

    
    function void performLogic(reset);
        if (reset)       
            q = 4'b0000; 
        else begin
           q = {q[2:0],~q[3]}; 
        end
    endfunction
endclass

endpackage
