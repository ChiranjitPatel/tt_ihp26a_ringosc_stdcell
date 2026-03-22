/*
 * Copyright (c) 2024 Chiranjit Patel
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module tt_um_ihp26a_ring_osc (
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
  ring_osc #(.DEPTH(250)) ring_501 (.ena(ena), .osc_out(uo_out[2]));
  // // Ring of 1001 inverters, output on uo_out[3] ~ 14MHz?
  ring_osc #(.DEPTH(500)) ring_1001 (.ena(ena), .osc_out(uo_out[3]));

  reg [3:0] c1;
  reg [3:0] c2;

  // a simple clock 16 divider on ring_125:
  wire c1clock = uo_out[1]; // ~112MHz?
  always @(posedge c1clock or negedge rst_n) begin
    if (!rst_n)
        c1 <= 4'd0;
    else
        c1 <= c1 + 1;
  end
  assign uo_out[4] = c1[3]; // less than 5MHz?
  
  // Likewise, a simple clock divider on ring_1001:
  wire c2clock = uo_out[3];   
  always @(posedge c2clock or negedge rst_n) begin
      if (!rst_n)
          c2 <= 4'd0;
      else
          c2 <= c2 + 1;
  end
  assign uo_out[5] = c2[3]; // less than 1MHz?

// modules for LT RO and XOR entropy
LT_RO_entropy dut (
        .RO_XOR_sel   (uio_in[0]),
        .clk          (clk),
        .rst_n        (rst_n),
        .ena          (ena),
        .ro_out_final (uio_out[3:0]),
        .entropy_out  (uio_out[4])
    );
	
	
// List all unused inputs to prevent warnings
  wire _unused = &{ui_in[7:6], uio_in[7:1], clk, 1'b0};
  
  // assign uio_oe = 8'b1100_0011;
  assign uo_out[7:6] = 0;
  assign uio_out[7:5] = 0;
  assign uio_oe = 0;


endmodule
