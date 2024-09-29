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
* Supports compiling to WASM and running locally in a [simulated enviornment](https://github.com/vexide/v5wasm).
* Graphics drivers for [Slint](https://slint.dev/) and [embedded-graphics](https://crates.io/crates/embedded-graphics).
* Works with the `cargo`/[crates.io](https://crates.io/) package management/dependency ecosystem.
* Dedicated [`cargo-v5`](https://github.com/vexide/cargo-v5) CLI tool for uploading.

## Installation

Before we start, make sure you have `rustc` and `cargo` installed on your machine. You can get that [here](https://www.rust-lang.org/tools/install) from the official Rust site.

vexide relies on some features that are only availble in Rust’s nightly release channel, so you’ll need to switch to using nightly:

```sh
rustup default nightly
```

It also requires build tooling in order to properly build/upload to the V5’s platform target. You can install those components with the following terminal commands:

```sh
rustup component add rust-src
cargo install cargo-v5
```

## Creating a Project

vexide is available as a [library on crates.io](https://crates.io/crates/vexide) and can be added to an existing Rust project, but the recommended way to create a project is through [vexide-template](https://github.com/vexide/vexide-template/).

You can create a local copy of the template on your computer with `git`:

```sh
git clone https://github.com/vexide/vexide-template
```

...or alternatively [download it as a ZIP archive](https://github.com/vexide/vexide-template/archive/refs/heads/main.zip).

## Teams Contributed to this Article:

- [AUBIE1](https://eng.auburn.edu/student-organizations/profiles/ARC.html) (Auburn Robotics Club)
- [FRC 3636](https://frcteam3636.com/) (Generals Robotics)
