// Original work:
// Copyright (c) 2024 Uri Shaked
// SPDX-License-Identifier: Apache-2.0
// 
// Modified work (C)2026 Scott Huynh
// Wrapping Project F - Ad Astra for TTSKY26a tapeout

`default_nettype none

module tt_um_scottshuynh_ad_astra(
  input  wire [7:0] ui_in,    // Dedicated inputs
  output wire [7:0] uo_out,   // Dedicated outputs
  input  wire [7:0] uio_in,   // IOs: Input path
  output wire [7:0] uio_out,  // IOs: Output path
  output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
  input  wire       ena,      // always 1 when the design is powered, so you can ignore it
  input  wire       clk,      // clock
  input  wire       rst_n     // reset_n - low to reset
);

  // VGA signals
  wire hsync;
  wire vsync;
  wire [3:0] R;
  wire [3:0] G;
  wire [3:0] B;
  wire video_active;
  wire [9:0] pix_x;
  wire [9:0] pix_y;

  // TinyVGA PMOD
  assign uo_out = {hsync, B[1], G[2], R[2], vsync, B[2], G[3], R[3]};

  // Unused outputs assigned to 0.
  assign uio_out = 0;
  assign uio_oe  = 0;

  // Suppress unused signals warning
  wire _unused_ok = &{ena, ui_in, uio_in};

  top_greet  top_greet_inst (
    .clk_25m(clk),
    .rst_n(rst_n),
    .vga_hsync(hsync),
    .vga_vsync(vsync),
    .vga_r(R),
    .vga_g(G),
    .vga_b(B)
  );
  
endmodule
