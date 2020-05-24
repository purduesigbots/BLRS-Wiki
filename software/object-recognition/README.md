# Object Recognition

**Object recognition** is the process of using a camera \(typically an inexpensive web cam as shown in [External Sensors](https://phabricator.purduesigbots.com/w/ee/external_sensors/)\) to detect objects of interest. Essential for adapting [autonomous code](https://phabricator.purduesigbots.com/w/autonomous_code/) to a changing environment, object recognition is a useful step for dynamic autonomous modes. At close range, [Red/Green Buoy](https://phabricator.purduesigbots.com/w/red_green_buoy/) or other passive homing methods using range finders can be used, once the type of object can be determined.

The video on the right shows a first-generation object recognition system on [Honey Badger](https://phabricator.purduesigbots.com/w/eng/gateway_honey_badger/) running on a [Pandaboard](https://phabricator.purduesigbots.com/w/ee/pandaboard/) using [Opencv](https://phabricator.purduesigbots.com/w/cs/opencv/).

## Methods

Objects can be selected from the image with a variety of methods:

* **Blob detection** looks for connected regions of pixels matching a predefined color model, which differentiates objects based on their color. While fast and easy to understand, this method is vulnerable to lighting changes.
* **Shape detection** looks for known shapes of similar appearance in the image. While more resistant to lighting or color balance changes, this method is generally too slow to be useful on a robot.
* **Depth detection** requires a 3-D camera like the Microsoft [Kinect](https://phabricator.purduesigbots.com/w/ee/kinect/) and looks for edges in the image to determine where objects are located.

## Using OpenCV

_Main article:_ [_OpenCV_](https://phabricator.purduesigbots.com/w/opencv/)

[OpenCV](https://phabricator.purduesigbots.com/w/opencv/) is the open-source library most commonly used for object recognition. OpenCV has good cross-platform ways to acquire images from the webcam, but its image processing algorithms are poorly optimized for embedded processors like ARM. The [Pandaboard](https://phabricator.purduesigbots.com/w/ee/pandaboard/) can achieve an acceptable frame rate of about 15 FPS with basic blob detection, and the [Beagleboard](https://phabricator.purduesigbots.com/w/ee/beagleboard/) can manage 8-10.

## Using AMS

_Main article:_ [_AMS_](https://phabricator.purduesigbots.com/w/ams/)

**AMS** is a fast algorithm optimized for the fastest possible processing of simple color blob detection. It can achieve frame rates of over 30 FPS on embedded platforms suitable for VEX use. With the arrival of the [ODROID-XU](https://phabricator.purduesigbots.com/w/ee/odroid/), it is possible that even OpenCV could work well, but AMS is still used due to its reliable track record until a worthy successor can be designed.

## Using OpenNI

_Main article:_ [_OpenNI_](https://phabricator.purduesigbots.com/w/openni/)

With the use of the Kinect, the **OpenNI** library has shown great promise to read and process the depth channel from the device. The addition of the depth turns the color image into a colored point cloud. However, none of the edge detection algorithms in OpenNI proved worthy of finding objects in the VEX environment. Continued work revolves around profitably using this information to determine the distance to a target.

