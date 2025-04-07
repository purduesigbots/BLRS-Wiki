---
description: >-
  Methods for getting an accurate and robust velocity output for high speed
  mechanisms, such as flywheels.
---

# Flywheel Velocity Control

[Flywheels ](../../hardware/shooting-mechanisms/flywheel.md)have been a fundamental scoring mechanism throughout the history of VEX. They were dominant in the VRC/VEXU games of Nothing But Net and Turning Point, and are on track to be a powerhouse in the 2022-2023 game Spin Up. However, many teams that build flywheels will run into two common problems:

1. Flywheels do not consistently reach and maintain their desired speed.
2. Flywheels lose a lot of speed after firing and take time to get back up to their desired speed.

The purpose of this article is to demonstrate the effects of these problems, explain and write code to help limit the effects of these problems, and demonstrate the impact this code has.

## Effects of Problems

As described above, flywheels suffer two major problems. Each problem has its own unique effect on the robot's ability to fire game objects, but they both can have a significant impact on your team's match performance.

### Inconsistencies reaching and maintaining speeds

Based on our knowledge of flywheels, we know that their purpose is to efficiently store rotational energy. When a game object comes in contact with the flywheel, the stored rotational energy is transferred to the game object and launched the object forward. The lost energy in the flywheel causes its rotational speed to drop, requiring time in between shots to get back up to speed.&#x20;

## Programming Solution

There are three primary things we want our flywheel control to do:

1. Accelerate as fast as possible while we are not at the desired speed.
2. Maintain a close rpm to our desired speed.
3. Self-correct the flywheel's true speed to minimize error.

We can use a different control algorithm to accomplish each of these goals. Those algorithms are [Bang Bang](bang-bang.md), Feedforward, and [PID](pid-controller.md), respectively.

#### Implementation of Bang Bang control for Flywheels

In this case, we will use a Bang Bang controller to accelerate quickly to our target flywheel speed. If our current flywheel's speed is significantly lower than our target speed, we will run the flywheel at max power to accelerate quickly. Similarly, if our current flywheel's speed is significantly faster than our target speed, we will supply no power to the motor so that it slows down quickly.

{% tabs %}
{% tab title="PROS" %}
### _Example Bang Bang implementation in PROS_

{% code lineNumbers="true" %}
```cpp
pros::Motor flywheel_motor(10); // flywheel in port 10
int threshold = 5;              // range to determine if we should use Bang Bang

void move_rpm(int target_speed) {
    int current_velocity = flywheel_motor.get_actual_velocity(); // get current rpm
    
    if(current_velocity < target_speed - threshold) { // if the flywheel is much too slow
        flywheel_motor.move_voltage(12000); // move at max power
    } else if(current_velocity > target_speed + threshold) { // if the flywheel is much too fast
        flywheel_motor.move_voltage(0); // move at 0 power
    }
}
```
{% endcode %}
{% endtab %}

{% tab title="VEXCode V5 Pro" %}
### _Example Bang Bang implementation in VEXCode V5 Pro_

{% code lineNumbers="true" %}
```cpp
vex::motor flywheel_motor(10); // flywheel in port 10
int threshold = 5;             // range to determine if we should use Bang Bang

void move_rpm(int target_speed) {
    int current_velocity = flywheel_motor.velocity(velocityUnits::rpm); // get current rpm
    
    if(current_velocity < target_speed - threshold) { // if the flywheel is much too slow
        flywheel_motor.spin(directionType::left, 12000, voltageUnits::mV);
    } else if(current_velocity > target_speed + threshold) { // if the flywheel is much too fast
        flywheel_motor.spin(directionType::left, 0, voltageUnits::);  
    }
}
```
{% endcode %}
{% endtab %}
{% endtabs %}

#### Implementation of Feedforward control for Flywheels

Once our Bang Bang controller gets us near the desired speed, we need to be able to maintain that speed. Remember, we don't want to use the built-in motor velocity movement commands, as that will cause the Motor's built-in PID to kick in (and stacking multiple controllers is not a good thing in this case). We are going to need to find a way to convert an input rpm into an output voltage. That is where feedforward control comes in.&#x20;

Feedforward is, put simply, an approximation to convert an input into an output with no sensor information. In this case, our input is the target rpm, and the output is the voltage we send to the motor. We can get an approximate value for this conversion by dividing the max voltage (12000 mV) by the motor's maximum rpm (200), resulting in an approximate constant of 60. This will vary from motor to motor, so it is recommended to output your motor's rpm at max voltage so you can get the best constant for your motor.

{% tabs %}
{% tab title="PROS" %}
### _Example Feedforward implementation in PROS_

<pre class="language-cpp" data-line-numbers><code class="lang-cpp"><strong>pros::Motor flywheel_motor(10); // flywheel in port 10
</strong>float kF = 60;                  //conversion constant from rpm to voltage.
void move_rpm(int target_speed) {
    int output_voltage = target_speed * kF; // convert our rpm to voltage
    flywheel_motor.move_voltage(output_voltage);
}
</code></pre>
{% endtab %}

{% tab title="VEXCode V5 Pro" %}
### _Example Feedforward implementation in VEXCode V5 Pro_

{% code lineNumbers="true" %}
```cpp
vex::motor flywheel_motor(10); // flywheel in port 10
float kF = 60;                 //conversion constant from rpm to voltage.
void move_rpm(int target_speed) {
    int output_voltage = target_speed * kF; // convert our rpm to voltage
    flywheel_motor.spin(directionType::left, output_voltage, voltageUnits::mV);
}
```
{% endcode %}
{% endtab %}
{% endtabs %}

#### Implementation of PID control for Flywheels

With the Bang Bang and feedforward control, our flywheel is nearly perfect. However, there is a slight problem. The conversion from RPM to voltage is dependent on a long list of factors, including but not limited to friction and temperature. That is where we can leverage PID control to correct the error that feedforward has. In this use, we really only need the Proportional (P) component to get great results. Let's go ahead and combine all 3 controllers into a single function.

{% tabs %}
{% tab title="PROS" %}
### _Example Bang Bang + Feedforward + P control implementation in PROS_

{% code lineNumbers="true" %}
```cpp
pros::Motor flywheel_motor(10); // flywheel in port 10
int threshold = 5;              // range to determine if we should use Bang Bang
float kF = 60;                  // conversion constant from rpm to voltage.
float kP = 1;                   // how much of an impact the proportion will have on output
void move_rpm(int target_speed) {
    float current_velocity = flywheel_motor.get_actual_velocity(); // get current rpm
    
    if(current_velocity < target_speed - threshold) { // if the flywheel is much too slow
        flywheel_motor.move_voltage(12000); // move at max power
    } else if(current_velocity > target_speed + threshold) { // if the flywheel is much too fast
        flywheel_motor.move_voltage(0); // move at 0 power
    } else {
        float p_component = (target_speed - current_velocity) * kP;
        float f_component = target_speed * kF;
        flywheel_motor.move_voltage(p_component + f_component);
    }
}
```
{% endcode %}
{% endtab %}

{% tab title="VEXCode V5 Pro" %}
### _Example Bang Bang + Feedforward + P control implementation in VEXCode V5 Pro_

{% code lineNumbers="true" %}
```cpp
vex::motor flywheel_motor(10); // flywheel in port 10
float kF = 60;                 //conversion constant from rpm to voltage.
void move_rpm(int target_speed) {
    float output_voltage = target_speed * kF; // convert our rpm to voltage
    flywheel_motor.spin(directionType::left, output_voltage, voltageUnits::mV);
}
```
{% endcode %}
{% endtab %}
{% endtabs %}
