# Kalman Filter

reference: https://github.com/rlabbe/Kalman-and-Bayesian-Filters-in-Python

## Definition

A Kalman Filter is a filtering algorithm that tries to estimate values based on measurements and pre-determined models. This can be applied in VEX Robotics to reduce noise in different sensor measurements, such as a noisy [ultrasonic rangefinder](../../vex-electronics/vex-sensors/3-pin-adi-sensors/ultrasonic.md) measurement or a noisy trend in an average value obtained from multiple sensors.

## Concept

Robot is being commanded to drive forward at 100rpm (1256 in per min with 4" wheels). Measure position with encoders

We expect that the robot will be x feet from its previous measurement after y seconds. But our encoders measure z feet from the previous measurement. This could be from wheel slip or missed encoder ticks, or imperfect calculations of the wheel diameter. What is the true distance?

Adding additional sensors gives us additional data points to limit the range of real values. Originally value had to be between expectation and encoders, now it can be between expectation, encoders, and ultrasonics

Next part of jupyter notebook uses multiple steps to show the effect of the prediction and then talks about calculating an estimate from the previous measurements. Here we would use our previous computed velocity as the prediction instead of 1256 inpermin. G-H filter part uses a constant to modify the expectation gradually rather than replacing it, so our new prediction would be 2/3 \* old velocity (1256) + 1/3 \_ new velocity (calculated).

Detail the steps thus far, in jupyter notebook

Exercise: right generic function to compute a new value given a measurement, past prediction, and past filtered val

### Bayesian statistics

"prior"s used to indicate the chances of a single event, like the chance of rain today being 50%. Use field tiles to represent this, there's an X% chance we are in tile 1, Y% in tile 2, etc. Use the "Tracking and Control" section to write this

Might be able to combine the gaussian distribution section with this one

### Kalman Gain

- Need to start with a starting estimate as a gaussian. We are trying to be at 0m but there's a slight possibility that we placed the robot wrong, so our standard variance is _x_ meters. This means that we are 99.7% sure that the robot is within +- 3\*x meters of 0.
- Set the process gaussian as the expected velocity (0 to start) and the variance in this value (should be very small to start)

For each step:

- calculate the next step with the `predict` function. This should have a higher variance, as always happens during the prediction state
- calculate the "likelihood" as a gaussian from the sensor value and its variance
- calculate the next state with the `update()` function ?

```py
def predictBayesian():
  dx = velocity * dt # integrate velocity to get position
  pos = pos + dx # add the change in position to our previous position
  var = var + process_var # we always add the process variance to our prediction variance on each step

def predictTraditional():
  x, P = prevState
  dx, Q = movement

  x = x + dx # predicted next state
  P = P + Q # prediction variance
```

```py
def updateBayesian():
  # multiplying the likelihood and prior gaussians
  pos = (var * z + sensor_var * pos) / (var + sensor_var) # mean
  var = (var * sensor_var) / (var + sensor_var) # var

def updateTraditional():
  x, P = prevState
  z, R = measurement

  y = z - x # residual
  K = P / (P + R) # Kalman Gain

  x = x + K * y  # new state
  P = (1 - K) * P # new state variance
```

z = measurement (z)
P = state variance (var)
Q = process noise (process_var)
R = measurement noise (sensor_var)

Link to the examples of bad setups in the kalman filters book

A link to the book with explanation of how our normal kalman filter only works if we assume that the velocity is constant

### Multivariate Gaussians

If we are measuring more than one quantity we need a multivariate gaussian distribution. This will occur if we are measuring the position and velocity of our robot, or the {x,y,theta} pose of the robot.

#### Covariance

Covariance is a portmanteau of the words correlated and variances. When we measure multiple variables we need to consider the interactions between variances in any pair of variables. We can intuitively think of this in terms of height and weight for a group of people. There is a variance in height and a variance in weight in the groups. The two measurements are not perfectly correlated, but it's possible to assume that, on average, taller individuals will weigh more than shorter individuals. This relationship between the two measurements is _covariance_.

#### Multiplication

The equations for multiplying multivariate gaussians are a bit more complex than multiplying univariate (single dimension) gaussian distributions like in the previous section. The python pseudocode for this operation is as follows:

```py
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

```py
def predict():
  state = F * prevState + B * u
  variance = F * variance * F_transposed + Q
```

state is often written as `x`
variance is often written as `P`
`F` is the _state transition function_. It computes the next state from the previous state.
`Q` is the process covariance matrix.
`B` and `u` are new, they are used to model control inputs (motor movements) to the system. `u` represents the raw control input, such as motor voltage, and `B` tranlates that into a state variable.

```py
def update():
  y = z - H * state
  K = P * H_transpose * (H * P * H_transpose + R) ** -1

  state = prevState + K * y
  variance = (I - K * H) * P
```

`H` is the _measurement function_. It is the measurement analog to `B`, it maps state variables, like position or velocity, to raw sensor values, such as encoder ticks. It seems counterintuitive at first, but we are not converting the measurement to our state variables at this point. From the Kalman book:

> This is because measurements are not invertible. For example, consider a sensor that gives the range to a target. It is impossible to convert a range into a position - an infinite number of positions in a circle will yield the same range. On the other hand, we can always compute the range (measurement) given a position (state).

`z` and `R` are the measurement mean and covariance, respectively.
`y` is the residual, or the difference between the measurement and prediction.
`K` is the Kalman Gain.
`I` is the identity matrix, which consists of 1s in the diagonal of the matrix.

## Discretization

Reference Tyler's FRC book here

## Steps to Calculation

### Initialization

1. Initialize the state of the filter
2. Initialize our belief in the state

### Predict

1. Use process model to predict state at the next time step
2. Adjust belief to account for the uncertainty in prediction

### Update

1. Get a measurement and associated belief about its accuracy
2. Compute residual between estimated state and measurement
3. Compute scaling factor based on whether the measurement or prediction is more accurate.
4. Set state between the prediction and measurement based on the scaling factor.
5. Update belief in the state based on how certain we are in the measurement prediction.

## Glossary

- Observed variables: These are variables that we are measuring directly (or at least directly at the robot brain) like distance (ultrasonic) or heading (IMU)
- Hidden variables: These are variables that we can infer from other measurements, like inferring velocity from the change in ultrasonic readings over time.
- Unobserved variables: These are variables that we can't measure or infer, like the robot's tilt or the robot's name.
- Prior: The predicted next state of the system

### Contributing Teams to this Article:

- [BLRS](https://purduesigbots.com/) \(Purdue SIGBots\)
