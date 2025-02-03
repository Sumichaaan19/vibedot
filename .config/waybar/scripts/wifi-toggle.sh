#!/bin/bash

STATE=$(nmcli radio wifi)

if [ "$STATE" = "enabled" ]; then
    nmcli radio wifi off
    notify-send "WiFi Disabled" "Wireless connection has been turned off."
else
    nmcli radio wifi on
    notify-send "WiFi Enabled" "Wireless connection has been turned on."
fi
