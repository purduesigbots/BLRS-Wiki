---
description: >-
  A finite state machine, typically abbreviated simply as a "state machine", is
  a simple system to implement more intelligent scripted control to robot
  programs, particularly in autonomous code.
---

# Finite State Machine

### Definition

Finite state machines have a large but countable number of discrete states in which actions can occur. Based on some stimulus, states transition to other states, which dictate the flow of control. Each state, while it may sense and respond to its environment, is generally tasked with performing one well-defined action; thus finite state machines are not a substitute for a true dynamic autonomous mode.

### Advantages

* Changes to a particular type of robot action need only occur in the state that performs it, not in any preceding or subsequent states
* Easier to maintain and clearer to read; resulting program is much shorter
* Usually outperforms dynamic autonomous in time-critical scripted sections
* Control can easily return to a previous point in the program without an explicit loop statement
* Lends itself easily to planning with a flow chart or field diagram

### Shortcomings

* Somewhat harder to implement properly, as states must not depend too heavily on other states
* Generally cannot perform dynamic autonomous, as that would be an _infinite_ state machine \(although making the entire dynamic section a state in itself is possible\)
* Does not integrate as well with [object recognition](object-recognition/) or a [grid system](grid-system.md)

## Usage

### VEX Gateway

A somewhat primitive 10-state machine was implemented in Honey Badger and Coby for VEX Gateway, controlled by software flow. In the dark days of [Easyc](vex-programming-software/easyc.md), the state machine suffered from the shortcomings of the [VEX Gyro](../electronics/vex-electronics/vex-sensors/gyroscope.md) and the lack of multi-tasking. Therefore, even simple commands such as delay had to be implemented as states, to allow the [PID controller](https://phabricator.purduesigbots.com/w/pid_controller/) to continue to run cooperatively with the main program. Such a configuration, along with smart division into functions, allowed one programmer to write four autonomous scripts in under two hours of coding.

### VEX Sack Attack

In the age of VEX Sack Attack, the [grid system](grid-system.md) was deemed too unreliable to make a good autonomous mode when dealing with Sacks. The Unified State Machine version 2 featured basic velocity control on the drive motors of Artemis to limit overshoot and make best use of the upgraded Pololu MinIMU-9 digital gyro. Velocity control could be disabled when driving for very short distances where the ramp-down would be useless. With the switch to the first versions of [Midnight C](vex-programming-software/midnight-c.md) and later [PROS](vex-programming-software/pros/), multi-tasking capabilities simplified the PID controller and increased the precision of gyros and [VEX Shaft Encoders](../electronics/vex-electronics/vex-sensors/encoder.md).

### VEX Toss Up

VEX Toss Up brought back Large Balls and Buckyballs, which allowed mapping to make a comeback. But for the first few competitions in the Purdue Robotics Challenge, the Unified State Machine made a return for its unmatched ability to spawn autonomous scripts in hours instead of weeks. Further improvements to velocity control of the motors increased the precision of drive movements. Future work involves using a sophisticated CC/CV algorithm for complete control over velocity to improve sections of the match where the state machine is still used.

### Example code

The autonomous routine becomes much simpler with the use of the flow-driven state machine and smart function division. With the use of PROS and multi-tasking, the state\(\) function is a relic of the past incarnations of this state machine. Future work might involve getting rid of it altogether to allow states to take more arguments and increase readability and code efficiency.

```c
void autonomous() {
	fetchNearest();
	// Move backwards, lift intake, move forwards, score
	state(R_DRIVE, -60);
	score();
	state(C_DRIVE,-80);				// Back up to avoid hit trough when lowering arm
	state(ARM_POS,ARM_DOWN);			// Lower arm and turn at the same time
	state(R_TURN, 88);

	state(SET_INTAKE,127);				// Set intake on
	state(C_DRIVE,50);				// Drive forward to grab the first sack
	delay(800);
	state(C_DRIVE,-40);				// Back up

	state(R_TURN,13);				// Turn left and get second sack
	state(C_DRIVE,40);
	delay(800);
	state(C_DRIVE,-40);				// Back up

	state(R_TURN,16);				// Turn left and get third sack
	state(C_DRIVE,60);
	delay(800);
	state(C_DRIVE,-60);				// Back up

	state(R_TURN,50);				// Turn left to 90 degree and go forward
	state(C_DRIVE,100);
	state(R_TURN,-82);				// Turn right

	state(C_DRIVE,25);
	delay(1000);
	state(C_DRIVE,-40);				// Back up

	state(R_TURN,15);				// Turn left and get fifth sack
	state(C_DRIVE,55);
	delay(1000);
	state(C_DRIVE,-40);				// Back up

	state(C_DRIVE,-50);
	state(R_TURN,170);
	state(R_DRIVE,-260);
	delay(500);
	state(SET_INTAKE, 0);
	state(R_DRIVE,800);				// Prepare to score
	state(C_TURN,80);
	state(C_DRIVE,110);
}
```

