module LT_ring_osc_array (
	input wire ena,
	output wire [3:0] ro_out
);
// 127, 251, 521, 613, 757, 809, 1009
LT_ring_osc #(.DEPTH(63)) ring_array_1 (.ena(ena), .osc_out(ro_out[0]));
LT_ring_osc #(.DEPTH(125)) ring_array_2 (.ena(ena), .osc_out(ro_out[1]));
LT_ring_osc #(.DEPTH(260)) ring_array_3 (.ena(ena), .osc_out(ro_out[2]));
LT_ring_osc #(.DEPTH(378)) ring_array_4 (.ena(ena), .osc_out(ro_out[3]));

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