#!/bin/bash

# Destination folder
DEST_DIR="/home/ralphie/vibedot/.config"

# Ensure destination exists
mkdir -p "$DEST_DIR"

# Copy config folders
cp -r ~/.config/bluetuith \
      ~/.config/cava \
      ~/.config/hyde \
      ~/.config/hypr \
      ~/.config/kde.org \
      ~/.config/kitty \
      ~/.config/neofetch \
      ~/.config/neofetch-themes \
      ~/.config/ranger \
      ~/.config/rofi \
      ~/.config/swaync \
      ~/.config/wal \
      ~/.config/wall \
      ~/.config/waybar \
      ~/.config/wlogout \
      ~/.config/xsettingsd \
      ~/.config/yay \
      ~/.config/btop \
      "$DEST_DIR"

# Copy .bashrc separately
cp ~/.bashrc /home/ralphie/vibedot/

echo "Configs updated in $DEST_DIR"
