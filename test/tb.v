`default_nettype none
`timescale 1ns / 1ps

/* This testbench just instantiates the module and makes some convenient wires
   that can be driven / tested by the cocotb test.py.
*/
module tb ();

  // Dump the signals to a VCD file. You can view it with gtkwave.
  initial begin
    $dumpfile("tb.vcd");
    $dumpvars(0, tb);
    #1;
  end

  // Wire up the inputs and outputs:
  reg clk;
  reg rst_n;
  reg ena;
  reg [7:0] data_in1;
  reg [7:0] data_in2;
  reg [7:0] data_in3;
  reg [7:0] data_in4;
  reg [7:0] data_in5;
   
  wire [7:0] data_out1;
  wire [7:0] data_out2;
  wire [7:0] data_out3;
  wire [7:0] data_out4;
  wire [7:0] data_out5;

  // Replace tt_um_example with your module name:
  tt_um_systolic_array user_project (

      // Include power ports for the Gate Level test:
`ifdef GL_TEST
      .VPWR(1'b1),
      .VGND(1'b0),
`endif

      .data_in1  (data_in1),    // Dedicated inputs
     .data_in2  (data_in2),    // Dedicated inputs
     .data_in3  (data_in3),    // Dedicated inputs
     .data_in4  (data_in4),    // Dedicated inputs
     .data_in5  (data_in5),    // Dedicated inputs
      .data_out1 (data_out1),   // Dedicated outputs
     .data_out2 (data_out2),   // Dedicated outputs
     .data_out3 (data_out3),   // Dedicated outputs
     .data_out4 (data_out4),   // Dedicated outputs
     .data_out5 (data_out5),   // Dedicated outputs
     .rst_n   (rst_n),      // enable - goes high when design is selected
     .ena      (ena)
      .clk    (clk),      // clock
  );

endmodule
