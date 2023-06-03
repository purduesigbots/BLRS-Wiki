# Tank Drive

## Introduction

Tank Drive is a very easy to program operator control drive control scheme. The idea behind it is that the [controller](../../vex-electronics/vex-electronics/vex-joystick.md)'s **left joystick controls the left side of the chassis**, while the **right joystick controls the right side of the chassis.**&#x20;

This drive control scheme is extremely easy to program, but may be unintuitive to newer drivers who may have prior experience with video game controllers. However, some higher skilled drivers may prefer tank drive as it provides direct control to each side of the chassis and may provide more maneuverability.

## Example Code

{% tabs %}
{% tab title="PROS" %}
```clike
#include "main.h"

// Motor Group Declarations for Left and Right
pros::Motor_Group motors_left(1);
pros::Motor_Group motors_right(2, true); // Be sure to reverse this!

void opcontrol() {
    while(1) {
        // Drive the left side of the robot forward at joystick left Y speed
        motors_left.move(master.get_analog(pros::E_CONTROLLER_ANALOG_LEFT_Y));
        
        // Drive the right side of the robot forward at joystick right Y speed
        motors_right.move(master.get_analog(pros::E_CONTROLLER_ANALOG_RIGHT_Y));
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

int main(void) {
    while(1) {
        // Retrieve the necessary joystick values
        int leftY = Controller1.Axis3.position(percent);
        int rightY = Controller1.Axis2.position(percent);
        
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

<table><thead><tr><th width="366">Pros</th><th>Cons</th></tr></thead><tbody><tr><td>Easy to Program</td><td>Always requires 2 joysticks</td></tr><tr><td>Direct control to motors allows a skilled driver to be more maneuverable with the robot</td><td>Imprecise Linear Forwards and Backwards Movement, as well as In-Place Turning</td></tr><tr><td>Easy to Debug</td><td>May be less intuitive for less experienced drivers.</td></tr></tbody></table>

### Contributing Teams to this Article:

* [BLRS](https://purduesigbots.com/) (Purdue SIGBots)
