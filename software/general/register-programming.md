# Register Programming

**Register programming** refers to an arcane but frequently necessary method of programming in [embedded systems work](embedded-programming-tips.md). Often filled with jargon and insidious details, such programming is best left to experts.

## Gory details

Typical programmers, especially those brought up through a CS education, generally focus on programming at the algorithmic level. However, to make functions work at this level, low-level support routines such as device drivers for hardware must be functional. Embedded systems programming seeks to get this stuff out of the way, and is more frequently taught in electrical and computer engineering courses. An example of what one might see in a low-level driver is shown below:

```bash
// Enable OC1-OC4 as output compare, preload enabled, active then inactive when counting up
// ("PWM mode 1")
TIM4->CCMR1 = (uint16_t)0x6868;
TIM4->CCMR2 = (uint16_t)0x6868;
// Activate OC1-OC4 as active low signals (with the CCMR1-2 settings, this causes a right-
// aligned active high pulse to appear on the output)
TIM4->CCER = (uint16_t)0x3333;
```

This code looks very little like C; most constants are in hexadecimal, most variables have unintuitive names, and familiar constructs such as while loops are distorted to the point of confusion. Since this type of code is seldom self-documenting, good [code style](../code-management/code-styling-guide.md) dictates a descriptive comment for nearly every line.

### Contributing Teams to this Article:

* [BLRS](https://purduesigbots.com/) (Purdue SIGBots)
