iptables-scripts
================

rename the appropiate script to pre-up iptables.up.rules

vi /etc/network/interfaces


add the line

```pre-up iptables-restore < /etc/iptables.up.rules```

to this section:
````
auto lo
iface lo inet loopback
pre-up iptables-restore < /etc/iptables.up.rules
````
