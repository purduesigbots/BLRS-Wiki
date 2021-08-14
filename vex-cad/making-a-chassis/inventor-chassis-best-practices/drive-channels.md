---
description: Some call these "pontoons"
---

# Drive Channels

## Outer Channel

This will be constrained the same way as the outer channel in the basics tutorial, linked here. 

{% page-ref page="../inventor-chassis/connecting-two-c-channels.md" %}

Our drive channels will be 35 hole long aluminum 2xs.  We can find them in `Structure/C-Channels/Aluminum 1x2x1/1x2x1x35 Aluminum.ipt`.  Start by placing one of them. 

![Placed 1x2x1x35 C-Channel](../../../.gitbook/assets/image%20%28179%29.png)

This gets constrained with one insert and one mate constraint, just like the previous tutorial linked above.  

![Insert Constraint between two C-Channels](../../../.gitbook/assets/image%20%28173%29.png)

![Mate Constraint between two C-Channels](../../../.gitbook/assets/image%20%28148%29.png)

## Inner Channel

In the previous tutorial, the inner and outer channel were constrained in the same way.  If we wanted to move the drive up, we had to do it for both the inside and outside channel.  We are going to constrain the inner channel so moving the outer channel moves both the inner and outer up. 

Instead of using one insert and one mate constraint, we will use two mate constraints to constrain the c-channel to the cross brace. 

![Mate Constraint between two C-Channels](../../../.gitbook/assets/image%20%28191%29.png)

Because there is no insert constraint, this c-channel will be able to move up and down if you left click and drag it. 

![Mate Constraint between two C-Channels](../../../.gitbook/assets/image%20%28207%29.png)

Now we want to constrain it to the outer channel, so that when we modify the insert constraint on the outer channel, both channels move.  We will do this with another mate constraint between the inner and outer channels. 

![Mate Constraint between two C-Channels](../../../.gitbook/assets/image%20%2874%29.png)

If done correctly, when you modify the insert constraint for the outer drive channel, both channels should move up.  But, for now we will leave this insert constraint at 0. 

![Drive Channels Moving Together](../../../.gitbook/assets/image%20%28139%29.png)

{% hint style="info" %}
Remember to keep that insert constraint 0"!  Remember to save!
{% endhint %}



## Contributors to this Article:

* Jess - EZ

