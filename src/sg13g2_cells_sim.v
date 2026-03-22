// sg13g2_cells_sim.v — behavioral stand-in for simulation only
// (do NOT use this for synthesis / tapeout!)

`default_nettype none
`timescale 1ns / 1ps

// Minimal model — just delay + logic
module sg13g2_inv_1 (
    input  wire A,
    output wire Y
);
    assign #0.15 Y = ~A;     // ~150 ps delay — tune to roughly match expected freq
endmodule

// If you use other cells later, add stubs like:
module sg13g2_buf_1 (  // example
    input  wire A,
    output wire Y
);
    assign #0.25 Y = A;
endmodule

// … add more as needed (nand, nor, etc.)