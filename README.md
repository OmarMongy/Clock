# Verilog 12-Hour Clock

## Description:

This repository contains the Verilog hardware description language implementation of a 12-hour clock module. The module generates outputs for hours, minutes, seconds, and the period indicator (AM or PM) based on the provided clock signal. The clock operates in a 12-hour format and updates the time with each clock cycle.

## Contents:

1. `clock_module.v`: Verilog source file containing the implementation of the 12-hour clock module.

## Clock Module Implementation: 

The `clock_module.v` file includes the following components:

## Inputs:
- `clk`: Clock input to synchronize the clock's operations.
- `reset`: Asynchronous reset input to reset the clock to the initial state (12:00:00 AM).
- `ena`: Enable input to control whether the clock increments or not.

## Outputs:
- `pm`: Output representing the period indicator (1 for AM, 0 for PM).
- `hh`: Output for the hours (in 8-bit format).
- `mm`: Output for the minutes (in 8-bit format).
- `ss`: Output for the seconds (in 8-bit format).

## Registers:
- `H_reg`: Register to store the current hour value (8 bits).
- `H_next`: Register to store the next hour value (8 bits).
- `M_reg`: Register to store the current minute value (8 bits).
- `M_next`: Register to store the next minute value (8 bits).
- `S_reg`: Register to store the current second value (8 bits).
- `S_next`: Register to store the next second value (8 bits).
- `pm_reg`: Register to store the current period indicator (1 bit).
- `pm_next`: Register to store the next period indicator (1 bit).

## Functionality:

The clock module utilizes state logic, next state logic, and output logic to manage the timekeeping functionality:

## State Logic:
- The state logic block is sensitive to the positive edge of the clock (`posedge clk`) and the positive edge of the reset signal (`posedge reset`).
- Upon reset, the clock initializes to 12:00:00 AM.
- When the enable (`ena`) input is high, the registers (`H_reg`, `M_reg`, `S_reg`, `pm_reg`) are updated with their respective next-state values (`H_next`, `M_next`, `S_next`, `pm_next`).
- When `ena` is low, the registers hold their current values.

## Next State Logic:
- The next state logic block is sensitive to any change in its inputs.
- It calculates the next state values for seconds, minutes, hours, and the period indicator based on the current values.
- The seconds (`S_next`) increment with each clock tick and roll over to 0 after reaching 59.
- The minutes (`M_next`) also increment when seconds reach 59 and roll over to 0 after reaching 59.
- The hours (`H_next`) increment after 12:59:59, rolling over to 1, and toggling the period indicator (`pm_next`) between AM and PM accordingly.

## Output Logic:
- The output logic assigns the values of the registers (`H_reg`, `M_reg`, `S_reg`, `pm_reg`) to the respective outputs (`hh`, `mm`, `ss`, `pm`), providing the current time and period indicator on the outputs.

## Usage:

To use the clock module in your Verilog project, include the `clock_module.v` file and instantiate the `CLOCK` module with appropriate connections to clock, reset, and enable signals. The module outputs (`hh`, `mm`, `ss`, `pm`) will then provide the current time and period indicator for use in your design.

## Contributions:

Contributions to the repository are welcome! If you find any issues or improvements, please feel free to open an issue or submit a pull request.

## License:

This repository is licensed under the MIT License. See the `LICENSE` file for details.
