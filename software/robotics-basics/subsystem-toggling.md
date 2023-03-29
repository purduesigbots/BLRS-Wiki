# Subsystem Toggling

## Introduction

A subsystem toggle is an [operator control](../competition-specific/operator-control.md) feature that allows the user to turn a specific subsystem on the robot on or off. This can be useful for a variety of reasons, such as conserving energy, testing individual components, or disabling a subsystem that is not currently in use.&#x20;

This is widely used on subsystems that may need to run for prolonged periods of time but may need to stop for various reasons such as a [flywheel](../../hardware/shooting-mechanisms/flywheel.md), [lift](../../hardware/lifts/) position hold, or an [intake](../../hardware/intakes.md).&#x20;

## Concept

<figure><img src="../../.gitbook/assets/image (4).png" alt=""><figcaption><p>State Machine Diagram</p></figcaption></figure>

Conceptually, we want to visualize our "toggle" feature as a state machine with 2 states. We start in state 1 where the subsystem is off by default, and turn on the subsystem by pressing the toggle button. In order to keep track of this state, we can use a Boolean variable to do so. If more states are needed, we simply expand the diagram above to have more states where the subsystem has different actions than off and on, and use an integer value or an enumeration to keep track of current state.&#x20;

## Example Code

In the example code below, we will use the button "b" on the [VEX V5](../../vex-electronics/vex-electronics/vex-joystick.md) [controller](../../vex-electronics/vex-electronics/vex-joystick.md) to toggle a [VEX V5 motor](../../vex-electronics/vex-electronics/motors.md) on and off.&#x20;

{% tabs %}
{% tab title="PROS" %}
```cpp
#include "main.h"

pros::Motor motor(1);
pros::Controller master();

bool move = false; // by default, this will not move

void opcontrol() {
    while(true) {
        if(master.get_digital_new_press(pros::Digital_B)) {
            // If this is true, move will changed to false
            // and vice versa. 
            move = !move; 
        }
        
        // If move is true, move the motor.         
        if(move) {
            motor.move(100);
        }
        // Else, don't
        else {
            motor.move(0);
        }
        pros::delay(20);
    }
}

```
{% endtab %}

{% tab title="VEXCode" %}
<pre class="language-clike"><code class="lang-clike">vex::motor mtr(vex::PORT1);
<strong>
</strong><strong>void Motor_Move() {
</strong>    mtr.spin(vex::directionType::fwd, 100);
}

bool prev_value = false; 
bool move = false;

int main() {
    // Since VEXCode doesn't have an equivalent function to 
    // get_digital_new_press, we need to detect the new push 
    // of a controller button. 
    while (1) {
        prev_value = Controller1.ButtonB.pressing();
        // Detect a new press
        if(prev_value == false &#x26;&#x26; Controller1.ButtonB.pressing()) {
            move = !move;
        }
        
        if(move) {
            mtr.spin(vex::directionType::fwd, 100);
        }
        else {
            mtr.spin(vex::directionType::fwd, 0);
        }
        wait(20, msec);
    }
    // OR
    
    // Alternatively, VEXCode also supports 
    // callbacks bound to controller buttons
    //
    // DO NOT put this in a while loop, call before a
    // while loop unlike this example. 
    Controller1.ButtonB.pressed( Motor_Move );
}
</code></pre>
{% endtab %}
{% endtabs %}

## Conclusion

While simple in concept, the execution of such code might be challenging to grasp for beginners. Do note that if multiple threads are both writing and reading to the state variable, it is best practice to use some form of thread protection such as a mutex.&#x20;

### Contributing Teams to this Article:

* [BLRS](https://purduesigbots.com/) (Purdue SIGBots)

