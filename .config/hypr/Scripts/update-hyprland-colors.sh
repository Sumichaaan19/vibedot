#!/bin/bash

# Path to your Tokyo-Night.css and hyprland.conf
CSS_FILE="$HOME/.config/gtk-3.0/Tokyo-Night.css"
HYPR_CONF="$HOME/.config/hypr/hyprland.conf"

# Extract wb-act-fg color
WB_ACT_FG=$(grep -Po '(?<=@define-color wb-act-fg )#[0-9a-fA-F]+' "$CSS_FILE")

# If color is found, replace in hyprland.conf
if [[ -n "$WB_ACT_FG" ]]; then
    sed -i "s/col.active_border = .*/col.active_border = rgb(${WB_ACT_FG:1})/" "$HYPR_CONF"
    echo "Updated active border color to $WB_ACT_FG"
else
    echo "wb-act-fg color not found in Tokyo-Night.css!"
fi

# Reload Hyprland config
hyprctl reload
