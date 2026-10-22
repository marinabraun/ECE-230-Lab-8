module top(
  input [15:0] sw,      // 16 switches
  input btnU, btnL,     // mux select
  input btnR, btnD,     // demux select
  input btnC,           // enable
  output [15:0] led     // 16 LEDs
);
  
  wire [3:0] line;      // the town's single 4-bit cable
  
  mux_4to1 inst_mux (
        .A(sw[3:0]),          // CEO
        .B(sw[7:4]),          // You
        .C(sw[11:8]),         // Fred
        .D(sw[15:12]),        // Jill
        .sel({btnU, btnL}),   // 2 buttons --> 2-bit select
        .enable(btnC),
        .Y(line)              // mux output goes onto the cable
    );
  
  demux_1to4 inst_demux (
    .din(line),             // the cable from the mux
    .sel({btnR, btnD}),     // 2 buttons → 2-bit select
    .enable(btnC),
    .local_lib(led[3:0]),   // Library
    .fire(led[7:4]),        // Fire dept
    .school(led[11:8]),     // School
    .rib(led[15:12])        // Rib shack
);

endmodule
