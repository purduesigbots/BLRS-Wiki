# LED Indicator

![](../../../.gitbook/assets/LEDindicator\_render.png)

The LED Indicator is a 5V LED coming in red, green, or yellow that, unlike the other 3-pin electronics, only possesses 2 pins. However, it is still compatible with the [V5 Brain](../../vex-electronics/vex-v5-brain/), and can be connected to the brain via a 3-wire extension cable. The LED Indicator can be used for decorative purposes, or can be used functionally as a way to show software feedback.

In [VEXcode](../../../software/vex-programming-software/vex-coding-studio-vcs.md) or [PROS](../../../software/vex-programming-software/pros/), the LED Indicator can be configured as a digital output device.

The boolean nature of the LED Indicator (since it relies on digital output) is reversed. A digital output of "0" will turn the LED on, whereas a digital output of "1" will turn the LED off. A strange side effect of using the LED Indicator with the V5 Brain is that it will be faintly illuminated when the digital output value is telling the LED to be off; this behavior is not seen when the LED Indicator is used with the [Cortex](../../legacy/vex-cortex.md).

## Teams Contributed to this Article:

* [BLRS](https://purduesigbots.com/) (Purdue SIGBots)
* [904U](https://www.youtube.com/channel/UCKvtsL9hJ\_x7bqrpl3nJ3Gg) (B.E.S.T.I.E. Robotics)
