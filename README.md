# dotfiles

Personal configuration files for vim, zsh, ghostty, and herdr.

## What's Included

- **vimrc** - Vim config with sensible defaults, custom keybindings, and Catppuccin Mocha theme
- **vim/pack/themes** - Catppuccin vim colorscheme (git submodule)
- **zshrc** - Zsh config with Oh My Zsh, aliases, utility functions, and history settings
- **zsh/** - Catppuccin zsh-syntax-highlighting theme (git submodule)
- **zprofile** - Homebrew shell environment setup
- **git/ignore** - Global gitignore
- **ghostty/config** - Ghostty terminal config with Catppuccin Mocha theme and JetBrainsMono Nerd Font
- **herdr/config.toml** - Herdr agent multiplexer config (onboarding off, agent panel sorted by spaces)
- **Brewfile** - Homebrew formulae and casks this setup expects

## Install

```bash
git clone --recurse-submodules git@github.com:rycummins/dotfiles.git ~/.dotfiles

brew bundle --file=~/.dotfiles/Brewfile

ln -s ~/.dotfiles/vimrc ~/.vimrc
mkdir -p ~/.vim && ln -s ~/.dotfiles/vim/pack ~/.vim/pack
ln -s ~/.dotfiles/zshrc ~/.zshrc
ln -s ~/.dotfiles/zsh ~/.zsh
ln -s ~/.dotfiles/zprofile ~/.zprofile
mkdir -p ~/.config/git && ln -s ~/.dotfiles/git/ignore ~/.config/git/ignore
ln -s ~/.dotfiles/ghostty/config ~/.config/ghostty/config
mkdir -p ~/.config/herdr && ln -s ~/.dotfiles/herdr/config.toml ~/.config/herdr/config.toml
```

Herdr's agent hook scripts are managed by herdr itself and are not tracked here. Reinstall them with:

```bash
herdr integration install claude
```

If the repo was cloned without `--recurse-submodules`, run `git submodule update --init` to fetch the themes.

`brew bundle` above covers `zsh-autosuggestions` and `zsh-syntax-highlighting`. Oh My Zsh still needs a separate install (`sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"`, keep the existing `.zshrc`).

## Local Overrides

Machine-specific config (credentials, work tools, etc.) can be added to `~/.zshrc.local`. It will be sourced automatically if it exists.
