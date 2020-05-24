---
description: >-
  In electrical engineering, jitter is used to describe the deviation of a clock
  signal from its periodic time base.
---

# Jitter

![ A diagram showing how jitter might affect a square wave signal](https://phabricator.purduesigbots.com/file/data/q5fv4gl3vwo3yjgdvbqh/PHID-FILE-4lipowbthyt2bsmgzc2k/clock_jitter.jpg)

Ideally, clocking signals would always have the same frequency, but in the real world, deviations from the nameplate rate occur due to a wide range of factors. Jitter is usually stated in percentage \(%\) units, or in parts per million \(ppm\) for low values.

### Random jitter

All clock sources have some degree of _random jitter_, where each clock period is slightly longer or shorter than its stated duration. Over many periods, the random noise averages out and the expected number of transitions occur \(usually to very high accuracy\). Due to quantum mechanical fluctuations, random jitter is impossible to remove fully, but its magnitude is usually insignificant for many applications.

### Even-odd jitter

A family of variations caused by a clock period that does not divide cleanly is colloquially known as _even-odd jitter_. For example, sampling a clock signal with a 50% duty cycle at 3 samples per period will still average to the correct frequency, but on a particular cycle a period could be two, three, or four samples long due to mismatches in phase between the clock and sampling frequency. Software systems frequently round up requests for fractional delays, leading to even-odd jitter when delaying near a rounding boundary.

### Temperature drift

Most clock sources that rely on some type of oscillating element will have a frequency that is somewhat dependent on the operating temperature. This can vary from several percentage points for RC oscillators to less than 10 ppm in temperature-compensated crystal oscillators \(TCXOs\). GPS-based time clocks, phase-locked loops, and other external references are generally free of temperature drift.

### Software jitter

Software routines such as a [PID Controller](../software/control-algorithms/pid-controller.md) or interrupt service routine often expect to be run at precise intervals. Deviations from the schedule may affect the accuracy of algorithms or the timeliness of data. A real-time operating system like [PROS](../software/vex-programming-software/pros.md) helps to reduce software jitter by allowing high-priority tasks to interrupt running low-priority tasks to meet scheduling deadlines. [Easyc](../software/vex-programming-software/easyc.md) was known for large software jitter due to its use of sequential program flow in high-priority interrupt service routines.

## Reducing jitter

[![](https://phabricator.purduesigbots.com/file/data/grxt4aivw4hu6f6iuve4/PHID-FILE-6fgwss5vvbwvihgbx6eb/clock_jitter_datasheet.png)](https://phabricator.purduesigbots.com/file/data/grxt4aivw4hu6f6iuve4/PHID-FILE-6fgwss5vvbwvihgbx6eb/clock_jitter_datasheet.png)

 A typical description in a component datasheet for expected clock **jitter**, showing the effects of both random and temperature drift

Higher-quality, more expensive clocking sources are often designed to reduce or counter the effects of clocking jitter. For applications such as clocking a commodity microcontroller, a few percentage points of jitter may be acceptable for tasks not requiring precise timing. Tightly regulating operating conditions cuts down on age, device, and temperature induced jitter. Using a high-frequency clock source and dividing the frequency, or incorporating a phase-locked loop \(PLL\), can average out jitter over many periods.

To reduce software jitter on [PROS](../software/vex-programming-software/pros.md), avoid using delay\(\) to run a loop at a fixed frequency, as delay does not account for the time expended processing other statements in the loop. Use taskDelayUntil\(\) instead, as shown below:

```c
// NOT how a timed loop is supposed to be run
void operatorControlBAD() {
    while (1) {
        motorSet(5, joystickReadAnalog(1, 3));
        // This will run at less than 50 Hz due to the fact that motorSet() takes time.
        // Additionally, the loop will probably exhibit jitter between 20 and 21 ms
        // periods due to the granularity of the timing system - see "Even-odd jitter".
        delay(20);
    }
}

// How a timed loop is supposed to be run
void operatorControl() {
    // Remember to initialize this variable, or taskDelayUntil will fail
    clock_t now = millis();
    while (1) {
        motorSet(5, joystickReadAnalog(1, 3));
        // This method compensates for the time taken executing other statements in the
        // loop, even if it varies substantially, as long as it is less than 20 ms.
        // In addition, since the time is measured from the start of the last loop, even
        // odd jitter is eliminated completely.
        taskDelayUntil(&now, 20);
    }
}
```

