# Gyroscope

[![](https://phabricator.purduesigbots.com/file/data/p7jm7bskc4bq23bdhvxn/PHID-FILE-w3fvfl5l6ijotesvazfz/vex_gyro.jpg)](https://phabricator.purduesigbots.com/file/data/p7jm7bskc4bq23bdhvxn/PHID-FILE-w3fvfl5l6ijotesvazfz/vex_gyro.jpg)

The **VEX Yaw-Rate Gyro**, or simply the **VEX Gyro**, is an analog [gyroscope](/w/wiki/ee/external_sensors/gyro/) which returns a voltage between 0 and +5 V approximately proportional to the **rate** of rotation around the vertical axis through the sensor. The full-scale range is about +/- 1000 degrees per second, a huge limit that compresses the full-scale range and reduces resolution. While acceptable for coarse positioning, use of a digital gyroscope leads to more precise readings.

The VEX Gyro is highly vulnerable to [Line Noise](/w/wiki/ee/line_noise/) and should be shielded or placed far from [motors](/w/wiki/ee/motor/). All gyroscopes must be placed at the robot's center of rotation for optimal results. Dynamic calibration is therefore a must before each run.

## Example code

The VEX Gyro is deprecated and should only be used for testing or educational purposes. See the [digital gyro page](/w/wiki/ee/external_sensors/) for better code with the current generation of gyros. Example code for [PROS](/w/wiki/cs/pros/):

```c
#include "main.h"

// The Analog port used for the gyro
#define GYRO_PORT 1
// This factor needs to be determined by experimentation depending on the gyro's mounting
#define FACTOR 1

// Store the current angle in degrees
volatile int angle = 0;

void gyroReset() {
    angle = 0;
}

void sensorPollLoop() {
    // Other sensors can be polled here, like ADCs
    clock_t now = millis();
    while (1) {
        // Convert rotation rate into rotation displacement by integrating
        // Per the documentation, "analogReadCalibratedHR" is excellent for integrated
        // sensors like a VEX gyro.
        angle += (analogReadCalibratedHR(GYRO_PORT) * FACTOR) >> 8;
        // Adjust this loop speed as appropriate to match other sensors, but remember to
        // rescale FACTOR if done after initial calibration
        taskDelayUntil(&now, 2UL);
    }
}

// Called when the robot is powered on
void initialize() {
    // Initialize the gyro
    analogCalibrate(GYRO_PORT);
    // Recommended method - integrate gyro into sensor poll task
    taskCreate(sensorPollLoop, TASK_DEFAULT_STACK_SIZE, NULL, TASK_PRIORITY_DEFAULT + 1, NULL);
}

// Autonomous code
void autonomous() {
    // Sample method to perform a simple gyro-based turn
    gyroReset();
    motorSet(6, 127);
    motorSet(5, -127);
    do {
        // Check gyro angle every 50 ms
        taskDelay(50);
    } while (angle < 90);
    // Stop
    motorSet(6, 0);
    motorSet(5, 0);
    // Wait forever to prevent exiting mode
    taskDelay(MAX_DELAY);
}
```

