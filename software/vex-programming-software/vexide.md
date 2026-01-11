---
description: >-
  Open-source Rust runtime for VEX V5 robots.
---

{% hint style="info" %}
For more in-depth documentation and tutorials on vexide, head over to their [website](https://vexide.dev/).
{% endhint %}

vexide is a community-maintained Rust runtime for VEX V5 robots. It allows you to write and run Rust code for the V5 Brain and control V5 devices like motors and sensors. You can think of it as an alternative to PROS or VEXcode, but for the Rust programming language (rather than C++).

The framework benfits from Rust's simple toolchain and dependency management, comprehensive standard library, and consistent, modern design. Many mistakes that would be left unchecked in PROS or VEXcode are detected before users upload their programs. For instance, all data aborts and prefetch errors are completely eliminated from vexide programs that use safe Rust.

vexide handles low-level operations like task scheduling, memory allocation, competition state, etc… allowing user code written on top of it to run seamlessly and fast. It heavily leans into Rust's async features for multitasking, providing its own lightweight cooperative scheduler for asynchonous operations.

| Platforms: |
| ---------- |
| Windows    |
| macOS      |
| Linux      |
| Android (via [termux](https://termux.dev/en/)) |

## Features

* Completely open source: development is public and the community is invited to participate.
* Support for Rust's comprehensive `std` library
* Cross-platform development
* Strong, consistent type system prevents mistakes early
* Minimal runtime overhead: vexide programs are small and upload fast
* Easy to handle device [errors](https://doc.rust-lang.org/book/ch09-00-error-handling.html) and understand why your program isn't working
* Test your code and algorithms without a robot by running vexide programs [on your PC](https://vexide.dev/blog/posts/thanksgiving-update-25/#host-compilation--unit-testing)
* Graphics drivers for [Slint](https://slint.dev/) and [embedded-graphics](https://crates.io/crates/embedded-graphics).
* Designed for the `cargo`/[crates.io](https://crates.io/) package manager/dependency ecosystem
* Dedicated [`cargo-v5`](https://github.com/vexide/cargo-v5) CLI tool for uploading.

vexide is available as a [library on crates.io](https://crates.io/crates/vexide) and can be added to an existing Rust project, but the recommended way to create a project is through [vexide-template](https://github.com/vexide/vexide-template/).

## Teams Contributed to this Article:

- [AUBIE2](https://eng.auburn.edu/student-organizations/profiles/ARC.html) (Auburn Robotics Club)
- [FRC 3636](https://frcteam3636.com/) (Generals Robotics)
