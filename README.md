# UART Transmitter - Verilog HDL

A UART (Universal Asynchronous Receiver Transmitter) 
Transmitter implemented in Verilog HDL using FSM design.

## Features
- 8-bit data transmission
- FSM based design (IDLE, START, DATA, STOP)
- Configurable clock
- Done flag indication

## FSM States
| State | Description |
|-------|-------------|
| IDLE  | Waiting for start signal |
| START | Sends start bit (0) |
| DATA  | Sends 8 data bits |
| STOP  | Sends stop bit (1) |

## Tools Used
- Verilog HDL
- Icarus Verilog 12.0
- EDA Playground
