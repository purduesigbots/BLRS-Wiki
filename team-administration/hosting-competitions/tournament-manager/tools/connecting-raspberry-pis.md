# Connecting Raspberry Pis

Raspberry Pis can be used to run displays around competitions as well as hosting match controllers at a field location instead of running wires from a central computer to the field. To do this, a raspberry pi must be running TM which can be downloaded for the pi [here](https://vextm.dwabtech.com). TM must be bootable from the pi which can be done using Raspberry Pi's boot loading software found [here](https://www.raspberrypi.com/software/).

To connect a Raspberry Pi, connect it to the network that the competition is hosted on, connect it to power, and connect it to a display. From there, open the Pi manager in TM under `Displays` -> `Configure Remote Displays (Raspberry Pis)`.&#x20;

<figure><img src="../../../../.gitbook/assets/Remote Display Setup" alt=""><figcaption><p>Remote Display Dialogue Box</p></figcaption></figure>

When adding a display, a prompt for the IP address shown on the Pi will pop up and needs to be filled with the information on the display (as shown below). It is then possible to change `Dispay Name`, add it to a specific `Field` / `Field Set`, and choose the display type. Options for overlay are used for streaming and using field cameras.&#x20;

Once configured, a Raspberry Pi display can be controlled like all other displays through&#x20;

<figure><img src="../../../../.gitbook/assets/RaspPi IP" alt=""><figcaption><p>Example Pi Display for Pairing</p></figcaption></figure>

When a Raspberry Pi is turned on, it will display an IP address to be input to the TM dialogue box.&#x20;
