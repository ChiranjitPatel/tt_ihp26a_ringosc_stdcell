// /*
 // * Copyright (c) 2024 Your Name
 // * SPDX-License-Identifier: Apache-2.0
 // */

// `default_nettype none

// module tt_um_example (
    // input  wire [7:0] ui_in,    // Dedicated inputs
    // output wire [7:0] uo_out,   // Dedicated outputs
    // input  wire [7:0] uio_in,   // IOs: Input path
    // output wire [7:0] uio_out,  // IOs: Output path
    // output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    // input  wire       ena,      // always 1 when the design is powered, so you can ignore it
    // input  wire       clk,      // clock
    // input  wire       rst_n     // reset_n - low to reset
// );

  // // All output pins must be assigned. If not used, assign to 0.
  // assign uo_out  = ui_in + uio_in;  // Example: ou_out is the sum of ui_in and uio_in
  // assign uio_out = 0;
  // assign uio_oe  = 0;

  // // List all unused inputs to prevent warnings
  // wire _unused = &{ena, clk, rst_n, 1'b0};

// endmodule


/*
 * Copyright (c) 2024 Anton Maurovic
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module tt_um_algofoogle_tt09_ring_osc2 (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // always 1 when the design is powered, so you can ignore it
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);


  // Ring of 3 inverters, output on uo_out[0] ~ xMHz, if it makes it out?
  ring_osc #(.DEPTH(1)) ring_3 (.ena(ena), .osc_out(uo_out[0]));
  // // Ring of 125 inverters, output on uo_out[1] ~ 112MHz?
  ring_osc #(.DEPTH(62)) ring_125 (.ena(ena), .osc_out(uo_out[1]));
  // // Ring of 501 inverters, output on uo_out[2] ~ 28MHz?
  // ring_osc #(.DEPTH(250)) ring_501 (.ena(ena), .osc_out(uo_out[2]));
  // // Ring of 1001 inverters, output on uo_out[3] ~ 14MHz?
  // ring_osc #(.DEPTH(500)) ring_1001 (.ena(ena), .osc_out(uo_out[3]));

 
  // Likewise, a simple clock divider on ring_125:
  wire c1clock = uo_out[0]; // ~112MHz?
  reg [3:0] c1;
  always @(posedge c1clock) c1 <= c1 + 1;
  assign uo_out[2] = c1[3]; // ~14MHz? Probably won't be exactly the same as uo_out[3].


  // List all unused inputs to prevent warnings
  wire dummy = &{ui_in, uio_in, ena, rst_n};
  assign uio_out[0] = dummy;
  wire _unused = &{clk, 1'b0};

  assign uio_oe = 8'b1100_0011;
  assign uo_out[7:3] = 0;
  assign uio_out[7:1] = 0;


endmodule
// Sevachirpass@1