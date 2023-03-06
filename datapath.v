module datapath(
    input [31:0]PCout, Zlowout, Zhighout, HIout, LOout, MDRout, Cout, R0out, R1out, R2out, R3out, R4out, R5out, R6out, 
	 R7out, R8out, R9out, R10out, R11out, R12out, R13out, R14out, R15out, BusMuxOut, MARin, Zhigh, Zlow, PCin, MDRin, IRout, 
	 Yout, IncPC, Read, clock, clear, ALUin, ZMuxEnable, ZSelect, ZMuxOut, InPortout, EncoderoutSel, EncoderinQ, BusMuxOutQ, BusMuxinSel,
    input [31:0]Mdatain,
    input [4:0] ALU,
    output wire [31:0] out
);

 
wire [31:0]BusMuxinR0, BusMuxinR1,  BusMuxinR2, BusMuxinR3, BusMuxinR4,  BusMuxinR5,BusMuxinR6, BusMuxinR7,  BusMuxinR8, BusMuxinR9, BusMuxinR10,
BusMuxinR11, BusMuxinR12, BusMuxinR13, BusMuxinR14, BusMuxinR15, BusMuxinZhigh, BusMuxinZlow, BusMuxinPC, BusMuxinIR, BusMuxinMDR, BusMuxinInPort, BusMuxinC,
BusMuxinY, BusMuxinHI, BusMuxinLO, Z;

 
// General Purpose Registers
REG_32 R0 (clock, clear, R0out, BusMuxOut, BusMuxinR0);
REG_32 R1 (clock, clear, R1out, BusMuxOut, BusMuxinR1);
REG_32 R2 (clock, clear, R2out, BusMuxOut, BusMuxinR2);
REG_32 R3 (clock, clear, R3out, BusMuxOut, BusMuxinR3);
REG_32 R4 (clock, clear, R4out, BusMuxOut, BusMuxinR4);
REG_32 R5 (clock, clear, R5out, BusMuxOut, BusMuxinR5);
REG_32 R6 (clock, clear, R6out, BusMuxOut, BusMuxinR6);
REG_32 R7 (clock, clear, R7out, BusMuxOut, BusMuxinR7);
REG_32 R8 (clock, clear, R8out, BusMuxOut, BusMuxinR8);
REG_32 R9 (clock, clear, R9out, BusMuxOut, BusMuxinR9);
REG_32 R10 (clock, clear, R10out, BusMuxOut, BusMuxinR10);
REG_32 R11 (clock, clear, R11out, BusMuxOut, BusMuxinR11);
REG_32 R12 (clock, clear, R12out, BusMuxOut, BusMuxinR12);
REG_32 R13 (clock, clear, R13out, BusMuxOut, BusMuxinR13);
REG_32 R14 (clock, clear, R14out, BusMuxOut, BusMuxinR14);
REG_32 R15 (clock, clear, R15out, BusMuxOut, BusMuxinR15);

// Registers
REG_32 HI 		(clock, clear, HIout, BusMuxOut, BusMuxinHI);
REG_32 LO 		(clock, clear, LOout, BusMuxOut, BusMuxinLO);
REG_32 Z_high 	(clock, clear, Zhighout, BusMuxOut, BusMuxinZhigh);
REG_32 Z_low 	(clock, clear, Zlowout, BusMuxOut, BusMuxinZlow);
REG_32 PC 		(clock, clear, PCout, BusMuxOut, BusMuxinPC);
REG_32 IR 		(clock, clear, IRout, BusMuxOut, BusMuxinIR);
REG_32 Y			(clock, clear, Yout, BusMuxOut, BusMuxinY);


// Devices
MDR mdr(clear, clock, MDRin, BusMuxOut, Mdatain, Read, BusMuxinMDR);
REG_32 inport(clear, clock, InPortout, BusMuxOut, BusMuxinInPort);
REG_32 Csign(clear, clock, Cout, BusMuxOut, BusMuxinC);
ALU alu(Y, BusMuxOut, ALU, Z);

Bus bus(clock, clear, R0out, R1out, R2out, R3out, R4out, R5out, R6out, R7out, R8out, R9out, R10out, R11out, 
    R12out, R13out, R14out, R15out, HIout, LOout, Zhighout, Zlowout, PCout, MDRout, InPortout, Cout,BusMuxinR0, 
	 BusMuxinR1,  BusMuxinR2, BusMuxinR3, BusMuxinR4,  BusMuxinR5,BusMuxinR6, BusMuxinR7,  BusMuxinR8, BusMuxinR9, BusMuxinR10,
	 BusMuxinR11, BusMuxinR12, BusMuxinR13, BusMuxinR14, BusMuxinR15, BusMuxinZhigh, BusMuxinZlow, BusMuxinPC, BusMuxinIR, 
	 BusMuxinMDR, BusMuxinInPort, BusMuxinC,BusMuxinY, BusMuxinHI, BusMuxinLO, EncoderoutSel, EncoderinQ, BusMuxOutQ, BusMuxinSel);

assign out = BusMuxinR0;

endmodule
