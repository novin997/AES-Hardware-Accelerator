# AES-Hardware-Accelerator
> AES Accelerator 128-bits designed using Synosys 32nm/28nm tools. The AES Version used is Rijndael which key and text of 128 bits
  The project is mainly coded in Verilog for the hardware and Tcl for clock timing restrictions and optimizations  

### 1. Single Input Single Output(SISO)

Sending one text and key into the AES Accelerator at the same time
 * CLK period = 2ns
 * CLK Rate = 0.5GHz
 * Critical Path Delay = 1.28 ns
 * Maximum Throughput = 500 MHz * 1/39 = 12.82051282 MSamples/s
 * Number of Registers = 663

### 2. Multiple Input Multiple Output(MIMO)

Sending four text and four key together into the AES Accelerator at the same time

 * CLK period = 2ns
 * CLK Rate = 0.5GHz
 * Critical Path Delay = 1.79 ns
 * Maximum Throughput = 500 MHz * 4/39 = 51.28205128 MSamples/s
 * Number of Registers = 2583

### 3. 4-Slowing 
Sending four text and four key into the AES Accelerator in a pipelined way. 4-Slowing method include timing optimization to push the 
speed of the AES Accelerator up to 1Ghz without violating the **setup** and **hold** time of the circuit.

 * CLK period = 1ns
 * CLK Rate = 1GHz
 * Critical Path Delay = 0.96 ns
 * Maximum Throughput = 1000 MHz * 4/50 = 80 MSamples/s
 * Number of Registers = 1941

