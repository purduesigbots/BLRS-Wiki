---
description: >-
  A UART, or Universal Asynchronous Receiver and Transmitter, is a
  microcontroller peripheral that sends and receives serial data at the level of
  its I/O voltage.
---

# UART

## Operation

![ RS-232 ports on a computer use the same protocol as a UART with only voltage differences](https://phabricator.purduesigbots.com/file/data/luq7cf5gw4qtsazvpmnj/PHID-FILE-a74hi2uen6tvtl6piwrx/uart_serial_port.jpg)

Logic-level serial protocols usually use a high voltage as a "space" signal and a low voltage as a "mark" signal (known as _non-inverted mode_). If a protocol uses the opposite, it is known as _inverted mode_.

Serial communication proceeds in much the same way as in a standard RS-232 port. The most common settings are 8 data bits, no parity bit, and one stop bit, with no flow control. Available baud rates tend to remain the same as conventional serial ports, but can go much faster, as much as 2 Mbaud for some microcontrollers.

## Applications

UARTs are cheap to implement and easy to use; most advanced microcontrollers such as the [LeafLabs Maple](external-boards/leaflabs-maple.md) and [Netduino](external-boards/netduino.md) come with more than one. Serial communication through a UART is usually the easiest way to pass debugging messages to a PC. Many microcontrollers also accept programming downloads through a UART connection. Almost every microcontroller supports at least one UART, making it a quick and universal way to communicate. However, UARTs are very slow and vulnerable to noise compared to protocols such as [SPI](spi.md).

Due to the lack of RS-232 ports on modern computers (which can be connected to a UART using only a voltage level translator), most computers must use a USB to UART converter such as [(ref)](http://www.sparkfun.com/products/9716) to connect to a logic-level UART on a microcontroller.

### Teams Contributed to this Article:

* [BLRS](https://purduesigbots.com) (Purdue SIGBots)
