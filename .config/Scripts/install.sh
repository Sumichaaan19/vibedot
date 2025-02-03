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

# Copy the dotfiles instead of symlinking
echo "Copying dotfiles to ~/.config/"

cp -r "$DEST_DIR/.config/cava" "$HOME/.config/cava"
cp -r "$DEST_DIR/.config/waybar" "$HOME/.config/waybar"
cp -r "$DEST_DIR/.config/hypr" "$HOME/.config/hypr"
cp -r "$DEST_DIR/.config/hyde" "$HOME/.config/hyde"
cp -r "$DEST_DIR/.config/kitty" "$HOME/.config/kitty"
cp -r "$DEST_DIR/.config/nautilus" "$HOME/.config/nautilus"
cp -r "$DEST_DIR/.config/neofetch" "$HOME/.config/neofetch"
cp -r "$DEST_DIR/.config/nwg-look" "$HOME/.config/nwg-look"
cp -r "$DEST_DIR/.config/ranger" "$HOME/.config/ranger"
cp -r "$DEST_DIR/.config/rofi" "$HOME/.config/rofi"
cp -r "$DEST_DIR/.config/swaync" "$HOME/.config/swaync"
cp -r "$DEST_DIR/.config/wal" "$HOME/.config/wal"
cp -r "$DEST_DIR/.config/wall" "$HOME/.config/wall"
cp -r "$DEST_DIR/.config/wlogout" "$HOME/.config/wlogout"
cp -r "$DEST_DIR/.config/xsettingsd" "$HOME/.config/xsettingsd"

# Optional: Install necessary dependencies
echo "Installing necessary dependencies..."
sudo pacman -Syu --noconfirm
sudo pacman -S --noconfirm hyprland sway waybar rofi neofetch ranger kitty nautilus cava
yay -S --noconfirm wlogout

# Done
echo "Installation complete!"
