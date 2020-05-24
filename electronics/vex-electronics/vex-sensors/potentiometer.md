# Potentiometer

![](https://phabricator.purduesigbots.com/file/data/ftan5koigk6lnucqdhx7/PHID-FILE-k3c33rkyjx5xmpmwbgiq/vex_potentiometer.jpg)

The **VEX Potentiometer** \([https://www.vexrobotics.com/276-2216.html](https://www.vexrobotics.com/276-2216.html)\) is a simple analog sensor which returns a voltage between 0 and +5 V linearly proportional to its angular offset from one side. Its range of measurement can vary from 240 to 280 degrees; the unit **must** be protected against external stresses past its limits to prevent breaking the device.

## Installation

The hole in the middle of the sensor is square, and you run the arm’s shaft through it. The small white inner part of the sensor is square and can rotate \(hard to see until you’re holding one\); the big red part is screwed onto the robot. Then when the arm lifts, its axle turns that inner white portion of the sensor to produce a reading.

This sensor, along with the optical shaft encoders \(subject of my next post\) require some advance planning in your robot design. They take up space. It’s difficult to slap one of these on after the fact; doing so usually involves taking the arm joint apart and changing all of your spacers, etc. to get it to fit. And maybe you have a tight spot, in which it will never fit. That’s why you have to include this sensor at the start of your design process.

If your arm is geared—the motor is turning at speed X and through gears makes the arm move at speed Y—be sure to install the potentiometer on the shaft that stays within that 250º arc. Do not install it on the shaft that is spinning more than one full revolution. If you do, the sensor’s “stops” at each end of the arc will break, but more importantly the data will be meaningless.

## Testing

A warning: Despite what VEX says in their documentation, the shaft does not “slide easily” into the sensor; you really have to shove it in. This stiffness increases the likelihood of inserting your square arm shaft in not-quite-the-right orientation of the sensor. Take your time and think through and visualize each step before you commit to it and screw everything back together.

Install it “just enough” at first; no need to tighten it completely or put lock nuts on yet. Using the online/debugger window, manually move your robot’s arm up & down to make sure that the sensor data is between 0 and 4095 at all times. If the sensor value does not move smoothly through the range—it stays at one number for a long time, or has a gigantic jump—then you’ve got it on the wrong way.

Your arm’s potentiometer values \(POT, for short\) don’t need to start at zero at the bottom of your robot’s arm movement. The only important thing is that the arm’s lowest position and highest position are both in the sensor’s range as listed above. When doing your testing, write down the minimum and maximum values for your robot’s arm movement and put them in your engineering notebook. Your programmers will need this information.

## How it works

[![](https://phabricator.purduesigbots.com/file/data/lotrmul3zkupy6irjepq/PHID-FILE-dtmfgwr2umqja5elkbyk/potentiometer_inside-300x200.jpg)](https://phabricator.purduesigbots.com/file/data/lotrmul3zkupy6irjepq/PHID-FILE-dtmfgwr2umqja5elkbyk/potentiometer_inside-300x200.jpg)

 Inside the red casing is an adjustable resistor; turning the shaft changes the resistance, allowing varying amounts of voltage to get to the other end of the circuit. That amount of voltage is measured and converted by the cortex into a value between 0 and 4095.

Here’s VEX’s [documentation sheet](https://content.vexrobotics.com/docs/instructions/276-2216-inst-0312.pdf) with the technical specs.

## Usage

Potentiometers measure absolute position through a short range of motion, so they are good for lifts and other subsystems with a defined range of motion. The resolution is higher than with an [Encoder](/w/wiki/ee/vex_sensors/encoder/) and the potentiometer only requires one wire, so if a system can use a potentiometer then that's recommended.

