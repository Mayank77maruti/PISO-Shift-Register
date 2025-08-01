## 4-bit PISO Shift Register in Verilog

<img width="795" height="458" alt="Screenshot from 2025-08-01 16-33-37" src="https://github.com/user-attachments/assets/57c5c554-07d1-48a7-b3b1-0df384fffa91" />

<img width="746" height="394" alt="Screenshot from 2025-08-01 16-34-16" src="https://github.com/user-attachments/assets/e9ae8142-e616-41a8-bc3d-a45e22497916" />



This project implements a 4-bit Parallel-In Serial-Out (PISO) Shift Register using Verilog. It includes a custom-designed D Flip-Flop module, a PISO shift register module, and a testbench for simulation.

---

### Modules Overview

**1. D Flip-Flop**

This module represents a basic D-type flip-flop. It updates the output on the positive edge of the clock and includes an active-high asynchronous reset. The output is set to 0 when the reset is active; otherwise, it takes the value of the input `d`.

**2. PISO Shift Register**

The PISO module takes a 4-bit input and outputs the bits serially through a single output pin.

* **Inputs**:

  * `din`: 4-bit parallel input
  * `clk`: Clock signal
  * `rst`: Asynchronous reset
  * `load`: Load signal to capture input data

* **Output**:

  * `dout`: Serial output of the most significant bit (MSB)

**Functionality**:

* When `load` is high, the parallel data is loaded into the internal flip-flops.
* When `load` is low, data begins shifting right at each clock edge, and the serial output reflects the current MSB.

---

### Testbench Overview

The testbench performs the following actions:

* Initializes the clock and reset.
* Applies a reset pulse.
* Loads the input data (for example, 1011).
* Disables load and allows the clock to shift out the bits one by one.

The output sequence for input `1011` is expected to be: 1, 0, 1, 1.

---

### Tools Used

* Verilog Hardware Description Language
* Simulation tools like ModelSim, Icarus Verilog, or Vivado

---
