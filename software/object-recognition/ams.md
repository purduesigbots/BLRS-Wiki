# AMS

## At Maximum Speed \(AMS\) Algorithm

The **At Maximum Speed**, or **AMS** algorithm \(previously known as the **Approximate Mark-and-Sweep** Algorithm\), is a SIGBOTS-developed [object recognition](/w/object_recognition/) algorithm based on blob detection. Specifically optimized for performance on embedded platforms, the algorithm can outperform the industry-standard [OpenCV](/w/opencv/) framework by up to a factor of five continuously and up to seven in bursts. The algorithm achieves such a boost by sacrificing complete accuracy for a usable approximation that is easy to pipeline, making the algorithm scale well to multi-threaded or multi-core applications.

### Principles of Operation \(Original AMSv2\)

Blob detection is essentially a flood fill algorithm on an image, with pixels matching a desired color acting as seeds which are merged together into contiguous shapes in the image. Many image processing frameworks take the most obvious solution, starting at a particular pixel and moving outwards incrementally, using a stack to track past locations and checking each location to see if it should be added to the current blob.

While this approach works, it generally is not well optimized. Enter AMS. It is specifically designed to take advantage of the CPU cache of modern processors by optimizing locality of reference. Instead of moving outwards or along a sinuous path, the algorithm makes a small, finite number of passes through the image, always moving from the top left to the bottom right across each row and down. Therefore, the next cell address is known well in advance, and each value can be fetched from system RAM to be available in a register before it is needed, greatly improving performance.

In addition, AMS breaks up the steps required by performing the algorithm in three stages. In the _label_ stage, the array is passed through once, and any pixels matching the pattern are assigned a monotonically increasing positive integer in the order in which they are processed. Invalid pixels are set to the largest representable int value \(effectively infinity\). Several _mark_ passes follow, in which each non-infinite cell is set to the minimum of the surrounding values. This is a deterministic and simple operation that a CPU can perform without an expensive branch or main memory lookup, and it conveniently floods the smallest number in a blob to all of the pixels composing it. The final phase, the _sweep_, builds bounding boxes around areas of the same number using a statically allocated hash table in order to return a usable representation of the blob to the user. Each stage need not run concurrently or on the same image, allowing incomplete images to be passed down a three-deep pipeline of threads or cores to run steps in parallel on different images.

Efficiency comes at a cost. Some unusual blob topographies, particularly large concave or twisting areas, may cause one larger blob to appear as two or more. A simple merge algorithm can fix many of these cases. In addition, the algorithm must be run again if two colors must be detected at once, halving the effective processing rate.

### Upgrades to AMSv3

The third revision to AMS retains many of the features of revision two, but increases performance yet more by avoiding the _load-hit-store_ stalls which plagued the old version \(for more information, see [Debugging](../debugging.md)\). Previously, the surrounding pixels were referenced using array indexing on a "leading" and "trailing" pointer, but the compiler had to load the eight surrounding values from pointers each loop, and store the middle one each loop. One "load" on subsequent loops would hit the "store" from the last loop, stalling the CPU until the value makes a round trip to the cache.

To fix the situation, six additional local variables were used to hold the shared values between the previous computation and the next. Therefore, per computation, only three values are loaded from memory and one value stored. The store will not block any future instructions, since nobody will have to load from that location again until the next pass. While the performance impact of this change is still unknown, estimations by the author might suggest a 2-3x performance increase on ARM load-store in-order platforms but a lesser increase on the out-of-order x86 with store forwarding.

### Getting Real-Time

AMSv3 was sufficiently fast on the desired development platforms that the main bottlenecks to real-time image processing became the underlying libraries. OpenCV's image capture negotiates uncompressed video by default for best quality, under the assumption that the USB controller can maintain at least high-speed \(12 Mbps\) video. However, the USB controllers on ARM boards such as the [Beagleboard](../../electronics/general/external-boards/beagleboard.md) and [Pandaboard](../../electronics/general/external-boards/pandaboard.md) have trouble dealing with this much data and stall out at around 10 FPS. Writing a custom video4linux driver to negotiate compressed Motion JPEG file transfer instead reduced USB data consumption by a factor of ten or more to alleviate this bottleneck.

However, the OpenCV JPEG decoder then got in the way, limiting framerate to about 18 FPS. A quick fix to stop OpenCV from using a temporary file gained slightly to 20 FPS. But swapping OpenCV out entirely for a direct call to an optimized JPEG library which uses the ARM's NEON floating point extensions provided the final push needed to hit full real-time image processing. At a full 640x480 pixels and with a typical dynamic image, the multithreaded algorithm pushed **28 FPS** end-to-end with negligible lag.

Moral of the story: Writing a good algorithm is half the battle. The other half of performance is obsessive optimization in the quest for the impossible.

## Future Work

It is still yet possible to improve AMS performance, possibly by a factor of over ten times. Most desirable blobs have been found to form fairly convex shapes with properly tuned color models. Since very small or wavy blobs will fail post-processing checks, one possible improvement would be to scale the source image down by a factor of 8 or 16, so that the algorithm would run on a 40x30 image instead of a 640x480 image. This would be hundreds of times faster, since the current AMS runtime depends on the number of image pixels.

Then, the resulting blobs would be scaled back up using a nearest-neighbor approach to full size, and the edges of blobs analyzed to fine tune the area, bounds, and confidence. While this would be expensive, it would only run on the perimeter of found blobs in the small image, avoiding falsely examining most types of image noise that might match the color model. No work has been done to estimate the overall impact on run time, but the acquisition of the [ODROID-XU](../../electronics/general/external-boards/odroid-xu.md) may make further AMS advancements unnecessary.

#### Teams Contributed to this Article:

* [BLRS](https://purduesigbots.com/) \(Purdue SIGBots\)

