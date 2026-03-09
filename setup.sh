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

# Ghostty
mkdir -p "$CONFIG_DIR/ghostty"
mkdir -p "$CONFIG_DIR/ghostty/themes"
ln -sf "$DOTFILES_DIR/dotfiles/ghostty/config" "$CONFIG_DIR/ghostty/config"
ln -sf "$DOTFILES_DIR/dotfiles/ghostty/themes/catppuccin-mocha" "$CONFIG_DIR/ghostty/themes/catppuccin-mocha"

# Starship
ln -sf "$DOTFILES_DIR/dotfiles/starship.toml" "$CONFIG_DIR/starship.toml"

# Shell Aliases (Add to .zshrc if not present)
if ! grep -q "source $DOTFILES_DIR/dotfiles/zshrc_extras" "$HOME/.zshrc"; then
    echo "Adding aliases to .zshrc..."
    echo "" >> "$HOME/.zshrc"
    echo "# Dotfiles extras" >> "$HOME/.zshrc"
    echo "source \"$DOTFILES_DIR/dotfiles/zshrc_extras\"" >> "$HOME/.zshrc"
fi

# 3. Setup Neovim (LazyVim)
echo "Setting up Neovim (LazyVim)..."
if [ -d "$CONFIG_DIR/nvim" ]; then
    echo "Backing up existing nvim config..."
    mv "$CONFIG_DIR/nvim" "$CONFIG_DIR/nvim.bak"
fi
ln -sf "$DOTFILES_DIR/dotfiles/nvim" "$CONFIG_DIR/nvim"

# 4. Setup VS Code Settings
echo "Setting up VS Code settings..."
VSCODE_USER_DIR="$HOME/Library/Application Support/Code/User"

if [ -d "$VSCODE_USER_DIR" ]; then
    echo "Linking VS Code settings..."
    ln -sf "$DOTFILES_DIR/.vscode/settings.json" "$VSCODE_USER_DIR/settings.json"
fi

# 5. Service Management (Yabai/SKHD)
echo "Starting services..."
yabai --start-service
skhd --start-service

echo "Done! Note: You may need to enable Accessibility permissions for Yabai and SKHD in System Settings."
echo "For Yabai scripting additions (required for some features), you need to disable SIP. See Yabai wiki."

