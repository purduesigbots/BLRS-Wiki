---
description: >-
  The VEX Motor Controller is a device which converts a standard logic-level PWM
  servo control signal into motive power to drive a Motors.
---

# Motor Controller

{% hint style="danger" %}
This article is only relevant for old VEX Cortex system, which is no longer competitive.
{% endhint %}

![](https://phabricator.purduesigbots.com/file/data/etrlal4uipuwqzvaacuf/PHID-FILE-qlxacu4e34tv6ajfqnyf/vex_motor_controller.jpg)

A motor controller is not required for the [VEX Cortex](vex-electronics/vex-cortex.md) ports 1 and 10.

The VEX Motor Controller performs the function of an _**H-Bridge**_. Its FETs, or power output transistors, have a low enough ON resistance to not heat appreciably, even when controlling a [stalled](stalling.md) motor. VEX Motor Controllers add an additional 24 inches of wire onto a motor, which can be a blessing to avoid a PWM extender or a curse when managing short wire runs.

VEX Motor Controllers are driven using a standard hobby servo control scheme, with a 1 ms pulse running full reverse, a 1.5 ms pulse stopping the motor, and a 2 ms pulse running full forward. A non-standard 200 us pulse will engage an active brake. These pulses typically appear on a 20 ms \(50 Hz\) duty cycle, but faster update rates up to 300 Hz may be possible with [PROS](../software/vex-programming-software/pros.md).

