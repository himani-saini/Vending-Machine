# Vending Machine (Mealy State Machine) :coffee: :dollar:

This project showcases a **Vending Machine** design using a **Mealy State Machine** in **Verilog**. The machine dispenses a product when the correct amount of money is inserted and displays the status of the transaction (whether the user still owes money or if change is due).

<p align="center">
  <img src="https://via.placeholder.com/600x300.png?text=Insert+Your+Vending+Machine+Diagram+Here" 
       alt="Vending Machine Diagram" width="70%">
</p>

---

## :sparkles: Features
- **Mealy State Machine** based design for deterministic outputs.  
- **Coin Input**: Accepts and tracks coin insertions (e.g., 5¢, 10¢, 25¢).  
- **Product Dispensing**: Dispenses product automatically when the full amount is reached.  
- **Change Output**: Calculates change if the user inserts more than required.  
- **Reset & Error States**: Handles reset conditions and undefined states gracefully.

---

## :hammer_and_wrench: Project Structure

    ├── src
    │   ├── vending_machine.v       # Main Verilog module for vending machine logic
    │   ├── vending_machine_tb.v    # Testbench
    │   └── ...
    ├── docs
    │   ├── images                  # Folder for screenshots and diagrams
    │   └── ...
    ├── README.md                   # This file!
    └── ...

---

## :computer: How It Works

**State Machine Approach**  
- The Mealy machine output depends on both the **current state** *and* the **current input**.  
- Transitions occur on clock edges, and states update accordingly.

**Coin Detection**  
- Each coin type triggers a different input line (e.g., `coin_5`, `coin_10`, `coin_25`).  
- The machine adds the coin’s value to an internal register.

**Dispense Logic**  
- If the total inserted is ≥ the product price, the machine transitions to a dispense state.  
- If the total is *more* than required, the difference is output as change.

**Reset State**  
- Ensures the machine returns to a known stable state to avoid undefined behavior.

<p align="center">
  <img src="https://via.placeholder.com/500x300.png?text=Insert+Flow+Diagram" 
       alt="Vending Machine Flow Diagram" width="60%">
</p>

---

## :electric_plug: Getting Started

### Clone the Repo

    git clone https://github.com/YourUsername/Vending-Machine.git
    cd Vending-Machine

### Run Simulation

Use your favorite Verilog simulator (ModelSim, Vivado, Icarus Verilog, etc.).  
Compile the main module (`vending_machine.v`) and the testbench (`vending_machine_tb.v`).  
Run the testbench to see the waveforms or console outputs.

    iverilog -o vending_machine_tb.out src/vending_machine.v src/vending_machine_tb.v
    vvp vending_machine_tb.out

*(Replace with your simulator commands if using ModelSim or Vivado.)*

### View Waveforms (optional)

Open the `.vcd` file in GTKWave or any waveform viewer to observe state transitions and outputs in real-time.

---

## :notebook_with_decorative_cover: File Details

- **`vending_machine.v`**  
  Contains the Mealy state machine logic, coin value addition, state transitions, and output generation.

- **`vending_machine_tb.v`**  
  A testbench that simulates various scenarios:
  - Inserting multiple coins.
  - Overpaying and underpaying.
  - Reset conditions and error states.

---

## :chart_with_upwards_trend: Example Waveform

| Signal        | Description                          |
|---------------|--------------------------------------|
| `clk`         | System clock                         |
| `reset`       | Asynchronous reset signal            |
| `coin_5/10/25`| Coin inputs                          |
| `valid`       | Asserts when machine is ready        |
| `dispense`    | Asserts when product is dispensed    |
| `change`      | Indicates the amount of change       |

*(Feel free to insert an actual screenshot or snippet of your waveform here.)*

---

## :bulb: Contributing

1. **Fork** the repository.  
2. Create a new **branch** (`git checkout -b feature/my-new-feature`).  
3. **Commit** your changes (`git commit -am 'Add some feature'`).  
4. **Push** to the branch (`git push origin feature/my-new-feature`).  
5. **Open a Pull Request**.

---

## :handshake: Acknowledgements

- **Verilog docs & references**  
- **Professors/Mentors** who guided on digital design and state machines  
- **Online forums** for troubleshooting simulation environments  

---

## :mailbox_with_mail: Contact

If you have any questions, issues, or suggestions:

- **Email**: [you@example.com](mailto:you@example.com)  
- **GitHub**: [YourUsername](https://github.com/YourUsername)

---

**Happy Vending!** If you find this project helpful or interesting, please consider giving it a ⭐ on GitHub.

