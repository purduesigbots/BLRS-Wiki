---
description: >-
  Bit-banging is a process where one emulates an unavailable peripheral using
  direct port manipulation commands on GPIO pins.
---

# Bit-Bang

_This article concerns digital protocol emulation. For the similar-sounding but generally unrelated topic of controlling a system, see_ [_Bang-bang_](../../software/control-algorithms/bang-bang.md)_._

A common example of this process would be the Arduino [SoftwareSerial](http://arduino.cc/en/Reference/SoftwareSerial) library, which emulates additional [UARTs](uart.md) on a microcontroller with only one in hardware.

## Uses

Some microcontrollers may have a limited number of key peripherals, or may map them to pins required for other purposes. If for any reason a peripheral of the correct type is unavailable, bit-banging is an alternative for many protocols. [SPI](spi.md) is the easiest protocol to bit-bang, as it is synchronous and therefore resistant to slight timing changes caused by interrupt execution. However, using clever programming with hardware timers, USARTs and [I2C](i2c.md) can be emulated as well. Unusual or custom protocols must often also be bit-banged.

When emulating a peripheral, the timing requirements must carefully be examined to ensure that any interruptions caused by other events will not corrupt data. Interrupts may need to be disabled during certain critical sections. If an unused timer module is available, its output compare or input capture methods can perform precisely timed operations and allow the program to get to them when it has time.

## Code example

As the [VEX Cortex](../legacy/vex-cortex.md) lacks an accessible SPI port, SPI can be easily implemented by bit-banging. A trivial example is shown below; better performance can be achieved with a kernel-mode driver.

```c
// Definitions of Digital pin numbers on the Cortex to use for SPI
#define PIN_SPI_CS 9
#define PIN_SPI_MISO 10
#define PIN_SPI_MOSI 11
#define PIN_SPI_SCK 12

// Write an 8-bit value to SPI most significant bit (MSB) first and return
// the 8-bit response value from the slave
// This function uses clock phase 0, clock polarity 0. See the SPI article
// and hardware datasheet for the different CPHA and CPOL settings.
uint8_t spiWriteRead(uint8_t value) {
    uint8_t j, out = 0x00;
    // Assert CS to select device (active low)
    digitalWrite(PIN_SPI_CS, 0);
    for (uint32_t i = 0; i < 8; i++) {
        // Set bit
        if (value & 0x80)
            digitalWrite(PIN_SPI_MOSI, 1);
        else
            digitalWrite(PIN_SPI_MOSI, 0);
        // Move next bit into most significant position
        value <<= 1;
        // Assert the clock
        digitalWrite(PIN_SPI_SCK, 1);
        // Delay for a short while
        // Due to CPU usage problems, tasks cannot yet delay for less than 1 ms
        // As a 1 KHz SPI rate is unacceptably slow, mash this out in software
        for (j = 0; j != 63; j++) asm("");
        // Read the MISO line for slave data
        if (digitalRead(PIN_SPI_MISO))
            out |= 0x01;
        out <<= 1;
        // Negate the clock
        digitalWrite(PIN_SPI_SCK, 0);
        // Delay for a short while again
        for (j = 0; j != 63; j++) asm("");
    }
    // Negate CS
    digitalWrite(PIN_SPI_CS, 1);
    return out;
}
```

### Teams Contributed to this Article:

* [BLRS](https://purduesigbots.com/) \(Purdue SIGBots\)

