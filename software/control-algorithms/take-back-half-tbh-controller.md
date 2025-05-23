# Take Back Half (TBH) Controller

## Concept

TBH is at its core an I controller in the same vein as the integral component of a traditional PID controller. When operating normally, the output is summed from the previous output and the error multiplied by a single gain value.&#x20;

The special properties of TBH arise from its handling of instances where the error value changes sign, indicating that at some brief point in time the error value equaled zero. When this occurs, the TBH parameter, or the controllers guess at its ideal output, is cut, decreasing the output relative to the setpoint. This prevents the typical overshoot with a PID controller that is heavy on the gain for the I term, and instead brings the output closer to the setpoint in a much more controlled manner. This method of cutting the TBH parameter increases the controllers use in situations where the system accelerates better than decelerating, as there is no need for the typical braking eﬀect that a PID control requires after overshooting.&#x20;

The TBH control also exhibits better performance at steady state, as the controller responds in a rather non-linear manner to error. Because the controller halves the TBH parameter relative to the output every time the error crosses zero, small error values as a result of signal noise or other minor ﬂuctuations in the system are quickly remedied as a result of the very short time to return to an error value of zero, and the controller oscillates in a very predictable and controlled manner when returning to a perfect steady state as a result.&#x20;

The gain control for the TBH can be treated very similarly to the proportional gain control from a PID control, despite TBHs integral based nature. None of the typical things to watch for with an I controller such as overshoot and increased instability with signal noise aﬀect the tuning of the TBH gain, so the gain can be treated more as a proportion control gain, where the TBH gain is responsible for providing the initial force toward the setpoint after an increase in error. The TBH gain control can have similar negative eﬀects as with a proportional gain control, where a high value can cause a need for multiple oscillations before reaching steady state and the controller could react too harshly to minor error values, so those eﬀects should be indications of a need to reduce the TBH gain.&#x20;

The code is typically set up so that there are two TBH parameters, TBH and TBHInitial. TBHInitial is kept consist for as long as the setpoint is kept constant, while TBH is reduced every time that the error crosses zero. This allows the controllers guess to remain very close to desired output in spite of noise, while still being able to ramp up the guess and accelerate hard if there is a change in setpoint. This could cause slow response times if there is a repeated action causing the system to stray from the setpoint when in a hold state, but will provide stability against noise in the data.

![ Example output of a TBH control](<../../.gitbook/assets/image (103).png>)

## Application

Take Back Half excels in velocity control situations, especially in ones where the physical system can accelerate faster than decelerate. The controller is able to ramp up to maximum output nearly instantaneously when a change in setpoint occurs, and is able to steadily hold the proper output to maintain the setpoint. It is typically outperformed by a well-tuned PID control in situations like distance control for driving where the desired end output is zero, but for situations like ﬂywheel velocity control and straight driving controllers, Take Back Half performs better. Due to TBHs single gain control, this algorithm can also work in a pinch when quick tuning is desired, such as emergency programming during or right before a competition. A Bang-Bang controller also works well in this context due to its increased simplicity, but Take Back Half typically has the best of both worlds with simplicity and performance.

## Resources

1. [Pearman, J. (2015, June 28). Flywheel velocity control. Retrieved August 04, 2016](https://www.vexforum.com/t/flywheel-velocity-control/29892)
2. Harper, C. S. (2011). Application of the Take-Back-Half algorithm to voltage source converter current control (Unpublished master’s thesis). Mississippi State University. Department of Electrical and Computer Engineering.

**Teams Contributed to this Article:**

* [BLRS](https://purduesigbots.com/) (Purdue SIGBots)
