# VEX Cortex

[![](https://phabricator.purduesigbots.com/file/data/johapek6bam5nvrvh4cc/PHID-FILE-y3t3zedljmnwm3fgkkni/processor_cortex.jpg)](https://phabricator.purduesigbots.com/file/data/johapek6bam5nvrvh4cc/PHID-FILE-y3t3zedljmnwm3fgkkni/processor_cortex.jpg)

The **VEX Cortex** is the older microcontroller legal for use in the VEX Robotics Competition College Challenge. It is a 32-bit ARM Cortex-M3 processor with support for [PROS](/w/wiki/cs/pros/), [Easyc](/w/wiki/cs/easyc/), and [Robotc](/w/wiki/cs/robotc/). It features ten motor outputs which can deliver up to 8 A _combined_ of current \(12 A with a [VEX Power Expander](/w/wiki/ee/power_expander/)\), twelve digital inputs/outputs, eight analog inputs, and three communication interfaces.

### Features

* Well-shielded against environmental hazards
* Input pins carry short-circuit and ESD protection
* Compatible with the standard line of [VEX Sensors](/w/vex_sensors/) and [VEX Motors](/w/vex_motor/)
* Only microcontroller which is allowed to directly interface with actuators on the robot
* High-speed, 32-bit ARM Cortex-M3 platform
* Wireless communication and code download using [VEXnet](/w/vexnet/)
* Programmable in PROS, EasyC, or RobotC
* Digital and analog pins are 5-volt tolerant
* Code debugging \([RobotC](/w/robotc/#Debugging) only\)

### Shortcomings

* RobotC interprets the user program, a substantial speed hit to the running program. EasyC and PROS do not have these issues
* VEXnet communications can be lag-prone or inconsistent
* [Power consumption](/w/wiki/ee/power_consumption/) is higher than it could be
* Large, yet does not break out all pins of the microcontroller core chip
* Most powerful chip peripherals are unavailable

### Usage

The VEX Cortex may be mounted in almost any orientation on the robot using 8/32" bolts. However, it is most convenient to have the ports facing upward and the power switch easily accessible. A USB extension cable should be used to relocate the VEXNet key away from potential sources of interference.

Since the VEX Cortex is the only microcontroller which can run actuators on the robot, all past robots have had one. As of VEX Gateway, the additional functionality of Midnight C \(PROS\) and more peripherals have been unlocked. PROS has been used to program the VEX Cortex since VEX Sack Attack.

## Troubleshooting

If the VEX Cortex is not working properly, look at the three indicator lights on the Cortex microcontroller. The most common solution is restarting both the [VEX Joystick](/w/wiki/ee/joystick/) and the Cortex; if the Cortex still fails to operate, downloading the firmware is probably the next step.

| Robot | VEXNet | Game | Diagnosis |
| :--- | :--- | :--- | :--- |
| Red | _See below_ |  | Robot battery is dead |
| Red \(fast flash\) | _See below_ |  | Backup battery low or unplugged |
| Red \(slow flash\) | _See below_ |  | User code has crashed |
| Yellow | _See below_ |  | Robot battery is low |
| Green \(slow flash\) | Off | Green \(flickering\) | Ready to download firmware\\ If not intended, restart the Cortex |
| ::: | Red \(slow flash\) | ::: | Downloading firmware |
| Green | ::: | Off | VEXNet communications lost |
| ::: | Yellow \(slow flash\) | ::: | VEXNet initializing |
| Green _or_\\ Green \(+1 blink\) | Green | ::: | Tethered to PC or joystick |
| ::: | Green \(fast flash\) | ::: | User code running \(no competition switch\) |
| ::: | ::: | Green | Driver control |
| ::: | ::: | Yellow | Robot disabled, set competition switch to Enable |
| Green \(fast flash\) | ::: | Green \(fast flash\) | Autonomous mode |
| Off | Green \(slow flash\) | Off | Code download in progress\\ If stuck in this state, restart the Cortex |

### Known issues

* **Motor ports provide little or no power** - The battery is low, or too much power was drawn from the ports, tripping a [Resettable Fuse \(PTC\)](/w/wiki/ee/resettable_fuse/). Wait a few minutes and try again, or disconnect some motors from the VEX Cortex to lighten the load.
* **Sensors not working properly** - A backup battery should be connected to maintain power to sensors. Sensors work differently when the VEX Cortex is powered from a [ee:powered programming adapter](/w/powered_programming_adapter/) or the orange USB A to A cable. Always test sensors with a [VEX battery](/w/wiki/ee/battery/) connected and in use.
* **Code download stops midway** - Downloading large files exposes problems with [VEXNet](/w/wiki/ee/vexnet/). Go through and optimize the program, or download using the USB tether instead of over wireless.
* **Cortex will not turn off** - When a backup battery is connected, turn off the [VEX Joystick](/w/wiki/ee/joystick/) first and allow the VEX Cortex to lose the connection before powering down to avoid this issue.

### Download Firmware

If VEX releases a firmware update, or the Cortex is acting in an erratic manner, it is time to reflash the firmware. A valid copy of **RobotC** is required to reflash the RobotC Firmware; EasyC and Midnight C only requires a Mastercode update, which can be done without EasyC using the VEXnet Firmware Upgrade Utility.

* Turn off the Cortex
* Connect an orange USB A to A cable to the Cortex USB port and the PC
* Use the appropriate Firmware Update command to reflash the new firmware:
  * **RobotC**: Use ''Robot &gt; Download Firmware &gt; ROBOTC Firmware &gt; Standard File''
  * **EasyC**: Open the ''VEXnet Firmware Upgrade Utility'', select ''Bootload'', answer "Yes" to ''Start Boot Loader?'', and when prompted, click ''Upgrade''
  * **PROS**: Use ''VEX &gt; Update Mastercode...'' _\(Windows only\)_, select ''Bootload'', answer "Yes" to ''Start Boot Loader?'', and when prompted, click ''Upgrade''
* When complete, unplug and restart the Cortex

### External pinout

[![](https://phabricator.purduesigbots.com/file/data/vupanpq7mh6icsh2fx6x/PHID-FILE-2nw2xendnrfqqmtndghl/processor_cortex_pinout.png)](https://phabricator.purduesigbots.com/file/data/vupanpq7mh6icsh2fx6x/PHID-FILE-2nw2xendnrfqqmtndghl/processor_cortex_pinout.png)

 The **VEX Cortex** external pin layout

## Advanced

### GPIO Pin Mapping

[![](https://phabricator.purduesigbots.com/file/data/dxfbqfhigju6ibmj4cwy/PHID-FILE-eox23fnz7z5yp4qswb2y/processor_cortex_internals_top.jpg)](https://phabricator.purduesigbots.com/file/data/dxfbqfhigju6ibmj4cwy/PHID-FILE-eox23fnz7z5yp4qswb2y/processor_cortex_internals_top.jpg)

 Inside of a **VEX Cortex** microcontroller

[![](https://phabricator.purduesigbots.com/file/data/4n3n3wi4xtzns2pzdiqn/PHID-FILE-pihnl7ztr3d5dhqg3cbd/processor_cortex_internals_bottom.jpg)](https://phabricator.purduesigbots.com/file/data/4n3n3wi4xtzns2pzdiqn/PHID-FILE-pihnl7ztr3d5dhqg3cbd/processor_cortex_internals_bottom.jpg)

 Ditto, bottom view

The digital, serial, I2C, and analog pins on the Cortex microcontroller are actually given different names by the microcontroller's registers. By mapping these [GPIO](/w/wiki/ee/gpio/) pins with a test program, the following pin to port map was derived:

* Digital 1 - **PE9** _\(TIM1\_CH1/FSMC\_D6\)_
* Digital 2 - **PE11** _\(TIM1\_CH2/FSMC\_D8\)_
* Digital 3 - **PC6** _\(TIM3\_CH1/I2S2\_MCK/TIM8\_CH1/SDIO\_D6\)_
* Digital 4 - **PC7** _\(TIM3\_CH2/I2S3\_MCK/TIM8\_CH2/SDIO\_D7\)_
* Digital 5 - **PE13** _\(TIM1\_CH3/FSMC\_D10\)_
* Digital 6 - **PE14** _\(TIM1\_CH4/FSMC\_D11\)_
* Digital 7 - **PE8** _\(TIM1\_CH1N/FSMC\_D5\)_
* Digital 8 - **PE10** _\(TIM1\_CH2N/FSMC\_D7\)_
* Digital 9 - **PE12** _\(TIM1\_CH3N/FSMC\_D9\)_
* Digital 10 - **PE7** _\(TIM1\_ETR/FSMC\_D4\)_
* Digital 11 - **PD0** _\(CAN\_RX/FSMC\_D2/OSC\_IN\)_
* Digital 12 - **PD1** _\(CAN\_TX/FSMC\_D3/OSC\_OUT\)_
* SP - **PA4** _\(USART2\_CK/DAC\_OUT1/ADC\_4\)_
* Analog 1 - **PA0** _\(WKUP/USART2\_CTS/TIM2\_CH1\_ETR/TIM5\_CH1/TIM8\_ETR/ADC\_0\)_
* Analog 2 - **PA1** _\(USART2\_RTS/TIM5\_CH2/TIM2\_CH2/ADC\_1\)_
* Analog 3 - **PA2** _\(USART2\_TX/TIM5\_CH3/TIM2\_CH3/ADC\_2\)_
* Analog 4 - **PA3** _\(USART2\_RX/TIM5\_CH4/TIM2\_CH4/ADC\_3\)_
* Analog 5 - **PC2** _\(ADC\_12\)_
* Analog 6 - **PC3** _\(ADC\_13\)_
* Analog 7 - **PC0** _\(ADC\_10\)_
* Analog 8 - **PC1** _\(ADC\_11\)_
* UART1\_TX - **PD5** _\(FSMC\_NWE/USART2\_TX\)_
* UART1\_RX - **PD6** _\(FSMC\_NWAIT/USART2\_RX\)_
* UART2\_TX - **PC10** _\(UART4\_TX/SDIO\_D2/USART3\_TX\)_
* UART2\_RX - **PC11** _\(UART4\_RX/SDIO\_D3/USART3\_RX\)_
* I2C1\_SCL - **PB8** _\(TIM4\_CH3/SDIO\_D4/I2C1\_SCL/CAN\_RX\)_
* I2C1\_SDA - **PB9** _\(TIM4\_CH4/SDIO\_D5/I2C1\_SDA/CAN\_TX\)_

### SPI

By using the second [UART](/w/wiki/ee/uart/) peripheral, one can find its RX pin exposed on analog 4 and its TX pin exposed on analog 3. Its CK pin is also exposed on the SP pin. Combined, these pins form an [SPI](/w/wiki/ee/spi/) device, with MOSI on analog pin 3, MISO on analog pin 4, and SCK on the SP pin. CS can be performed by any free GPIO on the digital, analog, or communication ports.

### I2C

The built-in [I2C](/w/wiki/ee/i2c/) port is linked to I2C1 on its alternate pin mapping. It is used to connect to the [VEX Motor Encoders](/w/wiki/ee/ime/). EasyC, RobotC, and PROS all support use of the port; only PROS allows connection of custom sensors such as [gyros](/w/wiki/ee/gyro/) as well.

Since the I2C and UART ports are directly connected to the STM32 device without short-circuit or ESD protection resistors, they are more vulnerable to failure or lock-up than the regular Digital I/O. easyC and ROBOTC users of the VEX Motor Encoders have found that static built up from driving on the field can discharge through the motor casing and the IME chain into the Cortex, causing a possible lock-up and crash.

### Other peripherals

A Digital-to-Analog Converter \(DAC\) peripheral is exposed on the speaker \(SP\) port. If this port is not being used for analog input or SPI, an analog voltage can be output on this pin. It ranges from about 0.1 to 3.2 V, but is high-impedance. For practical usage of this pin, an operational amplifier must be used to buffer the output.

Several of the built-in timer modules also have exposed capture/compare pins on the available outputs, possibly allowing a VEX Power Expander to run off of a digital port and increase the number of independent output signals. Sophisticated schemes for PWM output or pulse accumulation/width measurement can also be implemented.

### External port details

The Crystal ports and Communications ports are connected directly to their outputs. However, Digital ports have a series 1 Kohm resistance to provide short-circuit protection and a 1 nF capacitor for decoupling, limiting their [Slew Rate](/w/wiki/ee/slew_rate/) and [Output Drive](/w/wiki/ee/output_drive/) accordingly. Analog ports have a voltage divider which makes 5 V inputs safe for the 3.3 V ADC with a total input impedance of around 28 Kohms and an anti-aliasing 3dB bandwidth of 16 KHz. A weak pull-up in processor by default makes Digital inputs float high and Analog inputs idle at about 0.2 V. The Speaker port has a 100 ohm series resistor and no capacitor.

