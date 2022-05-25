# Kalman Filter

A Kalman Filter is a filtering algorithm that tries to estimate values based on measurements and pre-determined models. This can be applied in VEX Robotics to reduce noise in different sensor measurements, such as a noisy [ultrasonic rangefinder](../../vex-electronics/vex-sensors/3-pin-adi-sensors/ultrasonic.md) measurement or when averaging values obtained from multiple sensors.

Note: the code snippets in this article are written as python-like pseudocode. The snippets aren't written to be copied into your code directly.

## Concept

Let's consider a robot that is being commanded to drive forward at 100rpm (21 inches per sec with 4" wheels). We measure its position with encoders. We expect that the robot will be 21 inches from its previous measurement after a second. But our encoders measure 19.5 inches from the previous measurement. This could be from wheel slip or missed encoder ticks, or imperfect calculations of the wheel diameter. We can't say for sure that our calculated expectation of 21 inches was accurate either though; factors like wheel slip, friction, and dropping battery voltage could make this incorrect too. What is the true distance?

Intuitively, the true distance is some combination of our predicted distance and the measured distance. A reasonable guess would be that our true distance is between the prediction and measurement, like the average. The average would be a safe guess but is not _that_ much better of an estimate than we had before. We want a method for determining how reliable each of these values is -- should we trust our calculations or the encoder measurements more?

Adding additional sensors gives us additional data points to point to the true distance. Originally the value had to be between the expectation and encoder measurement, now it has to be between expectation, encoders, and ultrasonics, for instance. This additional constraint gives us a more accurate estimate _and_ additional confidence that our guess is correct.

A Kalman Filter's simpler, but less accurate cousin, the **G-H Filter**, uses a single gain value to represent our trust in our prediction compared to the measurements. Averaging the two could be represented as a gain of 0.5 -- the prediction and measurement each make up half of our guess. We can increase this gain if we think the measurements are more reliable than our calculated prediction, weighting the average toward our better input. The gain can similarly be decreased if we are working with bad sensors.

### Bayesian statistics

We can expand upon this idea by modeling our expected and measured values with **Bayesian Statistics**. With Bayesian statistics we create a "prior" that represents the possibility of each value for a variable. For our distance measurement, we would assign a probability to each possible distance measurement. 19.5 inches would get a high probability of 0.6, perhaps, but then 21 inches, since it is a decent bit larger than our measurement, would get a lower probability of 0.2 perhaps. As we discussed before, it's entirely possible that the true measurement was a number other than 19.5 inches, but it is more likely that the measurement is actually 19.5 inches instead of 17 or 21 inches. We can also pretty confidently say that a much smaller or larger distance, like 100 inches, has a probability of basically zero. All of this to say, each of our values can be modeled as **Gaussian**, or **Normal** distributions.

A Gaussian distribution is defined by two parameters, the _mean_ and the _variance_. The mean is easy to set for our example problem, the mean can be our expected value of 21 inches for the expected value's Gaussian or 19.5 inches for the measurement's Gaussian. The tough parameter to set is the variance. The variance represents the width of the Gaussian; a higher variance means that it's more likely that values further from the mean could be the "true" value. A lower variance would mean that we have high confidence that the mean is the "true" value; the other values further from the mean are unlikely. Some sensors will publish variance values for their measurements, but oftentimes this is a value that the filter designer will need to set and tweak themselves. This is particularly true for the variance of the expected value, which can only be tuned through trial and error.

### Kalman Gain

The **Kalman Gain** is the crux of the Kalman Filter. This gain replaces the constant `0.5` we had used when discussing the G-H filter before and determines how we should combine our measurement and expected values. We calculate a new Kalman Gain on each step of the filter to use the latest data in our calculation. The formula for the Kalman Gain is as follows:

$$
Kalman Gain (K) = \frac{variance_{expected}}{variance_{expected} + variance_{measurement}}
$$

### Pseudocode

* Need to start with a starting estimate as a gaussian. We are trying to be at 0m but there's a slight possibility that we placed the robot wrong, so our standard variance is _x_ meters. This means that we are 99.7% sure that the robot is within +- 3\*x meters of 0.
* Set the process gaussian as the expected velocity (0 to start) and the variance in this value (should be very small to start)

```python
PROCESS_VAR = 0.1 # This is a tuneable value that represents the uncertainty in our model
MEASUREMENT_VAR = 0.1 # This a tuneable value that represents the uncertainty in our
TIME_STEP = 0.01 # The duration between steps of the filter, in seconds

def predict(prev_state):
  dx = prev_state.velocity * TIME_STEP # integrate velocity to get position
  pos = prev_state.pos + dx # add the change in position to our previous position
  var = prev_state.var + PROCESS_VAR # we always add the process variance to our prediction variance on each step
  return pos, var

def update(state, var, measurement):
  residual = measurement - state
  kalman_gain = var / (var + MEASUREMENT_VAR)

  new_state = state + kalman_gain
  new_var = (1 - kalman_gain) * var
  return new_state, new_var

for time_step in autonomous:
  predict_state, predict_var = predict(prev_state)

  new_state, new_var = update(predict_state, predict_var, measurement)
```

### Multivariate Gaussians

If we are measuring more than one quantity we need a multivariate gaussian distribution. This will occur if we are measuring the position and velocity of our robot, or the {x,y,theta} pose of the robot.

#### Covariance

Covariance is a portmanteau of the words correlated and variances. When we measure multiple variables we need to consider the interactions between variances in any pair of variables. We can intuitively think of this in terms of height and weight for a group of people. There is a variance in height and a variance in weight in the groups. The two measurements are not perfectly correlated, but it's possible to assume that, on average, taller individuals will weigh more than shorter individuals. This relationship between the two measurements is _covariance_.

#### Multiplication

The equations for multiplying multivariate gaussians are a bit more complex than multiplying univariate (single dimension) gaussian distributions like in the previous section. The python pseudocode for this operation is as follows:

```python
def multiply(gauss1, gauss2):
  mean1, covariance1 = gauss1
  mean2, covariance2 = gauss2

  mean = covariance2 * (covariance1 + covariance2) ** -1 * mean1 + \
         covariance1 * (covariance1 + covariance2) ** -1 * mean2
  covariance = covariance1 * (covariance1 + covariance2) ** -1 * covariance2

  return mean, covariance
```

As before, this gets a new gaussian distribution with a smaller variance.

### Multivariate Kalman Filters

```python
def predict():
  state = F * prevState + B * u
  variance = F * variance * F_transposed + Q
```

state is often written as `x` variance is often written as `P` `F` is the _state transition function_. It computes the next state from the previous state. `Q` is the process covariance matrix. `B` and `u` are new, they are used to model control inputs (motor movements) to the system. `u` represents the raw control input, such as motor voltage, and `B` tranlates that into a state variable.

```python
def update():
  y = z - H * state
  K = P * H_transpose * (H * P * H_transpose + R) ** -1

  state = prevState + K * y
  variance = (I - K * H) * P
```

`H` is the _measurement function_. It is the measurement analog to `B`, it maps state variables, like position or velocity, to raw sensor values, such as encoder ticks. It seems counterintuitive at first, but we are not converting the measurement to our state variables at this point. From the Kalman book:

> This is because measurements are not invertible. For example, consider a sensor that gives the range to a target. It is impossible to convert a range into a position - an infinite number of positions in a circle will yield the same range. On the other hand, we can always compute the range (measurement) given a position (state).

`z` and `R` are the measurement mean and covariance, respectively. `y` is the residual, or the difference between the measurement and prediction. `K` is the Kalman Gain. `I` is the identity matrix, which consists of 1s in the diagonal of the matrix.

## Designing the filter

### Choosing State Variables

* We for sure want the state that we're going to use elsewhere in the app, like `[x, y, theta]` for a robot's odometry
* We then want each derivative for these variables until we get to a value we know will be constant. For instance, a robot that is limited to a constant acceleration would track the position, velocity, and acceleration for each dimension.

### Design the State Transition Function

This is often called `F`. We want to use kinematic equations from physics to show how the next state is affected by the previous state's values.

In the example of a robot's odometry, we know that in each dimension, position is a factor of the following equation:

$$x = x_{prev} + v * \Delta t + a * 0.5 * (\Delta t)^2$$

And velocity is a factor of the following equation:

$$v = v_{prev} + a * \Delta t$$

We can use these equations, and the knowledge that acceleration is constant, to write the following transition matrix for one dimension:

$$
\begin{bmatrix}
1 & \Delta t & 0.5 * (\Delta t)^2\\
0 & 1        & \Delta t\\
0 & 0        & 1
\end{bmatrix}
$$

This matrix can be replicated across the diagonal for each dimension.

### Design the Process Noise Matrix

The Process Noise Matrix (`Q`) sets the variance for how much we think the model changes between steps. This should usually start out as a small value like `0.001` but will need to be tuned for the system once the filter is operational.

If we assume that there is no covariance between dimensions, as is typically the case with examples like our odometry here, the Q matrix will contain a diagonal submatrix for each dimension like the following 2d example:

$$
Q = \begin{bmatrix}
0     & 0.001 & 0     & 0 \\
0.001 & 0.001 & 0     & 0 \\
0     & 0     & 0     & 0.001 \\
0     & 0     & 0.001 & 0.001
\end{bmatrix}
$$

Adding a third dimension, like heading, would add another matrix of the shape

$$
\begin{bmatrix}
0     & 0.001 \\
0.001 & 0.001
\end{bmatrix}
$$

To the bottom right corner of our previous matrix.

### Design the Measurement Function

The Measurement Function (`H`) is a matrix of size `m x n` where m is the number of state variables and n is the number of measurement variables. We use this function to convert a _state_ variable to a _measurement_ variable. This usually involves trigonometry to go from a state like heading to a measurement like a difference in encoder ticks between tracking wheels or a simple conversion of units from, for example, feet to meters.

### Design the Measurement Noise Matrix

The Measurement Noise Matrix (`R`) defines the variance in our measurements. This matrix will be of size `n x n` where n is the number of measurement variables. The matrix is of the form:

$$
R = \begin{bmatrix}
\sigma_x^2        & \sigma_x \sigma_y \\
\sigma_x \sigma_y & \sigma_y^2
\end{bmatrix}
$$

If we have no covariance between measurements, which is often the case with our robotics measurements, the above matrix will be a diagonal matrix ($\sigma\_x \sigma\_y$ will be zero).

### Set Initial Conditions

The initial state (`x0`) and the inital covariance (`P`) are our expected position and confidence in that variable, respectively. For a VEX robot, this initial state would be the coordinates where the robot is placed on the starting square or other starting position. The initial covariance is a tunable valuable that says that we expect the robot to be within $+- \sqrt{variance}$ units away from the initial state more than half of the time. This confidence should not be zero, saying that we know _exactly_ where the robot, but placing the robot consistently for auton means that this value can be pretty small.

For our example state of `[x, dx, y, dy]` we would have the following initial covariance:

$$
P = \begin{bmatrix}
0.5 & 0 & 0   & 0 \\
0   & 0 & 0   & 0 \\
0   & 0 & 0.5 & 0 \\
0   & 0 & 0   & 0
\end{bmatrix}
$$

The above matrix says that we expect that the robot will always be still (velocity of zero) at start, and that the robot will typically be within $\sqrt{0.5}$ inches of the set starting coordinates.

## Discretization

If continuous models are used for the system model or variances, discretization must be performed to run these models on a robot. A **zero-order hold** is sufficient for most VEX applications. The full set of calculations for this discretization is out of the scope for this article but can be found in [Controls Engineering in FRC](https://file.tavsys.net/control/controls-engineering-in-frc.pdf).

## Glossary

* Observed variables: These are variables that we are measuring directly (or at least directly at the robot brain) like distance (ultrasonic) or heading (IMU)
* Hidden variables: These are variables that we can infer from other measurements, like inferring velocity from the change in ultrasonic readings over time.
* Unobserved variables: These are variables that we can't measure or infer, like the robot's tilt or the robot's name.
* Prior: The predicted next state of the system

## References

* [Kalman and Bayesian Filters in Python](https://github.com/rlabbe/Kalman-and-Bayesian-Filters-in-Python)
* [Controls Engineering in FRC](https://file.tavsys.net/control/controls-engineering-in-frc.pdf)

### Contributing Teams to this Article:

* [BLRS](https://purduesigbots.com/) (Purdue SIGBots)
