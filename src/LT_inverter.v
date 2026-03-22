module LT_inverter (
    input   wire a,
    output  wire y
);

    (* keep_hierarchy *) sg13g2_inv_1    ihp_inverter (
        .A  (a),
        .Y  (y)
    );

endmodule