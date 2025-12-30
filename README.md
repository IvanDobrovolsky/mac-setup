# Minimal Mac Setup

## Structure
- `dotfiles/`: Configuration files (nvim, yabai, skhd).
- `assets/`: Backgrounds and fonts.
- `scripts/`: Install scripts.
- `setup.sh`: Main setup script.

## Installation

```bash
./setup.sh
```

## Manual Steps Required

### 1. SIP (System Integrity Protection)
For `yabai` to control windows fully (switch spaces, focus), you may need to disable SIP or configure it partially.
- See: [Yabai Wiki - Disabling SIP](https://github.com/koekeishiya/yabai/wiki/Disabling-System-Integrity-Protection)

### 2. Accessibility Permissions
Grant Accessibility permissions to:
- `yabai`
- `skhd`
- `Terminal` (or your terminal emulator, e.g., Ghostty)

### 3. VS Code / Cursor Extensions
- Install the `Catppuccin Mocha` theme extension.
- Install the `VSCode Neovim` extension.

### 4. Ghostty
If Ghostty is not installed via brew (it's in beta), install manually from [mitchellh.com/ghostty](https://mitchellh.com/ghostty).

