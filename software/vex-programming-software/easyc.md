---
description: EasyC is a programming language for the VEX Cortex.
---

# EasyC

{% hint style="danger" %}
EasyC is for the older VEX Cortex which is no longer competitve.
{% endhint %}

| Platforms: |
| :--- |
| Windows |
| OSS \(Partial\) |

* VEX Supported
* Native code compilation
* 32- and 64-bit types
* Partial multitasking
* Proprietary libraries
* Works out-of-box, built-in IDE
* **Superseded by** [**Midnight C**](midnight-c.md)

**EasyC** is a programming language for the [VEX Cortex](../../vex-electronics/legacy/vex-cortex.md). It initially appears to sport a drag-and-drop interface designed for beginners, but hides a full C text editor and compiler underneath that can compile to native code for the Cortex.

## Features

* Native code compilation \(thus fast execution\)
* Built-in library is a good compromise between ease of use and granularity
* VEX-supported with strong community following, especially among high school teams
* IDE integrates firmware updates, code authoring, compilation, and flashing into one program
* Extensive documentation and help files

## Shortcomings

* Not all C features are available, including pointers and the standard library. However, the early versions of [Midnight C](midnight-c.md) are completely backwards-compatible with EasyC and unlock said functionality
* Not free and works only on Windows
* Advanced C editor has been somewhat neglected and does not feature code completion
* Flash utility does not cooperate with powered programming adapters.
* Low-level code performance poor, with buggy library functions and unpredictable timing [Jitter](../../electronics/general/jitter.md)

### Teams Contributed to this Article:

* [BLRS](https://purduesigbots.com/) \(Purdue SIGBots\)

