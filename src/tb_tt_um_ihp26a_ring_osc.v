`default_nettype none
`timescale 1ns / 1ps

`include "sg13g2_cells_sim.v"

module tb_tt_um_ihp26a_ring_osc;

    // ───────────────────────────────────────────────
    // Parameters
    // ───────────────────────────────────────────────
    parameter real CLK_PERIOD   = 20.0;     // 50 MHz system clock
    parameter real SIM_DURATION = 12000.0;  // ns — enough to see slow rings
    parameter real WARMUP_TIME  = 800.0;    // ns — let rings start oscillating cleanly

    // ───────────────────────────────────────────────
    // Testbench signals
    // ───────────────────────────────────────────────
    reg        clk;
    reg        rst_n;
    reg        ena;
    reg [7:0]  ui_in;
    reg [7:0]  uio_in;

    wire [7:0] uo_out;
    wire [7:0] uio_out;
    wire [7:0] uio_oe;

    // ───────────────────────────────────────────────
    // DUT instantiation
    // ───────────────────────────────────────────────
    tt_um_ihp26a_ring_osc dut (
        .ui_in   (ui_in),
        .uo_out  (uo_out),
        .uio_in  (uio_in),
        .uio_out (uio_out),
        .uio_oe  (uio_oe),
        .ena     (ena),
        .clk     (clk),
        .rst_n   (rst_n)
    );

    // ───────────────────────────────────────────────
    // Clock generation (external 50 MHz example)
    // ───────────────────────────────────────────────
    initial clk = 0;
    always #(CLK_PERIOD/2) clk = ~clk;

    // ───────────────────────────────────────────────
    // Stimulus / reset / enable sequence
    // ───────────────────────────────────────────────
    initial begin
        $dumpfile("ring_osc_tb.vcd");
        $dumpvars(0, tb_tt_um_ihp26a_ring_osc);
        // $dumpvars(1, dut.ring_3);     // uncomment for fast ring internals
        // $dumpvars(1, dut.ring_125);   // uncomment for medium ring internals

        // Initial state
        rst_n   = 0;
        ena     = 0;
        ui_in   = 8'h00;
        uio_in  = 8'h00;

        // Wait a few clocks → release reset
        repeat (8) @(posedge clk);
        rst_n = 1;

        // Wait a bit more → enable rings
        repeat (10) @(posedge clk);
        ena = 1;
        $display("=== Rings ENABLED at %t ns ===", $time);

        // Let everything run
        #SIM_DURATION;

        $display("=== Simulation finished at %t ns ===", $time);
        // $finish;
    end

    // ───────────────────────────────────────────────
    // Output monitor (human-readable)
    // ───────────────────────────────────────────────
    initial begin
        $monitor("t=%6.0f ns | ena=%b rst_n=%b | uo_out = %b_%b_%b_%b_%b_%b  (div16 slow · div16 fast · 1001 · 501 · 125 · 3)",
                 $time, ena, rst_n,
                 uo_out[5], uo_out[4],
                 uo_out[3], uo_out[2], uo_out[1], uo_out[0]);
    end

    // ───────────────────────────────────────────────
    // Period / frequency measurement (only after warmup)
    // ───────────────────────────────────────────────
    real t_rise[5:0];
    real period_ns[5:0];
    integer count[5:0];

    genvar i;
    generate
        for (i = 0; i < 6; i = i + 1) begin : freq_mon
            initial begin
                t_rise[i]  = -1.0;
                period_ns[i] = 0.0;
                count[i]   = 0;
            end

            always @(posedge uo_out[i]) begin
                if ($time >= WARMUP_TIME) begin   // ignore startup junk
                    if (t_rise[i] > 0.0) begin
                        period_ns[i] = $time - t_rise[i];
                        count[i] = count[i] + 1;

                        if (count[i] <= 8 || count[i] % 10 == 0) begin
                            $display("uo_out[%0d]  period = %7.3f ns  ≈ %7.2f MHz   (edge #%3d)  @ %t ns",
                                     i, period_ns[i], 1000.0 / period_ns[i],
                                     count[i], $time);
                        end
                    end
                    t_rise[i] = $time;
                end
            end
        end
    endgenerate

endmodule