// testbench for the logic XOR
`timescale 1 ns / 1 ps // Specifies the value of the base time unit. Arbitrarily chosen.

// Uncomment this next line if you're not using the Makefile
// `include "lxor.v"

module testLogicXOR();
	 // Wire to hold results
	 wire lxor;
	 // Registers to store test inputs
	 reg 	A,B;

	 // Instantiate DUT
	 logicXor lXOR(.lxor(lxor),.a(A),.b(B));

	 initial begin
	    // store traces in a .vcd file to view in GTKwave
	    $dumpfile("lxor-dump.vcd");
	    $dumpvars();

	    // Use assert statements to notify if something went wrong
	    // In conjunction with a bitwise ^ operator
	    // Can also use display operators

	    $display("A B | A^B");             // Prints header for truth table
	    A=0;B=0; #50                       // Set A and B, wait for update (#1)
	    $display("%b %b | %b", A, B, lxor);
	    A=0;B=1; #50
	    $display("%b %b | %b", A, B, lxor);
	    A=1;B=0; #50
	    $display("%b %b | %b", A, B, lxor);
	    A=1;B=1; #50
	    $display("%b %b | %b", A, B, lxor);
	 end // initial begin
endmodule // testLogicXOR
