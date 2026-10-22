/* design of a demultiplexer using always@ procedual block
   Demultiplexer ports
		one input data line
		n select inputs
		2**n output lines 
	it rounts the input to one of the outputs depaendong on the value on the slect inputs */

module Demux_4to1( 	
				input	[3:0] din,	// four input data lines with din[0] is the lsb
				input 	sel1, sel0,	// two select inputs
				output  reg dout	// one data output line					
				);
					
		always@ (din, sel1,sel0)	// include all inputs in the senesitivity list
			begin
			    
				case ({sel1,sel0})	  // concatinate sel1 with sel0 to make a 2 bit vector
					2'b00:	dout=din[0];	// choice 00 routing din to the LSb output
					2'b01:	dout=din[1];	// choice 01 routing din to the 1st output
					2'b10:	dout=din[2];	// choice 01 routing din to the 2nd output
					2'b11:	dout=din[3];	// choice 01 routing din to the MSb output
				// default	dout = 1'b0; add this if not all the choices are covered to clear all outputs
				endcase
			end
endmodule			
					