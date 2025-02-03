#!/bin/bash

IFACE=$(nmcli device status | grep ethernet | awk '{print $1}')
STATE=$(nmcli device status | grep "$IFACE" | awk '{print $3}')

if [ "$STATE" = "connected" ]; then
    nmcli device disconnect "$IFACE"
    notify-send "Ethernet Disabled" "Wired connection has been turned off."
else
    nmcli device connect "$IFACE"
    notify-send "Ethernet Enabled" "Wired connection has been turned on."
fi
