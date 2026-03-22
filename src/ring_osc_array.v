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

///////////////////////////////////////////////////////////////////////////////////

module LT_ring_osc_array (
	input wire ena,
	output wire [3:0] ro_out
);
LT_ring_osc #(.DEPTH(2)) ring_array5_1 (.ena(ena), .osc_out(ro_out[0]));
LT_ring_osc #(.DEPTH(2)) ring_array5_2 (.ena(ena), .osc_out(ro_out[1]));
LT_ring_osc #(.DEPTH(2)) ring_array5_3 (.ena(ena), .osc_out(ro_out[2]));
LT_ring_osc #(.DEPTH(2)) ring_array5_4 (.ena(ena), .osc_out(ro_out[3]));
// LT_ring_osc #(.DEPTH(2)) ring_array5_5 (.ena(ena), .osc_out(ro_out[4]));
endmodule

module LT_ring_osc #(
    parameter DEPTH = 500 // Becomes DEPTH*2+1 inverters to ensure it is odd.
) (
    input wire ena,
    output wire osc_out
);

    wire [DEPTH*2:0] inv_in;
    wire [DEPTH*2:0] inv_out;
    assign inv_in[DEPTH*2:1] = inv_out[DEPTH*2-1:0]; // Chain.
    assign inv_in[0] = inv_out[DEPTH*2] & ena; // Loop back.
    // Generate an instance array of inverters, chained and looped back via the 2 assignments above:
    (* keep_hierarchy *) LT_inverter inv_array [DEPTH*2:0] ( .a(inv_in), .y(inv_out) );
    assign osc_out = inv_in[0];

endmodule

///////////////////////////////////////////////////////////////////////////////////

module LT_inverter (
    input   wire a,
    output  wire y
);

    (* keep_hierarchy *) sg13g2_inv_1    ihp_inverter (
        .A  (a),
        .Y  (y)
    );

endmodule

///////////////////////////////////////////////////////////////////////////////////

module sampler_xor #(
    parameter N = 4
)(
    input wire clk,          // Sampling clock
    input wire rst_n,
    input wire [N-1:0] ro_in,
    output reg entropy_bit
);
    // === TOGGLE THIS FLAG FOR SIMULATION VS HARDWARE ===
    localparam USE_FAKE_ENTROPY = 0; // <-- Set to 1 for sim, 0 for real hardware

    // 16-bit LFSR for simulation
    reg [15:0] lfsr;
    wire lfsr_next = lfsr[15] ^ lfsr[13] ^ lfsr[12] ^ lfsr[10]; // x^16 + x^14 + x^13 + x^11 + 1

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            lfsr <= 16'hACE1; // Nonzero seed
            entropy_bit <= 0;
        end else if (USE_FAKE_ENTROPY) begin
            lfsr <= {lfsr[14:0], lfsr_next};
            entropy_bit <= lfsr[0];
        end else begin
            entropy_bit <= ^ro_in; // XOR all RO outputs
        end
    end
endmodule
///////////////////////////////////////////////////////////////////////////////////


	