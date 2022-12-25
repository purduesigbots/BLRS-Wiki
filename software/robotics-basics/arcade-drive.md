# Arcade Drive

## Introduction

Arcade drive is named as such due to its similarity to a video game's control scheme. The idea behind it is to have one joystick control the robot's in-place turning movement, while the other joystick controls its back and forth linear movement (this is known as split arcade, and is the most widely used form of arcade drive). Sometimes the same joystick is used for both, but this reduces the maneuverability of the robot (known as single stick arcade). \


This drive control scheme may be more intuitive to newer drivers who have experience with video game controllers, and provide a smoother experience with linear back and forth movement and in-place turning.&#x20;

## Example Code

Below is example code for arcade drive where the drive control scheme uses the left joystick for linear back and forth movement and the right joystick is used for turning.&#x20;

{% tabs %}
{% tab title="PROS" %}
```clike
#include "main.h"

// Motor definitions
pros::Motor_Group motors_left(1);
pros::Motor_Group motors_right(2); 

void opcontrol() {
    while(1) {
        // Retrieve the necessary joystick values
        int leftY = master.get_analog(pros::E_E_CONTROLLER_ANALOG_LEFT_Y);
        int rightX = master.get_analog(pros::E_E_CONTROLLER_ANALOG_RIGHT_X);
        
        // Move the left side of the robot
        motors_left.move(leftY + rightX);
        
        // Move the right side of the robot 
        motors_right.move(leftY - rightX);
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
vex::motor right_motor(vex::PORT2);

int main(void) {
    while(1) {
        // Retrieve the necessary joystick values
        int leftY = Controller1.Axis3.position(percent);
        int rightX = Controller1.Axis1.position(percent);
        
        // Move the left side of the robot
        motors_left.spin(vex::directionType::fwd, leftY + rightX);
        
        // Move the right side of the robot 
        motors_right.spin(vex::directionType::fwd, leftY - rightX);
        wait(20, msec);
    }
}
```
{% endtab %}
{% endtabs %}

To modify this code to use a single stick, change the leftY or rightX to match the same left/right joystick as the other direction.&#x20;

## Summary

| Pros                                                                               | Cons                                                              |
| ---------------------------------------------------------------------------------- | ----------------------------------------------------------------- |
| Smooth linear and turning movement.                                                | Hard to program and debug                                         |
| Very beginner friendly for those who are familiar with video game control scheme.  | Less direct control of the motors                                 |
| Allows for a single stick to be used to control the robot                          | If single stick arcade is used, then some maneuverability is lost |

### Contributing Teams to this Article:

* [BLRS](https://purduesigbots.com/) (Purdue SIGBots)
