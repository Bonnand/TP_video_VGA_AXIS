//Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
//Date        : Fri Nov 21 14:03:43 2025
//Host        : LAPTOP-HJ430IGT running 64-bit major release  (build 9200)
//Command     : generate_target design_1_wrapper.bd
//Design      : design_1_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module design_1_wrapper
   (B,
    G,
    R,
    clk,
    hsync_out_0,
    reset_n,
    vsync_out_0);
  output [3:0]B;
  output [3:0]G;
  output [3:0]R;
  input clk;
  output hsync_out_0;
  input reset_n;
  output vsync_out_0;

  wire [3:0]B;
  wire [3:0]G;
  wire [3:0]R;
  wire clk;
  wire hsync_out_0;
  wire reset_n;
  wire vsync_out_0;

  design_1 design_1_i
       (.B(B),
        .G(G),
        .R(R),
        .clk(clk),
        .hsync_out_0(hsync_out_0),
        .reset_n(reset_n),
        .vsync_out_0(vsync_out_0));
endmodule
