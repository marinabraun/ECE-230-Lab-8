/* design of a Multiplexer using always@ procedual block
   mutiplesers ports: 
		one output data line 
		n select input lines
		2**n inputs 
	it rounts one of the inputs to the output dependong on the value of the slect inputs */
	
	module Mux_4to1( 	
				input	din,			// input data
				input 	sel1, sel0,		// two select inputs
				output  reg [3:0] dout	// four outputs with dout[0] is the LSb
				);
					
		always@ (din, sel1,sel0)	// include all inputs in the senesitivity list
			begin 
				case ({sel1,sel0})	  // concatinate sel1 with sel0 to make a 2 bit vector
					2'b00:	dout[0]=din;	// choice 00 routing din to the LSb output
					2'b01:	dout[1]=din;	// choice 01 routing din to the 1st output
					2'b10:	dout[2]=din;	// choice 01 routing din to the 2nd output
					2'b11:	dout[3]=din;	// choice 01 routing din to the MSb output
				 // default	dout = 1'b0;	This must be added if not all choices were defined
				endcase
			end
endmodule	