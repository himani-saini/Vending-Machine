# Vending Machine (Mealy State Machine) 
# 🧃🪙

This project showcases a **Vending Machine** design in **Verilog** that accepts **5₹** and **10₹** inputs, dispenses a product, and provides change if necessary. It uses a **Mealy State Machine** approach, where outputs depend on both the current state and the current input.

---

## ✨Features

- **Mealy State Machine** for determining outputs based on current state and input  
- **Coin Input**: Accepts 5₹ (binary `01`) and 10₹ (binary `10`)  
- **Product Dispensing**: As soon as sufficient money is inserted, output goes high to dispense the product  
- **Change Output**: Provides change (in 2-bit binary) if extra money is inserted  
  - `2'b01` = 5₹ change  
  - `2'b10` = 10₹ change  
- **Reset Logic**: Returns the machine to state `s0` when reset is high  

---

##  💻How It Works

### State Definitions
- `s0` (00): The user has inserted 0₹ so far  
- `s1` (01): The user has inserted 5₹ so far  
- `s2` (10): The user has inserted 10₹ so far  

> **Note**: In a Mealy machine, the outputs depend on both the current state and the current input.

### Coin Inputs 🪙
- `00` = No new coin inserted  
- `01` = 5₹ coin inserted  
- `10` = 10₹ coin inserted  

### Outputs 
- **out**: Goes high (1) to indicate that a product has been dispensed  
- **change** (2 bits): Indicates how much change is returned, if any

### Waveform 
<p align="left">
  <img src="mealy_fsm/docs/gtkwave.png" 
   alt="Vending Machine State Diagram" width="60%">
</p>


---

## 🛠 Project Structure
<pre>
├── mealy fsm
│   ├── vending_machine.v       # Main Verilog module for vending machine logic
│   ├── vending_machine.vvp    
│   └── vending_machine.vcd     # Dumpfile 
│   └── vending_machine_tb.v    # Testbench
│   ├── docs                        # Folder for screenshots and diagrams
│   └── gtkwave.png            
│   └── state_diagram.png
├── README.md                   # This file!
</pre>

---

## 🔌Simulation & Testing

1. **Clone the Repo**  
   - `git clone https://github.com/YourUsername/vending_machine.git`  
   - `cd vending_machine`

2. **Run Simulation**  
   - Use your preferred Verilog simulator (ModelSim, Vivado, Icarus Verilog, etc.).
   - Compile the main module and the testbench.
   - Run the testbench to observe console output or waveforms.

3. **View Waveforms** (Optional)  
   - If your testbench generates a `.vcd` file, you can open it in GTKWave or another waveform viewer to inspect state transitions, product dispensing signals, and change output.

---

## 📔File Details

- **`vending_machine.v`**  
  The main Verilog module implementing the Mealy state machine. Accepts 5₹ and 10₹ as inputs, dispenses product, and gives change.

- **`vending_machine_tb.v`**  
  A testbench (not shown here) that simulates coin inputs, verifies correct dispense logic, checks change output, and tests the reset functionality.

---

## State Table (From Diagram)

Below is a table reflecting the transitions shown in the diagram.  
Each row shows: (1) the current state, (2) the coin/input inserted,  
(3) the next state after the transition, (4) whether the product is dispensed (output = 0 or 1),  
and (5) the change returned in rupees.

| **Current State** | **Input (₹)** | **Next State**  | **Output** (Dispensed) | **Change (₹)** |
|:-----------------:|:------------:|:---------------:|:----------------------:|:--------------:|
| **S0 (0₹)**       | 0            | S0 (0₹)         | 0                      | 0              |
| **S0 (0₹)**       | 0            | S0 (0₹)         | 0                      | 5              |
| **S0 (0₹)**       | 0            | S0 (0₹)         | 0                      | 10             |
| **S0 (0₹)**       | 5            | S1 (5₹)         | 0                      | 0              |
| **S0 (0₹)**       | 10           | S2 (10₹)        | 0                      | 0              |
| **S1 (5₹)**       | 0            | S0 (0₹)         | 0                      | 5              |
| **S1 (5₹)**       | 5            | S2 (10₹)        | 0                      | 0              |
| **S1 (5₹)**       | 10           | S0 (0₹)         | 1                      | 0              |
| **S2 (10₹)**      | 0            | S0 (0₹)         | 0                      | 10             |
| **S2 (10₹)**      | 5            | S0 (0₹)         | 1                      | 0              |
| **S2 (10₹)**      | 10           | S0 (0₹)         | 1                      | 5              |

> **Notes:**
> - **Input** = coin inserted (in ₹).  
> - **Output** = 1 if product is dispensed, 0 otherwise.  
> - **Change** (in ₹) is the amount returned if the user has inserted more than needed or cancels.
> - After dispensing or returning the full amount, the machine resets to **S0 (0₹)**. 

<p><img src= "mealy_fsm/docs/state_diagram.png"></p>
---

## 💡Contributing

1. **Fork** this repository 
2. Create a new **branch** (`git checkout -b feature/my-new-feature`)  
3. **Commit** your changes (`git commit -am 'Add a new feature'`)  
4. **Push** to the branch (`git push origin feature/my-new-feature`)  
5. **Open a Pull Request** for discussion and review

---

## :handshake:Acknowledgements

- **Verilog Documentation** & references  
- **Arjun Narula (YouTube)** for clear and helpful digital design explanations  
- **NPTEL Hardware Modelling course by Prof. Indranil Sengupta (YouTube)** for in-depth coverage of hardware modeling concepts
 
---

**Happy Vending!** If you find this project helpful or interesting, please consider giving it a ⭐ on GitHub.

