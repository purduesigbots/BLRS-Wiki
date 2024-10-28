---
description: The Line Tracker can track "lines" and other objects using infrared LEDs
---

# Line Tracker

![](<../../../.gitbook/assets/Line Tracker.jpg>)

The **Line Tracker** is an analog sensor consisting of an infrared LED and an infrared light sensor. It has a single mounting hole and is designed to be mounted under the chassis of a robot. The Line Tracker allows a robot to follow a pre-marked path.

The Line Tracker functions by illuminating a surface with its infrared light LED and then the infrared light sensor measures the reflected infrared radiation. Based on the reflected radiation’s intensity, the Line Tracker can determine how light or dark the surface is below the sensor.

Lightly colored surfaces will reflect more infrared light than dark surfaces and will appear brighter to the sensor. This allows the sensor to detect a dark line on a pale surface, or a pale line on a dark surface.

The Line Tracker is an analog sensor which means the infrared sensor will return a value anywhere between 0v and 5v of voltage to the V5 Brain depending on the reflected infrared radiation. The V5 Brain then converts this value to a percentage of reflectivity. This type of measurement requires an adequate threshold of difference between the shades of reflectivity in order to successfully follow a line.

For example, the Line Tracker will not follow a strip of black electrical tape placed on the dark gray VEX Competition Field Tiles because the sensor will return percentages of reflection too close together for a threshold of difference. However, a strip of white electrical tape on the VEX Competition Field Tiles will provide a large difference in values and an adequate threshold for the robot to track the tape.

## Teams Contributed to this Article:

* [BLRS](https://purduesigbots.com/) (Purdue SIGBots)
