---
description: >-
  An Inter-Integrated Circuit interface, or I2C interface for short, is a
  two-wire bidirectional synchronous serial protocol connecting a master and one
  or more slaves.
---

# I2C

## Operation

![ A typical I2C transaction showing both data reads and data writes](https://phabricator.purduesigbots.com/file/data/vmca3t6sqjoypy6xlnbs/PHID-FILE-ycw35eq5wsb3g32mcx5s/i2c_timing.png)

An I2C bus consists of two wires: **SDA** \(**s**erial **da**ta\) and **SCL** \(**s**erial **cl**ock\). The clock line allows for synchronous transmission, so I2C can achieve higher transmission speeds than an equivalent [UART](uart.md) and does not require clock recovery. However, I2C peripherals are less common and harder to implement than a simple serial interface.

Both wires of an I2C bus are normally in the logic high state, held there by a tolerant of the highest voltage in use.

Pull-up resistors have slow [slew rates](slew-rate.md), limiting the speed available for long wires; the I2C specification explicitly limits I2C buffer chip. I2C typically operates at clock speeds from 100 KHz to 400 KHz, resulting in real data transmission rates of approximately 80 Kbps to 350 Kbps. I2C is therefore slower than [SPI](spi.md) but faster than most UARTs. Due to the moderate data transmission rate, the [output drive](output-drive.md) and slew rate of the controlling devices themselves is generally not important.

I2C buses can have up to 126 devices, of which only one can be the master at any given time _\(but multiple masters may transmit non-concurrently on the same bus\)_. The master is responsible for starting and ending all communications. Each device has an _address_, a 7-bit number from 0x01 to 0x7F. Many devices can have their addresses configured to one of several available possibilities in this range.

## Transmissions

A transmission begins with a **start condition**, when the SDA line is pulled low by the master while the SCL line is high. This causes all devices on the bus to begin listening. The master next transmits the address of the desired slave on the SDA line, with the data being shifted out _most significant bit first_ on the **rising edge** of SCL. While SCL is high, the data on SDA **may not** change during a transmission, except for start and stop conditions.

If the master wants to _read_ from the slave, the address is followed by a '1' bit; to _write_ to the slave, the address is followed by a '0' bit. Slaves whose addresses do not match will disconnect and await the next transmission indicated by a START condition; the matching slave \(if any\) will respond with an **ACK** condition by pulling SDA low after the address has been transmitted.

### Writing data

Communication can proceed in one of two ways. If the master indicated a request to write data, the master will continue to transmit data bytes in the same way that it transmitted the slave address. After each byte, the master will wait until the slave acknowledges before transmitting the next byte. The first byte transferred usually indicates a register address on the slave where further data will be stored. The next data byte will be stored at that address, and each subsequent data byte is often stored at the next register address, as the slave usually auto-increments the current address after each byte is received and stored. If only the address is transmitted, the slave will remember the address but will not write any data, which is useful for setting a register position for reading.

### Reading data

If the master indicated a request to read data, the master will control the SCL line while reading data values on SDA. On each high-to-low transition on SCL, the slave will either pull SDA down or let it float high depending on the bit to be transferred; on the next low-to-high transition of SCL, the master will sample the bit. Bytes are shifted out of the slave starting with the current address, which is usually the last address written. The _master_ will now acknowledge after each byte transferred, and will issue a _no-acknowledge_ \(**NAK**\) after the last desired byte is read. After each byte is transmitted, the receiver will usually increment its register address, just like when writing data.

[![](https://phabricator.purduesigbots.com/file/data/v5owk2r3whhiajjsk45p/PHID-FILE-4u53woiffcwwrrkp7kx3/i2c_smbus.jpg)](https://phabricator.purduesigbots.com/file/data/v5owk2r3whhiajjsk45p/PHID-FILE-4u53woiffcwwrrkp7kx3/i2c_smbus.jpg)

**I2C** is used by computer peripherals to communicate on the System Management Bus \(SMBus\)

### End of transmission

After the end of a communication sequence with a particular slave, the master will issue a **STOP** condition by allowing SDA to float from low to high after releasing SCL, which causes all devices on the bus to begin monitoring once again for the next START condition.

Errors can occur during an I2C transmission, most of which the master can intelligently detect; errors such as [noisy signals](line-noise.md), fighting between multiple masters, disobedient slaves pulling a signal low at incorrect times, and framing errors with the returned data are often indicated by flags in the master's I2C registers.

The System Management Bus \(SMBus\) protocol developed by Intel, used to manage simple peripherals such as power supplies and fans in modern computers, uses a slower protocol that is otherwise nearly identical to I2C.

## Example usage

For the [VEX Cortex](../vex/legacy/vex-cortex.md) with [PROS](../../software/vex-programming-software/pros/), I2C is implemented in the core library. Since the vast majority of devices use an 8-bit register architecture, the most useful functions are:

* i2cWriteRegister\(address, register, value\) - Accepts an address, register number, and value, and writes the value into the specified device register. This function only writes one register at a time. The address must be in the same format as that used by the [Arduino](external-boards/arduino.md) \(right-aligned in the seven least significant bits\)
* i2cReadRegister\(address, register, \*value, count\) - Accepts an address, register number, and data array, and reads count values from the device register into the array value passed by reference. Most devices automatically increment the register number after each read, allowing a block of registers to be read at once.

The i2cRead and i2cWrite functions may also be useful for more unusual slave devices; see the API documentation for more details.

#### Teams Contributed to this Article:

* [BLRS](https://purduesigbots.com/) \(Purdue SIGBots\)

