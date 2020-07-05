---
description: >-
  The Netduino is a 32-bit open-source microcontroller platform created by
  Secret Labs. It is principally programmed in C# using the .NET Micro
  Framework.
---

# Netduino

{% hint style="danger" %}
The Netduino has reached end of life and is no longer sold or supported. The Netduino has been superseded by the [Meadow](meadow.md).
{% endhint %}

![](https://phabricator.purduesigbots.com/file/data/a3rlibpxcczl67zkkf4a/PHID-FILE-ekxjc5b35w25n4i5apdy/processor_netduino.jpg)

## Features

The **Netduino** features the same footprint as the [Arduino](arduino.md) platform, so many existing "[shields](http://www.shieldlist.org/)" providing prepackaged functionality are readily available. However, it provides a [32-bit platform](https://www.wildernesslabs.co/Netduino) which outperforms the Arduino in object-oriented programs and mathematical processing. Additional features include:

* Fast and easy development and testing
* Object-oriented programming language
* Built-in debugger
* [5\_volt\_tolerance](../5-volt-tolerant.md) and moderate [Output Drive](../output-drive.md) allow it to be used with realistic configurations of sensors
* [Active community](http://forums.netduino.com/) and manufacturer support

## Shortcomings

* .NET Micro Framework's overhead leads to[ poor interrupt response](https://www.sparkfun.com/products/retired/10107).
* [Cannot rapidly poll or update its GPIOs](http://forums.netduino.com/index.php/topic/1440-gpio-speed-mhz)
* Internal processes like garbage collection interfere with timing, leading to software [Jitter](../jitter.md)

## History

The Netduino was first tested in VEX Gateway to read [SPI](../spi.md) and [I2C](../i2c.md) data from an Optical Mouse Sensor. However, it did not perform very well in these duties due to the slow response times of the .NET Micro Framework.

### Teams Contributed to this Article:

* [BLRS](https://purduesigbots.com/) \(Purdue SIGBots\)

