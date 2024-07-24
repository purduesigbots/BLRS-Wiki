# Enumerations

## Understanding C++ Enums

### What is an Enumeration?

An enumeration, or `enum`, is a special type of variable in C++ that lets you name a set of related values. Instead of using random numbers, you can use meaningful names. This makes your code easier to read and understand. Enums are especially useful in robotics, where you might have different states or modes for your individual motors, subsystems, or sensors.

### Using Numbers Instead of Enums

When you use numbers to represent different values, it can get confusing quickly if you use just numbers to keep track of states. Notice how hard it is to understand what each number means just by looking at the code:

```cpp
int armPosition = 1;
int clawPosition = 2;

if (armPosition == 1 && clawPosition == 2) {
    // Raise arm and open claw
    armMotor.move(100);
    clawMotor.move(100);
} else if (armPosition == 2 && clawPosition == 1) {
    // Lower arm and close claw
    armMotor.move(-100);
    clawMotor.move(-100);
}
```

Again, it's hard to remember what `1` and `2` mean for both the arm and the claw. Imagine this now with 5 to 10 different states!

### Using Enums

We can use enums to make it clear what each state represents. This makes the code more organized and human-friendly.

```cpp
enum ArmPosition {
    UP = 1,
    DOWN = 2
};

enum ClawPosition {
    OPEN = 1,
    CLOSED = 2
};

ArmPosition armPosition = UP;
ClawPosition clawPosition = OPEN;

if (armPosition == UP && clawPosition == OPEN) {
    // Raise arm and open claw
    armMotor.move(100);
    clawMotor.move(100);
} else if (armPosition == DOWN && clawPosition == CLOSED) {
    // Lower arm and close claw
    armMotor.move(-100);
    clawMotor.move(-100);
}
```

By using `UP`, `DOWN`, `OPEN`, and `CLOSED`, anyone can understand what state the arm and claw should be in. This reduces mistakes and makes the code much easier to work with.

### Enums Inside Namespaces

To keep your code even more organized, you can use [namespaces](namespaces.md). Namespaces act like drawers to separate different sets of enums. This is particularly useful when you have enums for different parts of your robot. &#x20;

```cpp
namespace MySingleMotor {
    enum Direction {
        FORWARD = 1,
        BACKWARD = 2,
        STOPPED = 3
    };
}

namespace Arm {
    enum Position {
        UP = 1,
        DOWN = 2
    };
}

namespace Claw {
    enum State {
        OPEN = 1,
        CLOSED = 2
    };
}

Motor::Direction motorDirection = Motor::FORWARD;
Arm::Position armPosition = Arm::UP;
Claw::State clawState = Claw::OPEN;

if (motorDirection == MySingleMotor::FORWARD) {
    // Move motor forward
    motor.move(100);
} else if (motorDirection == MySingleMotor::BACKWARD) {
    // Move motor backward
    motor.move(-100);
} else if (motorDirection == MySingleMotor::STOPPED) {
    // Stop motor
    motor.move(0);
}

if (armPosition == Arm::UP && clawState == Claw::OPEN) {
    // Raise arm and open claw
    armMotor.move(100);
    clawMotor.move(100);
} else if (armPosition == Arm::DOWN && clawState == Claw::CLOSED) {
    // Lower arm and close claw
    armMotor.move(-100);
    clawMotor.move(-100);
}
```

By placing enums inside namespaces, you can easily see which part of the robot each enum belongs to. This adds another layer of organization to your code, making it much easier to maintain and expand.&#x20;

Using enums and namespaces together helps keep your code neat and straightforward. It's like turning a messy room into an organized one, where everything is easy to find and use.&#x20;

#### Teams Contributed to this Article:

* [BLRS](https://purduesigbots.com/) (Purdue SIGBots)
