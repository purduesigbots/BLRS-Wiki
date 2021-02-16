# Red Green Buoy

The **Red Buoy, Green Buoy Algorithm**, or simply **Red/Green Buoy** for short, is a simple terminal guidance algorithm for homing at close range on an object initially sensed by [object recognition](./) techniques.

## [Motivation](https://www.youtube.com/watch?v=VTxZ9BseCQQ)

Even in the advanced [Botball Robotics Competition](https://www.kipr.org/botball) with the use of the 50-FPS XBC FPGA-based parallel vision controller, using the camera to track objects at close ranges was problematic. Cameras mounted to see the maximum area of the field often had perilously small fields of view up close, and the rate at which robots needed to react to capture objects was much higher than the camera could functionally provide.

Initially, additional analog sensor ports connected to short range IR rangefinders were utilized to provide some simple [bang-bang](../control-algorithms/bang-bang.md) control, but this often introduced wild oscillations that hurled objects throughout the field. While potentially also disastrous for an opponent, such careless behavior rarely led to productive scoring. A breakthrough came when the iRobot Roomba's algorithm for finding its charging base, applied in reverse, was used to provide a much smoother method for proper close-range guidance.

Due to the user manual's reference to the three sensors as the _"Red Buoy"_, _"Green Buoy"_, and _"Force Field"_, the new algorithm came to be known as the "Red-Buoy Green-Buoy Method". iRobot's use of these names likely stems from the use of similar techniques to properly moor ships in dark harbors centuries ago by observing two colored buoys set up along intended paths. Modern airplanes still carry one red and one green light on opposite wingtips, allowing other pilots to instantly tell in dark skies which way another aircraft is facing.

## Procedure

A minimum of three range-finding sensors, such as a [VEX Ultrasonic](../../electronics/vex/vex-sensors/ultrasonic.md) or Sharp IR rangefinder, must be used for proper implementation of the algorithm. Up to seven sensors can be used for the best possible quality, but it is also possible to do a decent job with only two sensors.

In addition, it must be possible to use an object recognition system to verify the presence of a valid scoring object in the field of view. Objects belonging to the opponent and opposing robots look just as good to rangefinders as the appropriate target, although the multi-sensor versions do a good job of differentiating walls from narrow objects.

The sensors must be configured in the pattern shown in the diagram, with a narrow beam of coincidence just wider than the size of the intended target between the two central cones of detection. Additional sensors, if available, should be configured as to create additional beams of coincidence at steadily increasing angles in order to widen the effective field of view. However, having too many sensors can reduce the rate of data acquisition if the sensors must take turns to avoid interference.

The algorithm follows a [PID loop](../control-algorithms/pid-controller.md) to keep the object inside the narrow beam; if the object strays to the side, it will cease to register on one of the beacons, and the robot will turn towards the new heading. When initially scanning for a target, the algorithm looks for a set of transitions to start detection; wide targets like walls will not have any perceptible edge transitions and will hopefully be excluded. In practice, the algorithm should be performed far from interfering objects.

At extremely close ranges, the third sensor, known as the "Force Field", is used \(if present\) to slow the robot down and provide the final commands needed to bring the object inside the manipulator. In the case of wide intake devices, this sensor can optionally be omitted.

## In - Practice \(Honey Badger\)

Due to a constraint on the number of digital ports, Honey Badger \(BLRS's Gateway Robot\) only was able to field two VEX Ultrasonic sensors. In addition, the object recognition software was not ready at the time of the algorithm's initial development. Therefore, a custom Red/Green Buoy variant was devised as a general object search technique. It followed the original algorithm closely, but had a much larger scan range to actually find faraway objects, as opposed to simply providing close-in guidance. In addition, no edge detection was possible at such far ranges, so the scan algorithm simply spun until something was found in the overlap region and then drove out to collect it.

These compromises unfortunately led to an inability to properly sense which objects were of the desired color, and a tendency to detect people, robots, and walls as candidates due to the very long maximum scan range. However, it was effective enough to fill the intake mechanism each time it was run.

### Teams Contributed to this Article:

* [BLRS](https://purduesigbots.com/) \(Purdue SIGBots\)

