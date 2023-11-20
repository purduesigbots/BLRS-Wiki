# Boomerang

## Concept
Boomerang is a sort of move-to-pose algorithm, implemented first in the ARMS library, that uses PID to move towards a constantly recalculating carrot point. The carrot point is found along the axis of the target point based on the target heading provided, and the width of the turn, or the distance from the carrot point to the diagonal between the start and end points, is related to a provided constant, usually referred to as the dLead value. Unlike algorithms like pure pursuit, the boomerang algorithm doesn't use a path. Instead, the carrot point is updated based on the distance between the robot's position and the target point until the carrot point meets the target point.

## Visualization
[This](https://www.desmos.com/calculator/sptjw5szex) graph (source unknown) can be helpful for visualizing where the carrot point ends up and what the path of the robot becomes.

## Implementation
To begin with, you need the calculations for your carrot point. The following equations can be used:
$$ carrot_{x} = target_{x} -  \sqrt{ (x_{current} - x_{end})^{2} + (y_{start} - y_{end})^{2} }* sin( theta_{end}) * d_{lead} $$
$$ carrot_{y} = target_{y} -  \sqrt{ (x_{current} - x_{end})^{2} + (y_{start} - y_{end})^{2} }* cos( theta_{end}) * d_{lead} $$

The carrot point should be recalculated with each PID update to reflect the new position of your robot. You can then call your move to point PID as usual on this new point, using the same linear and angular PID values as found for other movements. To change the width of the turn, the $d_{lead}$ value can be tuned until it suits your needs. Often a different $d_{lead}$ value will be required for each movement, depending on the curve required.

## Notes
* Chained boomerang movements can be used to create a path-following effect.
* Short distances between the target point and starting point, especially when there is a large heading change, can cause the algorithm to not work as expected.