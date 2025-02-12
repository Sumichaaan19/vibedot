#!/bin/bash

# Get the current idle inhibitor state
STATUS=$(hyprctl active | grep "idleInhibit" | awk '{print $2}')

# Toggle if "toggle" argument is passed
if [ "$1" == "toggle" ]; then
    if [ "$STATUS" == "1" ]; then
        hyprctl dispatch submap reset
    else
        hyprctl dispatch submap idleblock
    fi
    exit 0
fi

# Print the correct icon based on the current status
if [ "$STATUS" == "1" ]; then
    echo "󰥔"
else
    echo ""
fi

