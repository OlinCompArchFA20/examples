// Do an XOR via logic

// Remember your semicolons!!

// Use macros to define gates with delays
`define AND and #10
`define OR or #10
`define NOT not #5

// Module Declaration
module logicXor
	(
	 output lxor,
	 input a,
	 input b
	 );

	 // Logic is A*(~B) + B*(~A)
	 // Need two one-bit intermediate wires for and outputs
	 // Need two intermediate wires for not outputs
	 wire  notA, notB;
	 wire  AnotB, BnotA;

	 // Do the NOTs
	 `NOT nota(notA, a);
	 `NOT notb(notB, b);

	 // Do the ANDs directly connecting the inputs
	 `AND anotb(AnotB,a,notB);
	 `AND bnota(BnotA,notA,b);
	 // Do final OR, connect directly to output
	 `OR lXor(lxor, AnotB, BnotA);
endmodule // logicXor
