#!/bin/bash
cava -p ~/.config/waybar/cava_config | while read -r line; do
    echo "🎵 $line"
done
