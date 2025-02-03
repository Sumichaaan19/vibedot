#!/bin/bash

# Define your GitHub repository URL
REPO_URL="https://github.com/Sumichaaan19/vibedot.git"
DEST_DIR="$HOME/vibedot"

# Clone the repository if it doesn't exist
if [ ! -d "$DEST_DIR" ]; then
    echo "Cloning vibedot repository..."
    git clone "$REPO_URL" "$DEST_DIR"
else
    echo "vibedot repository already exists, pulling latest changes..."
    cd "$DEST_DIR"
    git pull
fi

# Ensure the .config directory exists
mkdir -p "$HOME/.config"

# Prompt the user for confirmation
echo "WARNING: This will replace existing configuration files in ~/.config/"
read -p "Are you sure you want to proceed? (y/n): " choice

# Convert input to lowercase
choice=$(echo "$choice" | tr '[:upper:]' '[:lower:]')

if [[ "$choice" != "y" ]]; then
    echo "Operation cancelled."
    exit 1
fi

# Copy the dotfiles to ~/.config/
echo "Copying dotfiles to ~/.config/"

cp -rf "$DEST_DIR/.config/cava" "$HOME/.config/cava" && echo "Copied cava to ~/.config/cava"
cp -rf "$DEST_DIR/.config/waybar" "$HOME/.config/waybar" && echo "Copied waybar to ~/.config/waybar"
cp -rf "$DEST_DIR/.config/hypr" "$HOME/.config/hypr" && echo "Copied hypr to ~/.config/hypr"
cp -rf "$DEST_DIR/.config/kitty" "$HOME/.config/kitty" && echo "Copied kitty to ~/.config/kitty"
cp -rf "$DEST_DIR/.config/neofetch" "$HOME/.config/neofetch" && echo "Copied neofetch to ~/.config/neofetch"
cp -rf "$DEST_DIR/.config/nwg-look" "$HOME/.config/nwg-look" && echo "Copied nwg-look to ~/.config/nwg-look"
cp -rf "$DEST_DIR/.config/ranger" "$HOME/.config/ranger" && echo "Copied ranger to ~/.config/ranger"
cp -rf "$DEST_DIR/.config/rofi" "$HOME/.config/rofi" && echo "Copied rofi to ~/.config/rofi"
cp -rf "$DEST_DIR/.config/swaync" "$HOME/.config/swaync" && echo "Copied swaync to ~/.config/swaync"
cp -rf "$DEST_DIR/.config/wal" "$HOME/.config/wal" && echo "Copied wal to ~/.config/wal"
cp -rf "$DEST_DIR/.config/wall" "$HOME/.config/wall" && echo "Copied wall to ~/.config/wall"
cp -rf "$DEST_DIR/.config/wlogout" "$HOME/.config/wlogout" && echo "Copied wlogout to ~/.config/wlogout"
cp -rf "$DEST_DIR/.config/xsettingsd" "$HOME/.config/xsettingsd" && echo "Copied xsettingsd to ~/.config/xsettingsd"

# Optional: Install necessary dependencies
echo "Installing necessary dependencies..."
sudo pacman -Syu --noconfirm
sudo pacman -S --noconfirm hyprland sway waybar rofi neofetch ranger kitty nautilus cava
yay -S --noconfirm wlogout

# Done
echo "Installation complete!"
