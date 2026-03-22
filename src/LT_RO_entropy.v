// `include "sg13g2_cells_sim.v"

// Top-level module – decides whether to output raw RO bits or the entropy bit
module LT_RO_entropy (
    input  wire         RO_XOR_sel,     // 0 = output raw RO bits, 1 = output XOR/entropy
    input  wire         clk,            // sampling clock for entropy sampler
    input  wire         rst_n,
    input  wire         ena,            // ring oscillator enable
    output wire [3:0]   ro_out_final,   // either raw ROs or constant 0 (depending on mode)
    output wire         entropy_out
);

    wire [3:0] ro_raw;          // direct outputs from the four ring oscillators

    // Instantiate the ring oscillator array
    LT_ring_osc_array ro_array (
        .ena     (ena),
        .ro_out  (ro_raw)
    );

    // Entropy sampler (XOR reduction + optional LFSR sim mode)
    wire entropy_bit;
    sampler_xor #(
        .N (4)
    ) entropy_sampler (
        .clk        (clk),
        .rst_n      (rst_n),
        .ro_in      (ro_raw),
        .entropy_bit(entropy_bit)
    );

    assign ro_out_final = RO_XOR_sel ? 4'b0000 : ro_raw;
    assign entropy_out  = RO_XOR_sel ? entropy_bit : 1'b0;

endmodule


	