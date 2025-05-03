# 8-Bit RISC CPU Design

## Overview
This project implements a simple 8-bit RISC (Reduced Instruction Set Computer) CPU using Verilog. The CPU features a 3-bit opcode and 5-bit operand architecture, supporting eight instructions: HLT, SKZ, ADD, AND, XOR, LDA, STO, and JMP. The design is modular, with separate components for the ALU, Controller, Program Counter, Memory, Decoder, Registers, Multiplexer, and Clock Divider, each accompanied by a testbench for verification.

## Project Objectives
- Enhance understanding of digital system design, including CPU architecture, instruction execution, and control signals.
- Simulate and verify the CPU's functionality using testbenches.
- Enhance the familiar with cadence tools.

## Features
- **Instruction Set**: Supports 8 instructions (3-bit opcode, 5-bit address):
  - `HLT` (000): Halts CPU operation.
  - `SKZ` (001): Skips the next instruction if the accumulator is zero.
  - `ADD` (010): Adds memory data to the accumulator.
  - `AND` (011): Performs bitwise AND between accumulator and memory data.
  - `XOR` (100): Performs bitwise XOR between accumulator and memory data.
  - `LDA` (101): Loads memory data into the accumulator.
  - `STO` (110): Stores accumulator data into memory.
  - `JMP` (111): Unconditional jump to a specified address.
- **Memory**: 32-byte memory (5-bit address, 8-bit data) with preloaded instructions and data, supporting read/write operations.
- **Control Unit**: Manages 8-phase instruction execution cycle (INST_ADDR, INST_FETCH, INST_LOAD, IDLE, OP_ADDR, OP_FETCH, ALU_OP, STORE).
- **Clock Division**: Optional clock divider for synchronization or human-readable operation speeds.
- **Verification**: Comprehensive testbenches for each module and the top-level CPU.

## Directory Structure
- **Source Files**:
  - `RISC_CPU.v`: Top-level module integrating all components.
  - `Controller.v`: Generates control signals for CPU operations.
  - `ALU.v`: Performs arithmetic and logic operations.
  - `Memory.v`: Stores instructions and data.
  - `PC.v`: Program Counter for instruction addressing.
  - `Decoder.v`: Decodes instructions into opcode and address.
  - `Register.v`: General-purpose register (used for Instruction Register and Accumulator).
  - `Mux.v`: Address multiplexer for selecting between PC and operand address.
  - `CLK_divider.v`: Clock divider for frequency adjustment.
- **Testbenches**:
  - `RISC_CPU_tb.v`: Tests the entire CPU with a preloaded program.
  - `Controller_tb.v`: Verifies Controller signals and halt functionality.
  - `ALU_tb.v`: Tests all ALU operations and zero detection.
  - `Memory_tb.v`: Validates memory read/write and initialization.
  - `PC_tb.v`: Checks Program Counter reset, increment, and load.
  - `Decoder_tb.v`: Verifies instruction decoding.
  - `Register_tb.v`: Tests register load and reset.
  - `Mux_tb.v`: Validates multiplexer selection.
  - `CLK_divider_tb.v`: Tests clock division, stop, and reset.

- All of them can get in "LSI_design_course-assignment.srcs/sources_1/new" folder (i used the vivado GUI to create them so they have been pushed into the folder).

## Requirements
- **Tools**: Verilog simulator (e.g., Cadence, Vivado, or Synopsys).
- **Dependencies**: All source files listed above (no external libraries required).
- **Hardware**: Designed for FPGA or simulation; no specific target device required.

## Setup and Simulation
1. **Clone the Repository**:
   ```bash
   git clone https://github.com/LELOCQUOCTHINH/8-bit-RISC-Architecture-CPU.git
   cd LSI_design_course-assignment.srcs/sources_1/new
   ```
2. **Using your tools to run RISC-CPU_tb.v file or other simulation files.**

3. **Analyze Results**:
   - Check console output for test case results (pass/fail).
   - Inspect waveforms in GTKWave to verify signal behavior.
   - The `RISC_CPU_tb.v` testbench monitors key signals like `accumulator_register`, `is_zero`, `PC`, `halt`, and `memory_out`.

## Preloaded Program
The `Memory.v` module initializes a 32-byte memory with a test program starting at address `0x00`. The program executes:
- `JMP 0x1E`: Jumps to `TST_JMP`.
- `JMP 0x03`: Jumps to `JMP_OK`.
- `LDA 0x1A` (0x00): Loads 0x00 into the accumulator.
- `SKZ`: Skips next instruction (HLT) since accumulator is zero.
- `LDA 0x1B` (0xFF): Loads 0xFF.
- `SKZ`: No skip (accumulator non-zero).
- `JMP 0x0A`: Jumps to `SKZ_OK`.
- `STO 0x1C`: Stores 0xFF to `TEMP`.
- `XOR 0x1B` (0xFF): Computes 0xFF XOR 0xFF = 0x00.
- Continues until `HLT` at 0x17 address.

The `RISC_CPU_tb.v` verifies key steps, checking accumulator values and `is_zero` signals.

## Evaluation Criteria
- **Functionality**: Correct execution of all instructions per the preloaded program.
- **Modularity**: Logical division into functional blocks (Controller, ALU, etc.).
- **Code Quality**: Clean Verilog code with proper coding style, no hardware violations.
- **Testing**: Comprehensive testbenches with simulation results.

## Future Enhancements
- **Hazard Handling**: Implement pipeline hazard detection and resolution (e.g., data/control hazards).
- **ALU Extensions**: Add support for multiplication, division, or floating-point operations.
- **Instruction Set Expansion**: Introduce new instructions (e.g., shift, rotate).
- **Memory Expansion**: Increase memory size or add separate instruction/data memory.
- **Optimization**: Reduce latency or resource usage through optimized control logic.

## Contributors
- **Le Loc Quoc Thinh**: Lead designer and implementer of all modules and testbenches.

## License
This project is for educational purposes and licensed under the MIT License.

## References
- Course slides and lab materials on LSI design course.
- Verilog HDL documentation and tutorials.
- RISC architecture references from computer architecture course.
