// fancier testbench for the logic XOR
`timescale 1 ns / 1 ps
// `include "lxor.v"

// Macro to handle equality checks
// Throws an error whenever an issue happens
// Otherwise, silent
// Useful when there's a lot of tests, but you don't want too much output
// i.e. when there's no output, everything is good.
`define ASSERT_EQ(val, exp, msg) \
  if (val !== exp) $display("[FAIL] %s (got:b%b expected:b%b)", msg, val, exp);

module testFancyLogicXOR();
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
	    A=0;B=0; #50
	    `ASSERT_EQ(lxor,A^B,"A=0,B=0");
	    A=0;B=1; #50
	    `ASSERT_EQ(lxor,A^B,"A=0,B=1");
	    A=1;B=0; #50
	    `ASSERT_EQ(lxor,A^B,"A=1,B=0");
	    A=1;B=1; #50
	    `ASSERT_EQ(lxor,A^B,"A=1,B=1");
	    $display("All tests done.");   // All tests passed when you only see this message
	 end // initial begin
endmodule // testFancyLogicXOR
