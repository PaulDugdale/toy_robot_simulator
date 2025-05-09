# Toy Robot Simulator

A simple Ruby application that simulates a toy robot moving on a 5x5 square tabletop.

## Setup

Clone the repository:
```bash
git clone https://github.com/PaulDugdale/toy_robot_simulator.git
cd toy_robot_simulator
```
Install dependencies:
```bash
bundle install
```
## Usage

### Interactive Mode (Standard Input)

Run the application without any arguments to enter interactive mode, or pipe in the input.

### File Input Mode

Provide a filepath as a command-line argument to read commands from a file. Each command should be on a new line.

```bash
bin/toy_robot_simulator commands.txt
```

**Example `commands.txt`:**
```
PLACE 0,0,NORTH
MOVE
REPORT
PLACE 0,0,NORTH
LEFT
REPORT
PLACE 1,2,EAST
MOVE
MOVE
LEFT
MOVE
REPORT
```

**Output for `commands.txt`:**
```
0,1,NORTH
0,0,WEST
3,3,NORTH
```

## Running Tests

The project uses RSpec for testing.

To run all tests:
```bash
bundle exec rspec
```
