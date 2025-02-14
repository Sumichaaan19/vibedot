#!/bin/bash

# Set the directory where wallpapers are stored
WALLPAPER_DIR="$HOME/.config/wall"

# Use Rofi to select a wallpaper
SELECTED_WALLPAPER=$(find "$WALLPAPER_DIR" -type f | rofi -dmenu -i -p "Select Wallpaper")

# If a wallpaper was selected, set it using swww
if [[ -n "$SELECTED_WALLPAPER" ]]; then
    swww img "$SELECTED_WALLPAPER" --transition-type wipe --transition-duration 2
fi
