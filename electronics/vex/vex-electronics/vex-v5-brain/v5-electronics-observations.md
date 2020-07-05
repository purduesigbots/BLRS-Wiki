---
description: >-
  This guide provides a general overview of observations we've observed in
  regards to some issues/features of the VEX V5 electronics system.
---

# V5 Electronics Observations and Issues

## **Motor Current Rate Limiting**

Although VEXU teams are officially allowed to use as many motors as they want, this is not normally the case due to the V5 firmware dynamically limiting the power of motors when the number of motors is more than 8 as of VEXos Version 1.0.8. Due to this, we try to stick to roughly 8-12 motors per robot to prevent different motors from being rate limited.

[**VEXos \(Firmware\) Changelog**](https://www.vexrobotics.com/vexedr/products/firmware)

## **V5 Broken Brain Ports**

It has been observed that the V5 brain ports are extremely susceptible to ESD \(electric static discharge\), leaving the port unusable. To prevent this from happening:

* Try to prevent metal shavings from getting into the brain ports.
* Use anti-static tiles or anti-static spray if necessary at competitions.
* Try to use pre-crimped vex wires if possible.
* Use the[ V5 ESD Protection Board](v5-esd-protection-board.md)\*

Although this may not be a 100% fix for the issue, it can help prevent ports from dying according to VEX and others experiencing similar issues.

\*Note: The V5 ESD Protection Board may not be competition legal as per VUR6.

### **\(**_**Potentially**_**\) Fixing V5 Ports**

Although not officially supported by vex, it's theorized that ports dead from ESD could be fixed if the RS485 chip for a dead port could be desoldered and replaced with a new one. The general procedure for this is discussed in [**this VEX Forum post.**](https://www.vexforum.com/t/broken-v5-ports-and-how-to-fix-them/76342)

**Do note that strictly speaking, this would render the V5 brain competition illegal due to it being internally modified.**

#### Teams Contributed to this Article:

* [BLRS](https://purduesigbots.com/) \(Purdue SIGBots\)

