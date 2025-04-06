---
description: >-
  Open-source Rust runtime for VEX V5 robots.
---

{% hint style="info" %}
For more in-depth documentation and tutorials on vexide, head over to their [website](https://vexide.dev/).
{% endhint %}

vexide is a community-maintained `no_std` Rust runtime for VEX V5 robots. It allows you to write and run Rust code for the V5 Brain and control V5 devices like motors and sensors. You can think of it as an alternative to PROS or VEXcode, but for the Rust programming language (rather than C or C++).

vexide handles low-level operations like task scheduling, memory allocation, competition state, etc… allowing user code written on top of it to run seamlessly and fast. It heavily leans into Rust's async features for multitasking, providing its own lightweight cooperative scheduler for asynchonous operations.

| Platforms: |
| ---------- |
| Windows    |
| macOS      |
| Linux      |
| Android (via [termux](https://termux.dev/en/)) |

## Features
* Open source; no proprietary dependencies.
* Cross-platform
* Memory Safety
* Minimal Runtime Overhead
* Hardware-optimized VFPv3 Math Operations
* Error handling features for devices.
* Supports compiling to WASM and running locally in a [WASM simulator](https://github.com/vexide/v5wasm) or [QEMU emulator](https://github.com/vexide/vex-v5-qemu).
* Graphics drivers for [Slint](https://slint.dev/) and [embedded-graphics](https://crates.io/crates/embedded-graphics).
* Works with the `cargo`/[crates.io](https://crates.io/) package management/dependency ecosystem.
* Dedicated [`cargo-v5`](https://github.com/vexide/cargo-v5) CLI tool for uploading.

vexide is available as a [library on crates.io](https://crates.io/crates/vexide) and can be added to an existing Rust project, but the recommended way to create a project is through [vexide-template](https://github.com/vexide/vexide-template/).

## Teams Contributed to this Article:

- [AUBIE2](https://eng.auburn.edu/student-organizations/profiles/ARC.html) (Auburn Robotics Club)
- [FRC 3636](https://frcteam3636.com/) (Generals Robotics)
