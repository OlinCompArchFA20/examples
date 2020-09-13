module NAND2(
	input A, B,	
	output Q
	);

	wire Qint;

	and(Qint, A, B);
	not(Q, Qint);
endmodule


module INV1(
	input Y,
	output Yinv
	);

	not(Yinv, Y);
endmodule


module AND2(
	input A, B,
	output Q
	);

	wire Qint;

	NAND2 #5 nandgate0(.Q(Qint), .A(A), .B(B));
	INV1  #5 inverter0(.Yinv(Q), .Y(Qint));
endmodule
