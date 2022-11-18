Live Streaming
For this article, we will be discussing live streaming through OBS. OBS will allow streaming to most major platforms with all of the same setups. It is assumed that a general understanding of OBS is had, and the basics can be found here:

{% embed url="https://www.youtube.com/watch?t=1041s&v=EuSUPpoi0Vs" %}

Ensure that your venue's network will both allow you to stream and has sufficent bandwidth to ensure a low latency stream. Most school networks are acceptable, but check your stream host's documentation for precise network bandwidth requirements.

Cameras
Unlike traditioanl web livestreams, robotics event livestreams have multiple cameras, each of which are dozens of feet from each other. Typically, an event partner will place at least one camera at each field, and a wider event/awards camera. There are several approaches to connecting these cameras to your livestream computer.

HDMI Cameras
Many cameras will offer an HDMI out signal, which can be an efficient way to achieve a low latency stream. Before purchasing, ensure that the cameras you will be using have a clean HDMI out signal. Additionally, you will likely need to source several 50ft HDMI cords, which is the maximum length you can reasonably get without signal degredation or the need for active extension.

Reccomended Setup: GoPro (Used by Team BCUZ)
GoPros provide a great option for livestreaming robotics events, due to their cost and wide field of view. If you purchase GoPros, try to purchase a Hero 8 or newer. In this version, the USB C port can be directly connected to a computer and be used as a web camera, which can provide you flexibility for additional cameras. In most cases, older models are acceptable.

You will connect the micro-HDMI port to an external switcher or capture card. For most competition purposes, the Blackmagic ATEM Mini is an acceptable option. The ATEM Mini Pro is a slightly more expensive alternative, but would allow you to stream directly from the switcher without a dedicated streaming computer.

You will need to modify your GoPros to ensure they don't overheat during a long competition day. You will be able to identify overheating cameras by

Remove the battery and leave the battery compartment open
Disable H.264. In Video Compression, Select HVEC. The older encoding is not needed for our purposes and only increases temperatures
Disable Wifi Configuration
Set video mode to 1080p60
Set field of view to the widest setting
Disable video stabilization
If your venue is particularly warm, you may also need to invest in heat sinks to ensure that the cameras are properly cooled. Some Event Partners have found success in repurposing Raspberry Pi heatsinks. You will likely want to target the area of your GoPro directly below the sensor, but experimentation with your particular model is warranted.

Networked Cameras
Another approach is to use a PoE network camera, which are commonly produced as security cameras. This approach is significantly more flexible than HDMI cameras, but careful considerations must be made to ensure you have access to a low-latency stream from the cameras.

Reccomended Setup: Amcrest PoE Camera (Used by Nathan Nolte)
Camera: https://amcrest.com/amcrest-1080p-poe-video-security-ip-camera-pt.html

To obtain a low-latency stream from the cameras, we will use a tool known as OBS-gstreamer: https://obsproject.com/forum/resources/obs-gstreamer.696/ https://gstreamer.freedesktop.org/download/

Here are some troubleshooting tips:

Once everything is installed, you may still not get the GStreamer Source to show up in OBS if Windows isn't finding the GStreamer framework. This may be caused by the framework not being in the Windows PATH environment variable. The fix I found was launching OBS with a batch file that mounts GStreamer to PATH when run. The steps for this fix are as follows:

Create a new file called start_obs.bat. Make sure that the file extension is .bat.
Add the following code to the file: 

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

Save the file.
You may need play around with the format of the RTSP stream for a while before it works. Try this syntax uridecodebin uri=rtsp://admin:password@192.168.1.200 ! queue ! video.

All the checkboxes are cleared in the GStreamer source properties except for the very last one (Clear image data after end-of-stream error)

Audio
Audio is one of the most important aspects of your stream, and distinguishes a functional stream from an excellent one. You will likely need to purchase an USB Audio Interface to connect your venue's microphones to the livestream. To minimize copyright strikes on your streams, be sure to only capture your Emcee's microphones and Tournament Manager Audio, and exclude any music you may be playing in the venue. It is best practice to mix in your own stream-friendly music through OBS. It is also possible to pipe Tournament Manager Audio into OBS instead of capturing it from your venue's audio mixer.

TM Source
Below is a recommended plugin for OBS (Win 64) in order to automate much of the work for linking TM and OBS. This is a third-party plugin and is not officially supported by RECF or Vex however it was designed by an employee of the company that designed TM and is one of the best community products to link the two platforms.

{% embed url="https://gitlab.com/dwabtech/vextm-obs-source/uploads/2158a7bcbdcebc7256f89d70f6853aeb/vextm-source.zip" %} OBS plugin by Dave Flowerday {% endembed %}

It is recommended to follow the installation and setup instructions given by Mr. Flowerday.

TM Switcher
Below is a reccomended tool that can be used to automate many of the aspects of a robotics livestream, including field switching, showing saved match scores, and automatically recording matches.

{% embed url="https://github.com/MayorMonty/tm-obs-switcher" %}
