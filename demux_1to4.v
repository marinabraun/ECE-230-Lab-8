module demux_1to4( 	
    input [3:0] din,       // the 4-bit line from the mux
    input [1:0] sel,       // which receiver
    input enable,          // master on/off
    output [3:0] local_lib,    // Library   (sel 00)
    output [3:0] fire,         // Fire dept (sel 01)
    output [3:0] school,       // School    (sel 10)
    output [3:0] rib           // Rib shack (sel 11)					
);
	assign local_lib = (enable && sel == 2'b00) ? din : 4'b0000;
	assign fire = (enable && sel == 2'b01) ? din : 4'b0000;
	assign school = (enable && sel == 2'b10) ? din : 4'b0000;
	assign rib = (enable && sel == 2'b11) ? din : 4'b0000;

endmodule			
					
