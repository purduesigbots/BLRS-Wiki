# Kalman Filter

### Steps to Calculation

#### Initialization

1. Initialize the state of the filter
2. Initialize our belief in the state

**Predict**

1. Use process model to predict state at the next time step
2. Adjust belief to account for the uncertainty in prediction

#### Update

1. Get a measurement and associated belief about its accuracy
2. Compute residual between estimated state and measurement
3. Compute scaling factor based on whether the measurement or prediction is more accurate.
4. Set state between the prediction and measurement based on the scaling factor.
5. Update belief in the state based on how certain we are in the measurement prediction.

