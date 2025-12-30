#!/bin/bash

# Define paths
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG_DIR="$HOME/.config"

echo "Setting up Mac..."

# 1. Install Brew and packages
chmod +x "$DOTFILES_DIR/scripts/install_brew.sh"
./scripts/install_brew.sh

# 2. Symlink Configs
echo "Linking configurations..."

# Yabai
mkdir -p "$CONFIG_DIR/yabai"
ln -sf "$DOTFILES_DIR/dotfiles/yabai/yabairc" "$CONFIG_DIR/yabai/yabairc"

# SKHD
mkdir -p "$CONFIG_DIR/skhd"
ln -sf "$DOTFILES_DIR/dotfiles/skhd/skhdrc" "$CONFIG_DIR/skhd/skhdrc"

# 3. Setup Neovim (LazyVim)
echo "Setting up Neovim (LazyVim)..."
if [ -d "$CONFIG_DIR/nvim" ]; then
    echo "Backing up existing nvim config..."
    mv "$CONFIG_DIR/nvim" "$CONFIG_DIR/nvim.bak"
fi
ln -sf "$DOTFILES_DIR/dotfiles/nvim" "$CONFIG_DIR/nvim"

# 4. Setup VS Code / Cursor Settings
echo "Setting up VS Code / Cursor settings..."
VSCODE_USER_DIR="$HOME/Library/Application Support/Code/User"
CURSOR_USER_DIR="$HOME/Library/Application Support/Cursor/User"

if [ -d "$VSCODE_USER_DIR" ]; then
    echo "Linking VS Code settings..."
    ln -sf "$DOTFILES_DIR/.vscode/settings.json" "$VSCODE_USER_DIR/settings.json"
fi

if [ -d "$CURSOR_USER_DIR" ]; then
    echo "Linking Cursor settings..."
    ln -sf "$DOTFILES_DIR/.vscode/settings.json" "$CURSOR_USER_DIR/settings.json"
fi

# 5. Service Management (Yabai/SKHD)
echo "Starting services..."
yabai --start-service
skhd --start-service

echo "Done! Note: You may need to enable Accessibility permissions for Yabai and SKHD in System Settings."
echo "For Yabai scripting additions (required for some features), you need to disable SIP. See Yabai wiki."

