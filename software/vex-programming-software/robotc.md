# RobotC

## Details:

* VEX-Supported
* Bytecode interpreted
* Preemptive multitasking
* Proprietary libraries
* Works out-of-box, built-in IDE
* **Superseded by** [**Midnight C**](https://blrs.gitbook.io/blrs-wiki/software/midnight-c)

**RobotC** is an _interpreted_ C-like programming language available for the VEX PIC and [VEX Cortex](https://blrs.gitbook.io/blrs-wiki/electronics/vex-cortex). It offers real-time debugging and a relatively simple set of internal libraries mostly based on the use of \(real or virtual\) arrays.

### Features

* Built-in debugger allows pausing and resuming user code and real-time monitoring of variables
* IDE integrates firmware updates, code authoring, compilation, and flashing into one program
* Primitive multi-tasking built in
* Support available on website and from VEX
* Simple and easy to learn, no need for users to interest themselves with technical details

### Shortcomings

* Interpreter emulates an 8-bit processor, substantially slowing user code and preventing any numerically intensive algorithms from being useful
* Library abstracts many details and prevents advanced access or fine-tuning [VEX sensors](https://phabricator.purduesigbots.com/w/ee/vex_sensors/)
* Neither free nor open-source, and only works on Windows
* Lack of support for objects, dynamic allocation, wide integers, or interrupts severely limits code capabilities
* Array-like syntax can be confusing and is rife with opportunities for indexes out of bounds or overflow
* Optimizer is poor and IDE is generally low-quality, with a fixed code style and terrible code completion

## History

RobotC was first used in 2010 for both robots.

RobotC was used in [VEX Gateway](https://phabricator.purduesigbots.com/w/eng/vex_gateway/) for [Honey Badger](https://phabricator.purduesigbots.com/w/eng/gateway_honey_badger/) and its [semi-dynamic autonomous](https://phabricator.purduesigbots.com/w/autonomous_code/) [finite state machine](https://phabricator.purduesigbots.com/w/finite_state_machine/). However, at the [VEX Disney All-Stars competition](https://phabricator.purduesigbots.com/w/eng/all_star_competition/), the team was introduced to [easyC](https://phabricator.purduesigbots.com/w/easyc/) for the VEX Cortex. RobotC was ultimately retired and superseded by easyC, and was eventually fully superseded by the [Pros](https://phabricator.purduesigbots.com/w/pros/).

