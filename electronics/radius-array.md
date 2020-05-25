---
description: >-
  The SIGBOTS R.A.D.I.U.S. Array (Reflectance and Analog Data Interpretation
  Unified Sensor) is a sophisticated line tracking sensor with capabilities
  exceeding that of the VEX Line Tracker.
---

# Radius Array

By utilizing 32 sensors and on-board processing, the radius array allows fast and accurate line tracking in a variety of conditions.

### Features

The Radius Array uses four sets of [QTR8A line tracking sensors](https://www.pololu.com/product/960) for a total of 32 sensors. Each sensor stick of eight emitters is broken into a six-sensor and a two-sensor piece and then arranged in the form of a 6x6 square with the corners cut off. This arrangement increases the effective sensing area to a nearly 2.5" by 3.5" rectangle, as opposed to the tiny window on the VEX Line Tracker, and allows lines to be acquired at high speeds. In addition, the large sensing area allows the angle and position of the line to be estimated based on the particular pattern of activated and unactivated line tracking sensors.

Additional on-board features include a [3.3 V voltage regulator](https://www.ti.com/product/LM2937) for the entire system to be connected to a power supply or VEX Cortex via a VEX PWM Cable. Data is returned to the [VEX Cortex](vex-electronics/vex-cortex.md) via an [I2C](i2c.md) connection, with a second I2C port for adding a [gyro](vex-sensors/gyroscope.md) or VEX Motor Encoder. TVS diodes are also installed to protect the I2C bus from ESD. All the electrical engineering and firmware development for this board was done by Purdue SIGBOTS.

### Data processing

Since no microcontroller has 32 analog-to-digital conversion channels, external ADC chips are installed on the radius array. Each chip is a [TLV1543](https://www.ti.com/product/TLV1543) with 3.3 V supply and 11 channels, controlled over [SPI](spi.md). A central microcontroller, the [ATmega328P](https://www.microchip.com/wwwproducts/en/atmega328p) used in the [Arduino](external-boards/arduino.md) development board, is tasked with reading the large quantities of data and reducing the data down to a few key criteria regarding the line's position, angle, and intersection.

Initially, the [least squares method](https://mathworld.wolfram.com/LeastSquaresFitting.html) was used with a weighted data array to determine the slope of the line currently in view. Sensors over the line with a corresponding large signal value would be incorporated heavily into the resulting regression, while sensors which only saw the line weakly or not at all had little to no weight in the calculation. However, the linear least squares method fails on lines that are nearly vertical, as the slope diverges to a singularity for a fully vertical line.

To rectify the shortcomings, a more complex [perpendicular least squares method](https://mathworld.wolfram.com/LeastSquaresFittingPerpendicularOffsets.html) was used instead for the final revision, which uses perpendicular distance to the line and therefore has no trouble dealing with vertical lines. Intersecting lines in the field of view were another key test case; while detection was easy, determining the intersection angle was more troubling. But once the center of gravity was determined with a weighted average, the sensors could be split into quadrants to isolate the two lines of best fit.

### Shortcomings

* Emitters can use large amounts of power and flood the field with too much infrared light
* Variance from sensor to sensor is higher than VEX sensors
* Infrared filtering not as good as VEX sensors, but frequency filtering can be incorporated in software



#### Teams Contributed to this Article:

* [BLRS](https://purduesigbots.com/) \(Purdue SIGBots\)

