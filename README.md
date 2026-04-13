# 🚀 32-bit Single Cycle RISC-V Processor (Verilog)

## 📌 Project Description
This project implements a **32-bit Single-Cycle RISC-V Processor (RV32I)** using **Verilog HDL**.  
The processor is designed and simulated as part of a digital design and computer architecture learning project.

The design follows **Harvard Architecture**, where instruction memory and data memory are separated.  
Each instruction is executed in **a single clock cycle**, including fetch, decode, execute, memory access, and write-back stages.

---

## 🎯 Objectives
- Design a complete **RISC-V datapath**
- Implement all modules using **Verilog HDL**
- Develop **control logic for instruction execution**
- Simulate and verify functionality using **ModelSim**
- Execute a sample program (Fibonacci sequence)

---

## 🧠 Architecture Details
- **Processor Type:** Single-Cycle
- **ISA:** RV32I
- **Data Width:** 32-bit
- **Architecture:** Harvard Architecture
- **Execution:** One instruction per clock cycle

---

## ⚙️ Modules Implemented

### 🔹 ALU (Arithmetic Logic Unit)
- Performs operations: ADD, SUB, AND, OR, XOR
- Generates **Zero flag** for branch operations

### 🔹 Register File
- 32 registers (x0–x31)
- x0 is always zero
- 2 read ports, 1 write port

### 🔹 Program Counter (PC)
- Holds current instruction address
- Updates every clock cycle

### 🔹 PC + 4 Unit
- Generates next sequential instruction address

### 🔹 PC Target Unit
- Computes branch target address

### 🔹 Instruction Memory
- Stores instructions

### 🔹 Data Memory
- Supports load and store operations
- Asynchronous read, synchronous write

### 🔹 Control Unit
- Decodes instruction fields (opcode, funct3, funct7)
- Generates control signals:
  - RegWrite
  - ALUSrc
  - MemWrite
  - ResultSrc
  - Branch
  - ALUControl

### 🔹 Sign Extender
- Extracts and extends immediate values (I, S, B types)

### 🔹 Multiplexers (MUX)
- Used for:
  - ALU input selection
  - Write-back selection
  - PC update selection

### 🔹 Top Module
- Integrates all modules into a complete processor

---

## 🔄 Instruction Execution Flow
1. **Fetch** → Instruction fetched using PC  
2. **Decode** → Control unit generates signals  
3. **Execute** → ALU performs operation  
4. **Memory** → Data memory accessed (if needed)  
5. **Write Back** → Result written to register  





## 🧪 Simulation
- Tool Used: **ModelSim**
- Verified using testbench (`tb_top.v`)
- Observed:
  - PC updates correctly
  - ALU operations working
  - Register writes correct
  - Memory read/write working


---

## 🧾 Supported Instructions
- **R-Type:** add, sub, and, or, xor  
- **I-Type:** addi, lw  
- **S-Type:** sw  
- **B-Type:** beq  

---

## 📊 Features
- Complete single-cycle datapath
- Modular Verilog design
- Word-aligned memory access
- Branch decision using zero flag
- Clean and scalable architecture

---

## 🛠️ Tools Used
- Verilog HDL  
- ModelSim (Simulation)  
- Quartus / Vivado (for synthesis - optional)

---

## 🚀 Future Work
- Convert to **5-stage pipelined processor**
- Add **hazard detection and forwarding**
- Integrate **cache memory**
- Add **UART interface for I/O**
- Implement on **FPGA**

---

## 👩‍💻 Author
**R.Naga Poojitha**  
B.Tech ECE – 3rd Year  
SASTRA Deemed University  

---

## ⭐ Conclusion
This project provides a strong understanding of **processor design, datapath integration, and control logic**.  
It serves as a foundation for advanced topics like **pipelining and high-performance CPU design**.
