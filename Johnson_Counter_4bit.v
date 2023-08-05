module Johnson_Counter_4bit(clk, reset, Q);

 input clk; 
 input reset; 

 output [3:0] Q; 
 

 D_Flip_Flop DFF_0(.D(~Q[3]), .reset(reset), .clk(clk), .Q(Q[0])); 
 D_Flip_Flop DFF_1(.D(Q[0]), .reset(reset), .clk(clk), .Q(Q[1]));
 D_Flip_Flop DFF_2(.D(Q[1]), .reset(reset), .clk(clk), .Q(Q[2]));
 D_Flip_Flop DFF_3(.D(Q[2]), .reset(reset), .clk(clk), .Q(Q[3]));
 
endmodule
