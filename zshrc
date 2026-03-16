# === Path & Environment ===
export GOPATH=$HOME/go
export GOROOT="$(/opt/homebrew/bin/brew --prefix golang)/libexec"
export PATH="${GOPATH}/bin:${GOROOT}/bin:${HOME}/Library/Python/3.9/bin:${HOME}/Library/Python/3.8/bin:/opt/homebrew/bin:${HOME}/bin:/usr/local/bin:${HOME}/.local/bin:${PATH}"

export EDITOR='vim'
export LANG=en_US.UTF-8
export GPG_TTY=$(tty)
export DEFAULT_USER=$(whoami)

# === Oh My Zsh ===
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="agnoster"
HIST_STAMPS="yyyy-mm-dd"

plugins=(
  git
  z
  aws
  docker
  docker-compose
  golang
  kubectl
)

SHOW_AWS_PROMPT=true

source $ZSH/oh-my-zsh.sh
RPROMPT=''

# === History ===
HISTSIZE=50000
SAVEHIST=50000
setopt SHARE_HISTORY          # Share history across sessions
setopt HIST_IGNORE_ALL_DUPS   # Remove older duplicate entries
setopt HIST_REDUCE_BLANKS     # Remove extra blanks from commands
setopt HIST_IGNORE_SPACE      # Don't record commands starting with space

# === Directory Navigation ===
setopt AUTO_CD                # cd by typing directory name
setopt AUTO_PUSHD             # Push dirs onto stack automatically
setopt PUSHD_IGNORE_DUPS      # No duplicates in dir stack
setopt PUSHD_SILENT            # Don't print stack after pushd/popd

# === Aliases: General ===
alias ll='ls -lAFh'
alias la='ls -A'
alias l='ls -CF'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias mkdir='mkdir -pv'
alias df='df -h'
alias du='du -h'
alias cp='cp -iv'
alias mv='mv -iv'
alias path='echo $PATH | tr ":" "\n"'
alias clear="printf '\033[H\033[2J'"

# === Aliases: Git ===
alias gs='git status'
alias gd='git diff'
alias gds='git diff --staged'
alias gl='git log --oneline --graph --decorate -20'
alias gla='git log --oneline --graph --decorate --all -30'
alias gco='git checkout'
alias gcb='git checkout -b'
alias gp='git pull'
alias gpu='git push'
alias gca='git commit --amend'

# === Aliases: Docker ===
alias dps='docker ps --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}"'
alias dcu='docker compose up -d'
alias dcd='docker compose down'
alias dcl='docker compose logs -f'

# === Functions ===
# Create dir and cd into it
mkcd() { mkdir -p "$1" && cd "$1" }

# Quick find file by name
ff() { find . -type f -iname "*$1*" }

# Quick grep with context
qg() { grep -rn --color=auto "$1" "${2:-.}" }

# Show top 20 most used commands
topcmd() { history | awk '{print $2}' | sort | uniq -c | sort -rn | head -20 }

# === Local overrides (machine-specific, not tracked) ===
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local

# === Plugins (must be last) ===
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/catppuccin-zsh-syntax-highlighting/themes/catppuccin_mocha-zsh-syntax-highlighting.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
