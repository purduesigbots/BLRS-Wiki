# Stalling

![ The red region on the motor power curve chart indicates operating conditions at risk for a stall](https://phabricator.purduesigbots.com/file/data/tsefgqqu2epvkwdqao7d/PHID-FILE-76cjkli2c6vu4vjnsmjn/vex\_motor\_393\_curve.png)

A **stall** is a condition where power is applied to an electric motor such as a [VEX Motor](../../vex-electronics/vex-electronics/motors.md), but no motion is generated due to high loads or a failed motor core. Since all of the applied power is thus dissipated as heat, this condition can be harmful to a motor if not treated quickly.

## Theory

A rotating motor acts as a generator, producing a voltage in the opposing direction to the motor drive voltage which acts as an effective resistor, limiting the current flow. As the motor load increases and the output shaft speed drops, the "back-EMF" voltage is lower and more current can flow to the motor, increasing [Power Consumption](power-consumption.md).

However, if the motor reaches zero speed, the back EMF voltage drops to zero, and the current dramatically increases as a result. Since all of the power is converted to heat inside the motor, the motor will often heat up quickly, tripping a [Resettable Fuse (PTC)](resettable-fuse-ptc.md) or other form of current protection. In extreme cases, sustained stalls can damage a motor.

## Prevention

_Main article:_ [_Stall Detection_](../../software/general/stall-detection.md)

Stalls often occur when a mechanism becomes jammed or when a motor is run too close to its torque limit. To solve these problems, the offending mechanism can be fixed, or unusual conditions handled in software. Use the power calculator on the torque page to determine what gear ratio is required to avoid a stall under normal conditions.

### Teams Contributed to this Article:

* [BLRS](https://purduesigbots.com) (Purdue SIGBots)
