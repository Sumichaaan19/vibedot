#!/bin/bash
WALLPAPER_DIR="$HOME/.config/wall"
SELECTED=$(find "$WALLPAPER_DIR" -type f | fzf)

if [ -n "$SELECTED" ]; then
    sed -i "s|wallpaper = .*|wallpaper = eDP-1,$SELECTED|" ~/.config/hypr/hyprpaper.conf
    pkill -USR1 hyprpaper  # Reload Hyprpaper
fi

