---
description: >-
  A nonlinear feedback controller for correcting robot position in the global coordinate system.
---

# RAMSETE Controller

## Prerequisites

- A basic understanding of matrix multiplication
- A basic understanding of trigonometry
- [Odometry](../odometry.md)

The RAMSETE controller is in a unique class of control algorithms, along with [Pure Pursuit](./basic-pure-pursuit.md), that are designed to be used with the 2D motion of mobile robots. Typical controllers like [PID](./pid-controller.md) operate in the local frame of the robot, controlling the robot's forward and backwards motion for example. The RAMSETE controller, on the other hand, controls the robot's global x, y, and heading position.

In order to control the robot's global position, we must first know the robot's current position and know the _desired_ global position of the robot.
We can find the robot's current position through [Odometry](../odometry.md). The desired global position for the robot can be a single `(x, y, theta)` point or a point along a computed path.

The first step with any control algorithm is determining the current error. We can easily compute robot's error in the global frame by subtracting the desired position from the current position.

$$
\begin{bmatrix}
x_{desired} - x_{actual}\\
y_{desired} - y_{actual}\\
\theta_{desired} - \theta_{actual}
\end{bmatrix}
$$

These error values don't give us much _actionable_ data to control the robot though. If the robot is facing the positive Y direction we can command the robot to drive forward to reduce the error in Y. If the robot is facing the positive X direction, though, commanding the robot to drive forward will reduce error in X this time and have no impact on the error in Y. We need to transform the error into a more useful form, the robot's local frame.

Applying the following transformation matrix to the global error vector gives us the robot's local error:

$$
\begin{equation*}
  \begin{bmatrix}
    error_x \\
    error_y \\
    error_\theta
  \end{bmatrix} =
  \begin{bmatrix}
    \cos\theta_{actual} & \sin\theta_{actual} & 0 \\
    -\sin\theta_{actual} & \cos\theta_{actual} & 0 \\
    0 & 0 & 1
  \end{bmatrix}
  \begin{bmatrix}
    x_{desired} - x_{actual} \\
    y_{desired} - y_{actual} \\
    \theta_{desired} - \theta_{actual}
  \end{bmatrix}
\end{equation*}
$$

Where X in the local frame is the forward/backward direction of the robot's drivetrain.

## Computing the Output Velocities

Now that we know the local error that the robot needs to correct for, we can calculate the angular and linear velocities to command the robot.

The first step is defining our controller's gain value. That gain comes from a few factors:

- $b$: Roughly a proportional term for the controller. Large values of $b$ will result in a more aggressive controller. Must be > 0.
- $\zeta$: Roughly a damping term (like the D term of a PID controller). Must be between 0 and 1.
- $v_d$: The desired linear velocity. This can come from a computed path or can be another tuning factor.
- $\omega_d$: The desired angular velocity. This can come from a computed path or can be another tuning factor.

These factors combine with the following equation to give us the controller's output:

$$
k = 2\zeta\sqrt{\omega_d^2 + bv_d^2}
$$

This gain value is applied to the desired linear velocity, angular velocity, and the local error to give us those velocity commands:

$$
v = v_d \cos{e_\theta} + k e_x\\
\omega = \omega_d + k e_\theta + \frac{b v_d \sin(e_\theta) e_y}{e_\theta}
$$

## Commanding the Robot

The output of the RAMSETE controller is a linear velocity and an angular velocity. These values need to be transformed to command a typical tank-drive robot.

The linear velocity can be converted to the robot's left and right wheel velocities using the following equation:

$$
linearMotorVelocity = linearVelocity / wheelCircumference
$$

The angular velocity can be converted to the robot's left and right wheel velocities using the following equation:

$$
angularMotorVelocity = angularVelocity * drivetrainRadius / wheelCircumference
$$

Since the positive $\theta$ direction is turning the robot to the right, we'll apply the the angularMotorVelocity to get the following left and right wheel velocities:

$$
left = linearMotorVelocity + angularMotorVelocity\\
right = linearMotorVelocity - angularMotorVelocity
$$
