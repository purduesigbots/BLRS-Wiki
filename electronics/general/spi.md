---
description: >-
  A serial peripheral interface, or SPI for short, is a fast 4-wire synchronous
  protocol connecting a microcontroller and a peripheral.
---

# SPI

## Description

![ Sample connection diagram between an SPI master and three SPI slaves](https://phabricator.purduesigbots.com/file/data/efxztftbyquxzqjacfbl/PHID-FILE-ymmaqcbfrat4zj7etqyb/spi_connections.png)

SPI operates by transmitting data on changes of a separate clock connection, typically called **SCK**. SPI defines the device which generates the clock as the **master** and all other devices as **slave**s. Data is sent from the master to a slave using the **MOSI** pin (**M**aster **O**ut **S**lave **I**n) and is received from slaves using the **MISO** pin (**M**aster **I**n **S**lave **O**ut).

To allow multiple devices to share the same SPI connections, a fourth pin known as **CS** (**C**hip **S**elect) is used to switch between devices. Each device has a CS pin; when it is _low_, that device is selected and can read or respond to transmissions, whereas a _high_ value will disable that device and cause it to ignore all other activity on the SPI connection.

![ Timing diagram illustrating the effects of the CPOL and CPHA settings on data transmission](https://phabricator.purduesigbots.com/file/data/ulvty4l5vhnpbsxvxqbb/PHID-FILE-jb6ijqt3vzqetvzvn6j4/spi_timing.png)

The clock can default to high or low based on the **CPOL** (clock polarity) setting, and the data on the transmit or receive lines will be read by connected devices on either a high-to-low or low-to-high transition depending on the **CPHA** (clock phase) setting. While masters can transmit at any time, slaves cannot transmit data unless they are selected and receiving data. During this time, slaves can set the value of the MISO pin, which the master will sample as data is being transmitted at the same time as the slave would normally read the data in. Often, "dummy" data is transmitted after a request to read data to allow the slave to respond.

Since SPI is synchronous, it can transmit at very high rates, up to and exceeding 18 MBps in optimized implementations. Oversampling is typically not required, so SPI can operate at up to half of the core clock rate of most microcontrollers.

## Usage

SPI is commonly used to connect multiple fast digital devices, such as digital [gyros](../../vex-electronics/vex-sensors/3-pin-adi-sensors/gyroscope.md) and [accelerometers](../../vex-electronics/vex-sensors/3-pin-adi-sensors/accelerometer.md), to a microcontroller. Since any digital [GPIO](gpio.md) pin can serve as a chip select, large groups of devices can be placed on the same SPI bus, as long as each device properly ignores data and does not try to transmit while it is not the selected device. At the same time, care must be taken with multi-device buses to avoid situations where more than one device is selected due to coding errors on the master code.

In reality, trying to use SPI at a clock speed of more than 4 MHz requires a very short, dedicated connection or a device known as a bus driver to avoid issues with [slew rate](slew-rate.md) which could garble the transmitted data.

SPI is also known as Microwire (an older implementation). Some devices such as the TI MSP430 series rename the MISO and MOSI pins to "SOMI" and "SIMO" to get around patent limitations.

### Teams Contributed to this Article:

* [BLRS](https://purduesigbots.com) (Purdue SIGBots)
