#!/bin/bash

# Install Homebrew if not installed
if ! command -v brew &> /dev/null; then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo "Homebrew already installed."
fi

# Taps
# brew tap homebrew/cask-fonts # Deprecated, fonts are now in main cask

# Core tools
brew install neovim
brew install git
brew install ripgrep
brew install fd
brew install fzf
brew install node # for copilot/various lsps
brew install starship # prompt with icons
brew install zoxide # smarter cd
brew install eza # modern ls replacement
brew install lazygit # terminal git UI
brew install tmux # terminal multiplexer

# Tiling Window Manager
brew install --cask nikitabobko/tap/aerospace

# Applications
brew install --cask discord
brew install --cask whatsapp
brew install --cask pdfsam-basic

# Ghostty (Terminal)
# Note: Ghostty might be in private beta or require specific cask. 
# Checking if it's available, otherwise echoing instruction.
if brew search ghostty | grep -q "ghostty"; then
    brew install --cask ghostty
else
    echo "Ghostty not found in standard casks. Please install manually from https://mitchellh.com/ghostty"
fi

# Fonts (Nerd Fonts for icons)
brew install --cask font-jetbrains-mono-nerd-font

# CLI AI Tools
npm install -g @anthropic-ai/claude-code # Claude Code CLI
brew install opencode-ai/tap/opencode # OpenCode CLI

# Cleanup
brew cleanup

