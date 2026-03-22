`default_nettype none
`timescale 1ns / 1ps

`include "sg13g2_cells_sim.v"

module tb_LT_RO_entropy;

    // ───────────────────────────────────────────────
    // Parameters
    // ───────────────────────────────────────────────
    parameter real CLK_PERIOD    = 20.0;      // 50 MHz sampling clock
    parameter real SIM_TIME      = 6000.0;    // total sim duration in ns

    // ───────────────────────────────────────────────
    // Testbench signals – all CONTROL signals as reg
    // ───────────────────────────────────────────────
    reg         clk;
    reg         rst_n;
    reg         ena;
    reg         RO_XOR_sel;

    wire [3:0]  ro_out_final;
    wire        entropy_out;

    // ───────────────────────────────────────────────
    // DUT instantiation – named ports (safer, easier to debug)
    // ───────────────────────────────────────────────
    LT_RO_entropy dut (
        .RO_XOR_sel   (RO_XOR_sel),
        .clk          (clk),
        .rst_n        (rst_n),
        .ena          (ena),
        .ro_out_final (ro_out_final),
        .entropy_out  (entropy_out)
    );

    // ───────────────────────────────────────────────
    // Clock generator
    // ───────────────────────────────────────────────
    initial begin
        clk = 0;
        forever #(CLK_PERIOD/2) clk = ~clk;
    end

    // ───────────────────────────────────────────────
    // Main stimulus
    // ───────────────────────────────────────────────
    initial begin
        // Dump waveform – open in GTKWave afterward
        $dumpfile("tb_LT_RO_entropy.vcd");
        $dumpvars(0, tb_LT_RO_entropy);

        // Optional: see internal ring oscillator nodes
        // $dumpvars(1, dut.ro_array.ring_array5_1);
        // $dumpvars(1, dut.ro_array.ring_array5_2);
        // $dumpvars(1, dut.ro_array.ring_array5_3);
        // $dumpvars(1, dut.ro_array.ring_array5_4);

        // ── Initial conditions ────────────────────────────────
        rst_n      = 0;
        ena        = 0;
        RO_XOR_sel = 0;           // start in "observe raw rings" mode

        // Give simulator time to settle
        #200;

        // Release reset
        rst_n = 1;
        #120;

        // Enable ring oscillators
        ena = 1;
        $display("Rings ENABLED  at %6t ns", $time);

        // Observe raw ring outputs for some time
        #1800;
        $display("Switch to ENTROPY/XOR mode  at %6t ns", $time);
        RO_XOR_sel = 1;

        // Run in entropy mode
        #3800;

        $display("Simulation finished at %6t ns", $time);
        // $finish;
    end

    // ───────────────────────────────────────────────
    // Simple monitor – helps during initial debug
    // ───────────────────────────────────────────────
    initial begin
        $monitor("t=%6t | sel=%b  ena=%b  rst=%b | ro_final=%b  entropy=%b",
                 $time, RO_XOR_sel, ena, rst_n,
                 ro_out_final, entropy_out);
    end

    // ───────────────────────────────────────────────
    // Optional: count transitions on entropy_out
    // (useful to confirm it's actually toggling)
    // ───────────────────────────────────────────────
    integer entropy_rise_cnt = 0;
    integer entropy_fall_cnt = 0;

    always @(posedge entropy_out) begin
        if (RO_XOR_sel && $time > 1000) begin
            entropy_rise_cnt = entropy_rise_cnt + 1;
            if (entropy_rise_cnt <= 20 || entropy_rise_cnt % 50 == 0) begin
                $display("entropy_out ↑  #%3d   @ %6t ns", entropy_rise_cnt, $time);
            end
        end
    end

    always @(negedge entropy_out) begin
        if (RO_XOR_sel && $time > 1000) begin
            entropy_fall_cnt = entropy_fall_cnt + 1;
        end
    end

endmodule