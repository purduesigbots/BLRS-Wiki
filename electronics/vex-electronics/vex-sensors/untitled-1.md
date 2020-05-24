# Ultrasonic

![](https://phabricator.purduesigbots.com/file/data/4fzc76ks6q5j273mqwzw/PHID-FILE-gi5xevx7y6sekffp3dua/ultrasonic_range_finder2-300x300.jpg)

The **VEX Ultrasonic Sensor** \(\([http://www.vexrobotics.com/276-2155.html\)](http://www.vexrobotics.com/276-2155.html%29)\), or simply the **VEX Sonar**, is a rangefinding device which uses pulses of high-frequency sound to estimate the distance to an object. It connects to the [VEX Cortex](/w/wiki/ee/cortex/) or [VEX PIC](/w/wiki/ee/pic/) using two digital ports; one port to send a pulse, and the other to receive it.

Sound travels very slowly compared to the speed of a microprocessor clock; distance can be easily estimated by sending a brief pulse of sound via the ''OUTPUT'' signal, then waiting for the ''INPUT'' signal to change from high to low indicating that the pulse was received back. Calculating the time between, dividing by twice the speed of sound, and scaling to inches or centimeters provides a pretty good estimate of the distance to that object.

Soft or rounded objects do not reflect sound as well and can confuse or elude the VEX Ultrasonic Sensor. Using more than one VEX Ultrasonic Sensor at a time can cause interference, and some versions of [Easyc](/w/wiki/cs/easyc/) are poorly equipped to deal with multiple sonars in use at once.Last Author[baylessj](/p/baylessj/)Last EditedOct 13 2017, 11:54 PM

