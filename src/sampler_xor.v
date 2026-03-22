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