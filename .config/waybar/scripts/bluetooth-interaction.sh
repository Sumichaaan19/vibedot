#!/bin/bash

# List available devices
bluetoothctl devices

# Ask user to select a device to pair/connect
echo "Enter device MAC address to pair/connect:"
read MAC_ADDRESS

# Pair and connect to selected device
bluetoothctl pair $MAC_ADDRESS
bluetoothctl connect $MAC_ADDRESS

# Display notification
notify-send "Bluetooth" "Device $MAC_ADDRESS paired and connected."
