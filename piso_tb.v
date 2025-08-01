module piso_p1_tb();
  reg [3:0] din;
  reg clk, rst, load;
  wire dout;

  piso_p1 uut(din, clk, rst, load, dout);

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10 time units period
  end

  initial begin
    // Initialize signals
    rst = 1;
    load = 0;
    din = 4'b0000;

    // Reset pulse
    #10 rst = 0;

    // Load 4-bit data
    #10 load = 1; din = 4'b1011;
    #10 load = 0;

    // Shifting begins after loading
    #100 $finish;
  end
endmodule
