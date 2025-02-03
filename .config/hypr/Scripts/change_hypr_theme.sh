#!/bin/bash

THEME_FILE=""/home/ralphie/.config/hypr/Themes/Tokyo-Night.css"
HYPR_CONFIG="$HOME/.config/hypr/hyprland.conf"

# Extract colors from Tokyo Night CSS
ACTIVE_BORDER=$(grep '@define-color wb-act-fg' "$THEME_FILE" | awk '{print $3}' | tr -d ';')
INACTIVE_BORDER=$(grep '@define-color main-bg' "$THEME_FILE" | awk '{print $3}' | tr -d ';')

# Update Hyprland config
sed -i "s/col.active_border.*/col.active_border = rgb(${ACTIVE_BORDER//#/})/" "$HYPR_CONFIG"
sed -i "s/col.inactive_border.*/col.inactive_border = rgb(${INACTIVE_BORDER//#/})/" "$HYPR_CONFIG"

# Reload Hyprland
hyprctl reload

echo "Tokyo Night theme applied to Hyprland borders!"
