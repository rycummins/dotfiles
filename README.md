# dotfiles

Personal configuration files for vim, zsh, and ghostty.

## What's Included

- **vimrc** - Vim config with sensible defaults, custom keybindings, and Catppuccin Mocha theme
- **zshrc** - Zsh config with Oh My Zsh, aliases, utility functions, and history settings
- **ghostty/config** - Ghostty terminal config with Catppuccin Mocha theme and JetBrainsMono Nerd Font

## Install

```bash
git clone git@github.com:rycummins/dotfiles.git ~/.dotfiles

ln -s ~/.dotfiles/vimrc ~/.vimrc
ln -s ~/.dotfiles/zshrc ~/.zshrc
ln -s ~/.dotfiles/ghostty/config ~/.config/ghostty/config
```

## Local Overrides

Machine-specific config (credentials, work tools, etc.) can be added to `~/.zshrc.local`. It will be sourced automatically if it exists.
