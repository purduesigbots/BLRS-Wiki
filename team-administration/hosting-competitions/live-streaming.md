# Live Streaming

For this article, we will be discussing live streaming through OBS. OBS will allow streaming to most major platforms with all of the same setups. It is assumed that a general understanding of OBS is had, and the basics can be found here:

{% embed url="https://www.youtube.com/watch?t=1041s&v=EuSUPpoi0Vs" %}

Ensure that the venue's network will both allow the ability to stream and has sufficient bandwidth to ensure a low latency stream. Most school networks are acceptable, but check the stream host's documentation for precise network bandwidth requirements.

## Cameras

Unlike traditional web live streams, robotics event live streams have multiple cameras, each of which are dozens of feet from each other. Typically, an event partner will place at least one camera at each field, and a wider event/awards camera. There are several approaches to connecting these cameras to the live stream computer.

### HDMI Cameras

Many cameras will offer an HDMI out signal, which can be an efficient way to achieve a low-latency stream. Before purchasing, ensure that the cameras that will be used have a clean HDMI out signal. Additionally,  several 50ft HDMI cords may be needed, which is the maximum length that can be reasonably gotten without signal degradation or the need for an active extension.

#### Recommended Setup: GoPro (Used by Brendan McGuire)

GoPros provide a great option for live streaming robotics events, due to their cost and wide field of view. If GoPros are purchased, try to purchase a Hero 8 or newer. In this version, the USB C port can be directly connected to a computer and be used as a web camera, which can provide flexibility for additional cameras. In most cases, older models are acceptable.

Connect the micro-HDMI port to an external switcher or capture card. For most competition purposes, the Blackmagic ATEM Mini is an acceptable option. The ATEM Mini Pro is a slightly more expensive alternative but would allow streaming directly from the switcher without a dedicated streaming computer.

The GoPros may need to be modified to ensure they don't overheat during a long competition day. Overheating cameras can be identified by intermittent black outs of video output. 

* Remove the battery and leave the battery compartment open
* Disable H.264. In Video Compression, Select HVEC. The older encoding is not needed for our purposes and only increases temperatures
* Disable Wifi Configuration
* Set video mode to 1080p60
* Set field of view to the widest setting
* Disable video stabilization
* Utilize compressed air to cool camera

_If the venue is particularly warm, invest in heat sinks to ensure that the cameras are properly cooled. Some Event Partners have found success in repurposing Raspberry Pi heatsinks. Target the area of the GoPro directly below the sensor, but experimentation with each particular model is warranted._

### Networked Cameras

Another approach is to use a PoE network camera, which are commonly produced as security cameras. This approach is significantly more flexible than HDMI cameras, but careful considerations must be made to ensure access to a low-latency stream from the cameras.

#### Recommended Setup: Amcrest PoE Camera (Used by Nathan Nolte)

Camera: [https://amcrest.com/amcrest-1080p-poe-video-security-ip-camera-pt.html](https://amcrest.com/amcrest-1080p-poe-video-security-ip-camera-pt.html)

To obtain a low-latency stream from the cameras, we will use a tool known as OBS-gstreamer: [https://obsproject.com/forum/resources/obs-gstreamer.696/](https://obsproject.com/forum/resources/obs-gstreamer.696/)&#x20;

[https://gstreamer.freedesktop.org/download/](https://obsproject.com/forum/resources/obs-gstreamer.696/)

Here are some troubleshooting tips:

Once everything is installed, it may still not get the GStreamer Source to show up in OBS if Windows isn't finding the GStreamer framework. This may be caused by the framework not being in the Windows PATH environment variable. The fix I found was launching OBS with a batch file that mounts GStreamer to PATH when run. The steps for this fix are as follows:

Create a new file called start\_obs.bat. Make sure that the file extension is .bat. Add the following code to the file:

```
cd /D "%~dp0"
cd gstreamer
SET GSTREAMER_1_0_ROOT_MINGW_X86_64=%cd%
cd bin
SET PATH=%cd%
SET GST_PLUGIN_PATH=%cd%
cd..
cd..
cd bin
cd 64bit
start obs64.exe
```

Save the file. and play around with the format of the RTSP stream for a while before it works. Try this syntax `uridecodebin uri=rtsp://admin:password@192.168.1.200 ! queue ! video`.

All the checkboxes are cleared in the GStreamer source properties except for the very last one (Clear image data after end-of-stream error)

_Note: thanks so much to Nathan Nolte for his advice with this setup!_

### USB Webcams

USB webcams are often times cheap, and readily available. There are some limits to a USB webcam though. First, most PC/Mac USB ports can only use one webcam, or two with a hub. Because of this, streams with multiple fields, or multiple angles, may need to add additional hardware. Second, USB cables can usually only span about 20'-30' without additional hardware.

#### Recommended Setup: Anker C200 (used by Purdue SIGBots)

Camera: [https://www.amazon.com/dp/B09MFMTMPD?psc=1\&ref=ppx\_yo2ov\_dt\_b\_product\_details](https://www.amazon.com/dp/B09MFMTMPD?psc=1\&ref=ppx\_yo2ov\_dt\_b\_product\_details)

USB Extension Cable: [https://www.amazon.com/dp/B07GCHXPDW?psc=1\&ref=ppx\_yo2ov\_dt\_b\_product\_details](https://www.amazon.com/dp/B07GCHXPDW?psc=1\&ref=ppx\_yo2ov\_dt\_b\_product\_details)

USB-Ethernet Hub: [https://www.amazon.com/dp/B09QPMBHDG?psc=1\&ref=ppx\_yo2ov\_dt\_b\_product\_details](https://www.amazon.com/dp/B09QPMBHDG?psc=1\&ref=ppx\_yo2ov\_dt\_b\_product\_details)

With this setup, 2 cameras connect via the extension cables to the ethernet hub that will allow both cameras into 1 usb port with an extension via cat5/cat6 ethernet up to 100'.&#x20;

This has been tested a few times in competition by SIGBots and has been the least problematic.&#x20;

## Audio

Audio is one of the most important aspects of the stream, and distinguishes a functional stream from an excellent one. Event Partners will likely need to purchase a USB Audio Interface to connect the venue's microphones to the live stream. To minimize copyright strikes on the streams, be sure to only capture the Emcee's microphones and Tournament Manager's Audio, and exclude any music that may be playing in the venue. It is best practice to mix in stream-friendly music through OBS. It is also possible to pipe Tournament Manager Audio into OBS instead of capturing it from the venue's audio mixer.

## TM Source

Below is a recommended plugin for OBS (Win 64) in order to automate much of the work for linking TM and OBS. This is a third-party plugin and is not officially supported by RECF or Vex however it was designed by an employee of the company that designed TM and is one of the best community products to link the two platforms.

{% embed url="https://gitlab.com/dwabtech/vextm-obs-source/uploads/2158a7bcbdcebc7256f89d70f6853aeb/vextm-source.zip" %}
OBS plugin by Dave Flowerday
{% endembed %}

It is recommended to follow the installation and setup instructions given by Mr. Flowerday.

## TM Switcher

Below is a recommended tool that can be used to automate many of the aspects of a robotics live stream, including field switching, showing saved match scores, and automatically recording matches.

{% embed url="https://github.com/MayorMonty/tm-obs-switcher" %}

**Some notes from SIGBots after use of the switcher:**

* Make sure TM is running on port 80. Port 8080 will not work. Often, there is a service called World Wide Web Publishing that takes port 80 and should be ended before starting TM.&#x20;
* The plugin in requires using at least OBS v28, which integrates a new WebSocket control system. 
* If you are using the switcher with an ATEM device, you will need to connect your switcher to the network, as switchers connected via USB cannot be remotely controlled. See [this](https://www.youtube.com/watch?v=L2dAqeVHPzM) guide on connecting your switcher to the network. Input the same address you would use to connect to the switcher via the ATEM Control Software.
* Make sure the latest [LTS version](https://nodejs.org) of NodeJS is installed if you are running the program from source. 
* Using the program via source is ideal and more consistent if you have NodeJS installed. 

### Contributing Teams to this Article:

* Brendan McGuire
