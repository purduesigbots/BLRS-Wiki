---
description: The Vision Sensor tells you where colored objects are located.
---

# Vision Sensor

![](<../../../.gitbook/assets/visionsensor (1).png>)

## Features

At its most basic mode, the <img src="../../../.gitbook/assets/visionsensor_icon (1).png" alt="" data-size="line"> Vision Sensor tells you where a colored object is located. The location's X value represents the right and left position. When the camera is tilted down, the Y value represents the distance to the object, with some basic trigonometry necessary.

The Vision Sensor combines a dual ARM Cortex M4+M0 processor, color camera, WiFi, and USB into a single sensor. The sensor can be trained to locate objects by color. Every 200 milliseconds, the camera provides a list of the object found matching up to eight unique colors. The object’s height, width, and location is provided. Multi-colored objects can also be programmed, allowing color codes to provide new information to the robot. Color-codes can represent anything, including location, object type, street signs, movement instructions, robot identifiers, etc. The Vision Sensor has USB for a direct connection to your computer. The Vision Sensor also has WiFi Direct and acts like a web server. This allows you to wirelessly view “live” video from any computer equipped with a browser and WiFi.

## Specifications

| **V5 Vision Sensor** |                                                             |
| -------------------- | ----------------------------------------------------------- |
| Vision Framerate     | 50 Frames per second                                        |
| Color Signatures     | 7 independent colors                                        |
| Color Codes          | 2 3 or 4 color signatures per color code                    |
| Image Size           | 640 x 400 pixels                                            |
| Microcontroller      | Dual ARM Cortex M4 and M0                                   |
| Connectivity         | V5 Smart Port IQ Smart Port USB Micro                       |
| Wireless             | 2.4 GHz 802.11 Wi-Fi Direct hotspot with built in webserver |
| Compatibility        | Any device with WiFi and a Browser                          |
| Weight               | 0.77lbs (350g)                                              |

## Vision Utility

![The Vision Utility recognizing a red gear's color signature, creating a white rectangular overlay to show object recognition.](<../../../.gitbook/assets/image (13) (2).png>)

The Vision Utility is the primary tool used to calibrate the Vision Sensor such that it will be able to locate objects of a particular color. The user-calibrated color that the Vision Sensor tries to locate is known as a "signature". The Vision Sensor can store seven signatures total. To use the Vision Utility, the Vision Sensor must be plugged into a computer via a mini-USB cable. Then, after opening the Vision Utility, the sensor's camera should become active, and should relay the video feed to the Vision Utility window.

To generate a color signature, freeze the on-screen image. Then, hold down the left mouse button to create a rectangular area to cover. The area covered will represent the color signature. After releasing the left mouse button, the area will be set. From there, the "set" button can be pressed on the right of the window for any of the seven signatures. This will generate a signature in the given signature slot. These steps can be repeated to generate as many color signatures as possible.

<img src="../../../.gitbook/assets/image (28) (1).png" alt="" data-size="line"> Pressing the blue copy button on the bottom right of the window will copy all of the signatures in [VEXcode](../../../software/vex-programming-software/vex-coding-studio-vcs.md) syntax. This means that the signatures will be competition-ready as soon as it is pasted into VEXcode. In terms of [PROS](../../../software/vex-programming-software/pros/), the VEXcode syntax copied from the Vision Utility will not function on its own, but the signatures can be properly generated using the "[signature\_from_\__utility](https://pros.cs.purdue.edu/v5/api/cpp/vision.html#signature-from-utility)" method.

### Teams Contributed to this Article:

* [BLRS](https://purduesigbots.com/) (Purdue SIGBots)
* [904U](https://www.youtube.com/channel/UCKvtsL9hJ\_x7bqrpl3nJ3Gg/) (B.E.S.T.I.E. Robotics)
