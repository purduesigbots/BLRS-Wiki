---
description: The VEX Potentiometer helps track the rotations of shafts
---

# Potentiometer

![VEX Potentiometers: Older EDR Model (Left) and Newer V5 Model (Right) (Courtesy of VEX KB)](<../../../.gitbook/assets/image (8) (2) (2).png>)

The [**VEX Potentiometer**](https://www.vexrobotics.com/276-2216.html) is a simple analog sensor used to measure angular position. It returns a voltage between 0 and +5 V linearly proportional to its angular offset from one side. Currently, there are two different models: the older red potentiometer, and the newer black potentiometer. While the red potentiometer has a range of motion of approximately 260º, it can only electrically measure up to approximately 250º. Because it is somewhat fragile. it is important that these older units be protected against external stresses past its limits to prevent breaking the device. The new potentiometer, however, is able to rotate a full 360º and has a 333º electrical rotation angle, and this lack of a hard stop means that it is much less easily damaged (although one should always be careful).

## Installation

To install the potentiometer, run the shaft of the arm whose movement needs to be measured through the small, white square hole in the middle, which is able to rotate. The larger black (or red, depending on the model) outer casing is screwed onto the robot. Then when the arm lifts, its axle turns the inner portion of the sensor to produce a reading.&#x20;

This sensor will require some advance planning in the robot design. First of all, they take up space; it is important to plan where the sensor should be to avoid issues with other parts, especially moveable ones. The newer sensor is smaller, but it will also necessitate advance planning. Second, it can be difficult to put one of these on after the fact; doing so would likely involve taking the arm joint apart and changing all of the existing spacers, etc. to get it to fit since usually it would be installed fairly early on in the construction process. Not only that, but if the spot is tight enough to where it just won’t fit, it may require even more disassembly or even a partial re-design.&#x20;

If the arm is geared, that is, the motor is turning at speed X and through gears makes the arm move at speed Y, and you are planning to use one of the older red potentiometers, be sure to install the potentiometer on the shaft that stays within that 250º arc. Do not install an older potentiometer on any shaft that is spinning more than 250º. If it is installed on a shaft that exceeds this, the sensor’s “stops” at each end of the arc will likely break, and the data will be meaningless. Since the newer potentiometers do not have a hard stop, they may be installed on any shaft.\


## Testing

Despite what VEX says in their documentation, the shaft may not “slide easily” into the sensor; it may be necessary to use a significant amount of force. Be careful, though; this stiffness increases the likelihood of inserting the square arm shaft in not-quite-the-right orientation of the sensor, which could damage it. Take some time and make sure to think through and visualize each step before committing to it and screw everything together.&#x20;

Install it “just enough” at first; no need to tighten it completely or put lock nuts on yet. Using the online/debugger window, manually move the robot’s arm up & down to make sure that the sensor data is between 0 and 4095 at all times. If the sensor value does not move smoothly through the range, that is, if it stays at one number for a long time, or has a gigantic jump, then it is likely on the wrong way.&#x20;

The arm’s potentiometer values (POT, for short) don’t need to start at zero at the bottom of your robot’s arm movement; the important thing is that the arm’s lowest position and highest position are both in the sensor’s range as listed above. When doing testing, make sure to write down the minimum and maximum values for your robot’s arm movement and put them in the engineering notebook. The programmers for your team will need this information.\


## How it works

![Courtesy of VEX Forum user jpearman](../../../.gitbook/assets/potentiometer\_int\_old.png)

Inside the outer casing is an adjustable resistor, and turning the shaft at the bottom of the sensor changes the resistance, allowing varying amounts of voltage to get to the other end of the circuit. That amount of voltage is measured and converted by the cortex into a value between 0 and 4095.

Here’s VEX’s [documentation sheet](https://content.vexrobotics.com/docs/instructions/276-2216-inst-0312.pdf) with the technical specs.

## Usage

Potentiometers measure absolute position through a short range of motion, so they are good for lifts and other subsystems with a defined range of motion. The resolution is higher than with an [Encoder](encoder.md) and the potentiometer only requires one wire, so if a system can use a potentiometer then that's recommended.

### Teams Contributed to this Article:

* [BLRS](https://purduesigbots.com/) (Purdue SIGBots)
