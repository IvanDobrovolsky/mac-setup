# My Mac Setup

![Yosemite](assets/backgrounds/yosemite.jpg)

A minimal, opinionated macOS development environment with tiling window management, terminal-first workflow, and AI-powered coding tools.

## What's Included

**Window Management** — [Yabai](https://github.com/koekeishiya/yabai) tiling WM + [skhd](https://github.com/koekeishiya/skhd) hotkeys

**Terminal** — [Ghostty](https://ghostty.org) + [tmux](https://github.com/tmux/tmux) + [Starship](https://starship.rs) prompt

**Editor** — [Neovim](https://neovim.io) (LazyVim) + VS Code

**AI Tools** — [Claude Code](https://github.com/anthropics/claude-code) + [OpenCode](https://github.com/opencode-ai/opencode)

**CLI** — [eza](https://github.com/eza-community/eza), [zoxide](https://github.com/ajeetdsouza/zoxide), [ripgrep](https://github.com/BurntSushi/ripgrep), [fzf](https://github.com/junegunn/fzf), [lazygit](https://github.com/jesseduffield/lazygit)

**Theme** — [Catppuccin Mocha](https://github.com/catppuccin/catppuccin) everywhere

## Installation

```bash
git clone https://github.com/IvanDobrovolsky/my-mac-setup.git
cd my-mac-setup
./setup.sh
```

## Manual Steps

1. **Disable SIP** (partially) for full Yabai support — see the [Yabai wiki](https://github.com/koekeishiya/yabai/wiki/Disabling-System-Integrity-Protection)
2. **Grant Accessibility permissions** to Yabai, skhd, and Ghostty in System Settings
3. **Install Catppuccin Mocha** theme extension in VS Code

## Key Bindings

| Shortcut | Action |
|---|---|
| `Alt + hjkl` | Focus window |
| `Alt + Shift + hjkl` | Move window |
| `Alt + t` | Toggle float |
| `Alt + e` | Toggle split |
| `Cmd + Return` | New terminal |
| `Cmd + Shift + C` | VS Code |
| `Cmd + Shift + B` | Chrome |
| `Cmd + Shift + D` | Discord |

## Structure

```
dotfiles/
  ghostty/     # terminal config + catppuccin theme
  nvim/        # LazyVim config
  skhd/        # hotkey daemon config
  yabai/       # tiling WM config
  starship.toml
  zshrc_extras
scripts/
  install_brew.sh  # brew packages + cask apps + CLI tools
assets/
  backgrounds/     # desktop wallpapers
setup.sh           # main setup script
```

## Inspiration

- [Omarchy](https://github.com/basecamp/omarchy) — DHH's opinionated Linux desktop environment
- [Hyprland](https://github.com/hyprwm/Hyprland) — dynamic tiling Wayland compositor for Linux
