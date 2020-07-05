---
description: >-
  Voltage tolerance describes what values of input voltages on a
  microcontroller's GPIO pin higher than its I/O voltage are acceptable.
---

# 5 Volt Tolerant

Voltage tolerance is part of a larger family of requirements known as logic levels, which denote the specific voltages acceptable as a logic "high" or "low" by a given logic family of semiconducting devices.

### Motivation

To satisfy the biasing requirements of older RTL and TTL chips, a constant supply voltage had to be used across all chips. 5 volts was chosen because it could handle up to four bipolar transistors \(1.2 V drops from emitter to collector\) in series between the rails. As chip technology advanced to CMOS devices, the power supply requirements became less strict, and chip manufacturers drove supply voltages lower to reduce [Power Consumption](https://github.com/theol0403/BLRS-Wiki/tree/1a2da1c73039274a2ed05a8c941d9ebf94bcac97/w/wiki/ee/power_consumption/README.md). 3.3 V became common as it was easily achievable from one lithium-ion battery, but 1.8 V and then 1.2 V followed driven by the advent of the ultra low-dropout voltage regulator. Modern desktop CPUs run on less than a volt at dozens of amps.

### 5-volt tolerance

A GPIO pin on a 3.3V or lower microcontroller is **5-volt tolerant** if it can handle input voltages of 5 volts without damaging the chip. While most chips have ESD protection which allows a 5-volt transient, current dissipation through the clamp diode will cause issues [\(ref\)](http://www.alteraforum.com/forum/showthread.php?t=201) if the non-tolerant pin is regularly used at 5 V. 5-volt tolerant inputs can also be found [\(ref\)](http://ics.nxp.com/features/5v-io) on discrete logic devices and other non-controller peripherals designed to operate in a mixed-voltage environment. A logic level translator such as the [SparkFun logic level converter](http://www.sparkfun.com/products/8745) or [Adafruit bidirectional level translator](https://www.adafruit.com/products/395) can be used to interface 5V devices to pins which are not tolerant of those voltages.

Digital input pins are often 5-volt tolerant, but pins with analog input or output capability are seldom [\(ref\)](http://digital-diy.com/forum/general-electronics/5v-tolerant-pics-t642.html) 5-volt tolerant. This attribute does **not** mean that the pin will output 5 volts when high; it will still output between 3.1 and 3.3 volts, which is _typically_ recognized as a "high" voltage by both 3.3V and 5V circuits. While some chips might theoretically be able to "accept" up to 6 V on a 5-volt tolerant pin, such usage is not recommended.

## Interfacing examples

Lower-voltage parts \(2.8 V, 1.8 V, or 1.2 V for example\) can also be interfaced with 5 V or 3.3 V devices. Check the datasheet carefully for the acceptable input and output high voltages \(Voh and Vih especially\) to ensure the parts will understand each other.

| Scenario | Solution | More info |
| :--- | :--- | :--- |
| 3.3 V to 5 V | [![](https://phabricator.purduesigbots.com/file/data/wxybz2gf55yx5rk3bg7f/PHID-FILE-2oynczbhutbefrxmo7w2/vtolerance_3v3_5.png)](https://phabricator.purduesigbots.com/file/data/wxybz2gf55yx5rk3bg7f/PHID-FILE-2oynczbhutbefrxmo7w2/vtolerance_3v3_5.png) | Isn't it nice when things just work that way? |
| 5 V to 3.3 V **\(5V tolerant\)** | [![](https://phabricator.purduesigbots.com/file/data/f6plx772y7qxh2a3fjvh/PHID-FILE-faurfcsiuv2rtqs24lm6/vtolerance_5_3v3t.png)](https://phabricator.purduesigbots.com/file/data/f6plx772y7qxh2a3fjvh/PHID-FILE-faurfcsiuv2rtqs24lm6/vtolerance_5_3v3t.png) | Only 5-volt tolerant devices allow this. |
| 5 V \(**open-drain**\) to 3.3 V | [![](https://phabricator.purduesigbots.com/file/data/jr43e3kuakodyrz3fju6/PHID-FILE-tyzzuiqdbsuhduj3rzq7/vtolerance_5od_3v3.png)](https://phabricator.purduesigbots.com/file/data/jr43e3kuakodyrz3fju6/PHID-FILE-tyzzuiqdbsuhduj3rzq7/vtolerance_5od_3v3.png) Add pull-up resistor | **Open-drain** or **open-collector** pins never pull the output high, so the low-voltage part never sees 5 V. Add a pull-up resistor to pull the line high to low voltage. |
| 5 V to 3.3 V | [![](https://phabricator.purduesigbots.com/file/data/nyvadc3vmakjozatbtu7/PHID-FILE-a3angmpokqlxjiu4zhf4/vtolerance_5_3v3_diode.png)](https://phabricator.purduesigbots.com/file/data/nyvadc3vmakjozatbtu7/PHID-FILE-a3angmpokqlxjiu4zhf4/vtolerance_5_3v3_diode.png) Use a diode | This essentially makes the 5 V device pin into an open-drain pin. Cheap and easy, but [Slew Rate](https://github.com/theol0403/BLRS-Wiki/tree/1a2da1c73039274a2ed05a8c941d9ebf94bcac97/w/wiki/ee/slew_rate/README.md) with this setup is poor \(only works for slower signals\). |
| ::: | [![](https://phabricator.purduesigbots.com/file/data/fxstjq4rs5xmndonpvh7/PHID-FILE-styvnnl4o4v3ppct4fq3/vtolerance_5_3v3_mosfet.png)](https://phabricator.purduesigbots.com/file/data/fxstjq4rs5xmndonpvh7/PHID-FILE-styvnnl4o4v3ppct4fq3/vtolerance_5_3v3_mosfet.png) Use a MOSFET | Multiple MOSFETs are often packaged together, allowing this setup to be used on multiple pins. Excellent for [I2C](https://github.com/theol0403/BLRS-Wiki/tree/1a2da1c73039274a2ed05a8c941d9ebf94bcac97/w/wiki/ee/i2c/README.md) connections using I2C's inherent pull-up resistor Slew rate still too slow for anything over 1 MHz, like [SPI](https://github.com/theol0403/BLRS-Wiki/tree/1a2da1c73039274a2ed05a8c941d9ebf94bcac97/w/wiki/ee/spi/README.md). |
| ::: | [![](https://phabricator.purduesigbots.com/file/data/pj4aosr4okiurduxzput/PHID-FILE-adi5474nvheqnausytws/vtolerance_5_3v3_buffer.png)](https://phabricator.purduesigbots.com/file/data/pj4aosr4okiurduxzput/PHID-FILE-adi5474nvheqnausytws/vtolerance_5_3v3_buffer.png) Use a buffer IC | Buffer ICs come in sets of 4-8, allowing this setup to be used on many pins. Excellent slew rate and [Output Drive](https://github.com/theol0403/BLRS-Wiki/tree/1a2da1c73039274a2ed05a8c941d9ebf94bcac97/w/wiki/ee/output_drive/README.md), but IC is bigger and more expensive. Required for bidirectional protocols like One-Wire using a level shifter such as the TXB0104 [\(ref\)](http://www.ti.com/product/txb0104). |

#### Teams Contributed to this Article:

* [BLRS](https://purduesigbots.com/) \(Purdue SIGBots\)

