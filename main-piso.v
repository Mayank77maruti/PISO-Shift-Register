module d_flip_flop(d, clk, rst, q);
  input d, clk, rst;
  output reg q;

  always @(posedge clk) begin
    if (rst)
      q <= 1'b0;
    else
      q <= d;
  end
endmodule

module piso_p1(din, clk, rst, load, dout);
  input [3:0] din;
  input clk, rst, load;
  output dout;

  wire q0, q1, q2, q3;
  reg d0, d1, d2, d3;

  d_flip_flop DFF0(d0, clk, rst, q0);
  d_flip_flop DFF1(d1, clk, rst, q1);
  d_flip_flop DFF2(d2, clk, rst, q2);
  d_flip_flop DFF3(d3, clk, rst, q3);

  assign dout = q3;

  always @(*) begin
    if (load) begin
      d0 = din[0];
      d1 = din[1];
      d2 = din[2];
      d3 = din[3];
    end else begin
      d0 = 1'b0;
      d1 = q0;
      d2 = q1;
      d3 = q2;
    end
  end
endmodule
