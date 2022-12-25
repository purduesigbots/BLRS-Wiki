---
description: D R I F T
---

# Joystick Deadzones

## Introduction

Sometimes, [controller](../../vex-electronics/vex-electronics/vex-joystick.md) joysticks may have a slight non-zero reading when in a neutral position. This may cause robot motors to drift during operator control when motors are directly controlled by the joysticks.

To mitigate this effect, some teams implement a filter where if a joystick's value is low, the joystick's value will be set to zero. This effectively creates a "deadzone" near the center position of the joystick where any small joystick inputs will not be read.&#x20;

## Example Code

Below is example code for joystick deadzones applied to a [tank drive](tank-drive.md).&#x20;

{% tabs %}
{% tab title="PROS" %}
```clike
#include "main.h"

// Motor Group Declarations for Left and Right
pros::Motor_Group motors_left(1);
pros::Motor_Group motors_right(2, true);

// Deadzone of 5
const int deadzone = 5;

void opcontrol() {
    while(1) {
        // Retrieve the joystick values for left and right Y.
        int left = master.get_analog(pros::E_CONTROLLER_ANALOG_LEFT_Y);
        int right = master.get_analog(pros::E_CONTROLLER_ANALOG_RIGHT_Y);
        
        // std::abs takes the absolute value of whatever it is called on.
        // Thus, any values in range (-5,5) are discarded as 0.
        if(std::abs(left) < deadzone)) {
            left = 0;
        }
        if(std::abs(right) < deadzone)) {
            right = 0;
        }
        
        // Drive the left side of the robot forward at joystick left Y speed
        motors_left.move(left);
        
        // Drive the right side of the robot forward at joystick right Y speed
        motors_right.move(right);
        delay(20);
    }
}
```
{% endtab %}

{% tab title="VEXCode" %}
```clike
#include "vex.h"
using namespace vex;

vex::motor left_motor(vex::PORT1);
vex::motor right_motor(vex::PORT2, true);

// Deadzone of 5
const int deadzone = 5;

int main(void) {
    while(1) {
        // Retrieve the necessary joystick values
        int leftY = Controller1.Axis3.position(percent);
        int rightY = Controller1.Axis2.position(percent);
        
        // std::abs takes the absolute value of whatever it is called on.
        // Thus, any values in range (-5,5) are discarded as 0.
        if(std::abs(left) < deadzone)) {
            left = 0;
        }
        if(std::abs(right) < deadzone)) {
            right = 0;
        }
        
        // Move the left side of the robot
        motors_left.spin(vex::directionType::fwd, leftY);
        
        // Move the right side of the robot 
        motors_right.spin(vex::directionType::fwd, rightY);
        wait(20, msec);
    }
}
```
{% endtab %}
{% endtabs %}

## Summary

Joystick dead zones while removing some degree of controllability, are sometimes necessary to prevent motor drift with a defective controller. Most of the time, this occurs with older controllers with worn-down joysticks. &#x20;

### Contributing Teams to this Article:

* [BLRS](https://purduesigbots.com/) (Purdue SIGBots)
