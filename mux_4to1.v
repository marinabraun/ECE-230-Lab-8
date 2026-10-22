module mux_4to1( 	
	input [3:0] A,      // CEO   (sel 00)
	input [3:0] B,      // You   (sel 01)
	input [3:0] C,      // Fred  (sel 10)
    input [3:0] D,      // Jill  (sel 11)
    input [1:0] sel,    // which sender
    input enable,       // master on/off
    output [3:0] Y      // the 4-bit line
);

	// X ? P : Q ---> "if X is true, use P, otherwise use Q"
	assign Y = enable ? ( (sel == 2'b00) ? A :
                          (sel == 2'b01) ? B :
                          (sel == 2'b10) ? C :
                                           D )
                      	: 4'b0000;
endmodule	
