//Design the registers R0 to R15, PC, IR, Y, Z, MAR, HI, and LO
//Use the following template for each register
//The registers are 32 bits wide

module REG_32(
    input clk,
    input clear,
    input enable,
    input wire [31:0] D,
    output reg[31:0] Q
);
    always @(posedge clear) begin
		if (clear == 0) begin 
			Q<=0;
		end
	end
	
		always@(posedge clk)
		begin
			Q<=D;
	 end
endmodule


