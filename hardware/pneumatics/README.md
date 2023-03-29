---
description: Frankly this is just a lot of hot air...
---

# Pneumatics

## Introduction

Pneumatics are a system of components that use compressed air to create motion. In most cases, this is linear motion from cylinders (sometimes called pistons) but this motion can be used in many different ways. In your life, think about pumps for athletic balls, nail guns, and shocks on bikes. There are 3 subsystems to pneumatics in Vex. There is Air Storage, Air Control, and Pneumatic Cylinders.&#x20;

![Pneumatic Components](<../../.gitbook/assets/Screen Shot 2021-12-30 at 9.22.03 PM.png>)

&#x20;      Air Storage is where the pressurized air is held in a robot. For Vex, this is done in aluminum reservoirs. In most seasons, a team can have 2 of these on their robots and they are pressurized to a maximum of 100 psi (Pounds per Square Inch). The 2 main considerations in storage are the volume and the pressure of the air. The volume changes how many times that you can fire the cylinders and the pressure changes how strongly the cylinders fire.&#x20;

&#x20;       Air Control defines when and how actions are taken with pneumatics such as cylinders. In pneumatics, this is done with either **Finger Valves** or **solenoids**. A **Finger Valve** is a manual 'on and off' switch for cylinders and pneumatics. **Solenoids** are used for actuation as they plug into the V5 brain and control the flow of air through the system (and can be programmed). This is the main way that teams will interact with pneumatics on the robot through programming (see Pros guide for more). The **Pressure Regulator** is used to control the pressure released from the reservoir to the solenoids. Placed near the reservoir in the system, the pressure can be increased or decreased as needed.&#x20;

&#x20;      Pneumatic cylinders are the third subsystem of pneumatics and are where the motion comes from. In Vex, there are both single, and double-acting cylinders. Single-acting cylinders are powered outwards and then released with no force in the other direction. Double-acting cylinders on the other hand are powered in both directions with the same amount of force. The two do have different types of solenoids though.&#x20;

## Components

Pneumatics consist of seven major components:

* **Tubing**
  * Physical carrier for the pressurized air.
* **Reservoir**
  * Storage for the pressurized air.
* **Pressure Regulators**
  * Valve to regulate the pressure of air in the system.
* **Finger Valve/Flow Switch**
  * Simple on/off switch for airflow.&#x20;
* **Solenoids**
  * Control components that turn electrical signals into commands for pressurizing the system. Connected to both V5 Brain(requires drivers) and Pneumatic tubing for control.
* **Cylinders**
  * Linearly actuating component
* **Reservoir Valve**
  * Used for attaching tubing to reservoir
* **Solenoid Valve**
  * Used for attaching tubing to solenoids
* **Cylinder Valve**
  *   **Used for attaching tubing to Cylinder**



![Example system (from Vex Pneumatics Product Page)](<../../.gitbook/assets/Screen Shot 2021-12-30 at 5.02.45 PM.png>)

Above is an ideal system. At the bottom of the reservoir is the bike pump fitting to refill and pressurize the reservoir. The top is the valve for tubing where a pressure regulator could also be installed. Following the tubing is a T-fitting which is used to move air around the system and robot. Following the fitting are the solenoids (with 2 more valves on each) and the drivers (the wires extending out) followed finally by the solenoids. &#x20;

### [GOATS Non Vex Pneumatics Order Form](https://docs.google.com/spreadsheets/d/1uFQrtXXt-2KHu97R7APeRfy40jK0fBnLomCY2GQYMAE/edit#gid=0)

{% embed url="https://docs.google.com/spreadsheets/d/1uFQrtXXt-2KHu97R7APeRfy40jK0fBnLomCY2GQYMAE/edit#gid=0" %}
Andrew-GOATS/977Z
{% endembed %}

### Programming

To program pneumatics, they act as a generalized digital output that can be controlled with whatever ADI API is provided on your respective programming languages. Learn more [here](https://pros.cs.purdue.edu/v5/tutorials/topical/adi.html?highlight=pneumatics#pneumatics)

## Contributors to this Article

* MTBR (Michigan Task-Based Robotics)
* Max Johnson (BLRS)
* Andrew (GOATS/977Z)

####
