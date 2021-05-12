# Object Recognition

**Object recognition** is the process of using a camera \(typically an inexpensive web cam as shown in [External Sensors](../../vex-electronics/vex-sensors/)\) to detect objects of interest. This is essential for adapting autonomous code to a changing environment; object recognition is a useful step for dynamic autonomous modes. At close range, [Red/Green Buoy](red-green-buoy.md) or other passive homing methods using range finders can be used, once the type of object can be determined.

The video on the right shows a first-generation object recognition system on Honey Badger running on a [Pandaboard](../../electronics/general/external-boards/pandaboard.md) using [Opencv](opencv.md).

## Methods

Objects can be selected from the image with a variety of methods:

* **Blob detection** looks for connected regions of pixels matching a predefined color model, which differentiates objects based on their color. While fast and easy to understand, this method is vulnerable to lighting changes.
* **Shape detection** looks for known shapes of similar appearance in the image. While more resistant to lighting or color balance changes, this method is generally too slow to be useful on a robot.
* **Depth detection** requires a 3-D camera like the Microsoft Kinect and looks for edges in the image to determine where objects are located.

## Using OpenCV

_Main article:_ [_OpenCV_](opencv.md)

[OpenCV](opencv.md) is the open-source library most commonly used for object recognition. OpenCV has good cross-platform ways to acquire images from the webcam, but its image processing algorithms are poorly optimized for embedded processors like ARM. The [Pandaboard](../../electronics/general/external-boards/pandaboard.md) can achieve an acceptable frame rate of about 15 FPS with basic blob detection, and the [Beagleboard](../../electronics/general/external-boards/beagleboard.md) can manage 8-10.

## Using AMS

_Main article:_ [_AMS_](ams.md)

**AMS** is a fast algorithm optimized for the fastest possible processing of simple color blob detection. It can achieve frame rates of over 30 FPS on embedded platforms suitable for VEX use. With the arrival of the [ODROID-XU](../../electronics/general/external-boards/odroid-xu.md), it is possible that even OpenCV could work well, but AMS is still used due to its reliable track record until a worthy successor can be designed.

## Using OpenNI

_Main article:_ [_OpenNI_](openni.md)

With the use of the Kinect, the **OpenNI** library has shown great promise to read and process the depth channel from the device. The addition of the depth turns the color image into a colored point cloud. However, none of the edge detection algorithms in OpenNI proved worthy of finding objects in the VEX environment. Continued work revolves around profitably using this information to determine the distance to a target.

### Teams Contributed to this Article:

* [BLRS](https://purduesigbots.com/) \(Purdue SIGBots\)

