/*
 * Copyright (c) 2024 Your Name
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module tt_um_ritish_behera_digitalClock (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // always 1 when the design is powered, so you can ignore it
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);


    digitalClock inst(
        
        .clk        (clk),
        .reset      (rst_n),
        .en         (ui_in[0]),
        
        .dp         (uo_out[7]),
        .seg        (uo_out[6:0]),
        .dispEn     (uio_out[7:0])
        
    );



    
  // All output pins must be assigned. If not used, assign to 0.
  assign uio_oe  = 1;

  // List all unused inputs to prevent warnings
  wire _unused = &{ena, 1'b0};

endmodule
