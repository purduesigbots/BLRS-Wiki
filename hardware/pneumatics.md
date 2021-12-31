---
description: Frankly this is just a lot of hot air...
---

# Pneumatics

## Introduction

Pneumatics are a system of components that use compressed air to create motion. In most cases, this is linear motion from cylinders (sometimes called pistons) but this motion can be used in many different ways. In your life, think about pumps for athletic balls, nail guns, and shocks on bikes. There are 3 subsystems to pneumatics in Vex. There is Air Storage, Air Control, and Pneumatic Cylinders.&#x20;

![Pneumatic Components](<../.gitbook/assets/Screen Shot 2021-12-30 at 9.22.03 PM.png>)

&#x20;      Air Storage is where the pressurized air is held in a robot. For Vex, this is done in aluminum reservoirs. In most seasons, a team can have 2 of these on their robots and they are pressurized to a maximum of 100 psi (pounds per square inch). The 2 main considerations in storage are the volume and the pressure of the air. The volume changes how many times that you can fire the cylinders and the pressure changes how strongly the cylinders fire.&#x20;

&#x20;       Air Control defines when and how actions are taken with pneumatics such as cylinders. In pneumatics, this is done with either flow switches or solenoids. A Finger Valve is a manual 'on and off' switch for cylinders and pneumatics. Most of the time in Vex though, this is used for refilling reservoirs or testing simple systems. Much more commonly, solenoids are used as they plug into the V5 brain and control the flow of air through the system. This is the main way that you will interact with pneumatics on your robot through programming (see Pros guide for more). The pressure regulator is used to control the pressure released from the reservoir to the solenoids. Placed near the reservoir in the system, the pressure can be increased or decreased as needed.&#x20;

&#x20;      Pneumatic cylinders are the third subsystem of pneumatics and are where the motion comes from. In Vex, there are both single, and double-acting pistons. Single-acting pistons are powered outwards and then are released with no force in the other direction. Double-acting pistons on the other hand are powered in both directions with the same amount of force. The two do have different types of solenoids though.&#x20;

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



![Example system (from Vex Pneumatics Product Page)](<../.gitbook/assets/Screen Shot 2021-12-30 at 5.02.45 PM.png>)

Above is an ideal system. At the bottom of the reservoir is the bike pump fitting to refill and pressurize the reservoir. The top is the valve for tubing where a pressure regulator could also be installed. Following the tubing is a T-fitting which is used to move air around the system and robot. Following the fitting are the solenoids (with 2 more valves on each) and the drivers (the wires extending out) followed finally by the solenoids. &#x20;

## Best Practices&#x20;

When using pneumatics, there are many things to keep in mind for optimal performance. These range from the design process to actually in operation.

### Design

* Leave spacing for Solenoids.
  * The solenoids which control the pistons are small, but make sure that you leave ample space around the connectors for tubing so the connectors fit well.
* Do not design tight corners for Tubing.
  * There is a high risk that your connections will be ripped out if you run the tubing around sharp corners, tubing and solenoids can both get damaged. There is also a chance that the tubes could be kinked and stop or limit airflow
* Consider weight distribution of Reservoirs
  * The reservoirs may be aluminum but are still fairly large and heavy. It is beneficial to keep these low and centered on your robot. It is also important to keep room for these components as they do take up a lot of space.

### Construction

During robot construction, there are not many helpful tips, but these should always be followed.

* Always overuse Tubing.
  * There is never a downside to using too much pneumatic tubing. Using too little can lead to connections being damaged and tubes being stretched. Having slack in tubing lines is important to ensure consistent operation.
* Know your pivot points.
  * The majority of applications for pneumatics have linear motion being converted to some rotational motion. Make sure to solidify whichever point you have that pivots.
* Distribute the Loads.
  * Be certain to even out the force on each side of the pneumatic cylinder. If only one side is loaded, there is a high chance the pneumatics will not function as intended.&#x20;
* Never work on pressurized pneumatics.
  * For safety, never work on pneumatics that has pressure, use the regulator and flow switch to depressurize or isolate workable components before doing any maintenance.&#x20;
* Use Teflon tape.
  * Teflon tape is used to seal anywhere that there is a thread in the system. For all valves, Teflon tape helps to reduce the risk of leaks. If your system has leaks, the best place to look is at valves.

### Operation

For ideal operation, follow these tips.

* Optimize the airflow into Tanks.
  * The pneumatics kits come with a regulator. Experiment with the amount of airflow through the regulator so that your pneumatics have just enough force to complete your intended action. This will mean the cylinders can actuate more times per full pressurization.&#x20;
*   Pressurize tanks at every opportunity.

    * The legal pressure is set at 100psi, which is quite low for most applications. Due to this, the constant re-pressurization of tanks must be a priority.



### Programming

To program pneumatics, they act as a generalized digital output that can be controlled with whatever ADI API is provided on your respective programming languages. Learn more [here](https://pros.cs.purdue.edu/v5/tutorials/topical/adi.html?highlight=pneumatics#pneumatics)

## Contributors to this Article

* MTBR (Michigan Task-Based Robotics)
* Max Johnson (BLRS)

####
