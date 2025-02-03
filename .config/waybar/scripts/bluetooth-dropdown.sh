#!/bin/bash

# Start scanning for devices
bluetoothctl scan on &
sleep 5  # Give it some time to discover devices

# Get available devices (you can change the filter based on what you want to show)
devices=$(bluetoothctl devices | awk '{print $2 " - " $3 " " $4}')

# Prepare the menu (replace this with your preferred UI tool like rofi, dmenu, etc.)
echo "$devices" | rofi -dmenu -p "Select a Bluetooth device to connect" -i | while read mac; do
    if [[ -n $mac ]]; then
        bluetoothctl pair $mac
        bluetoothctl connect $mac
        notify-send "Bluetooth" "Connected to $mac"
    fi
done
