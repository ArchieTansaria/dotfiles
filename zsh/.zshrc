# ==================================================
# Environment
# ==================================================

export ZSH="$HOME/.oh-my-zsh"

zstyle ':omz:update' mode reminder

if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='vim'
else
    export EDITOR='nvim'
fi

. "$HOME/.local/bin/env"

# ==================================================
# Functions
# ==================================================

cdf() {
    local dir
    dir=$(/usr/bin/find "${1:-.}" -type d 2>/dev/null | fzf +m) && cd "$dir"
}

mkcd() {
    mkdir -p "$1" && cd "$1"
}


cs() {
  local ls_flags=()
  local dir=""

  for arg in "$@"; do
    if [[ "$arg" == -* ]]; then
      ls_flags+=("$arg")
    else
      dir="$arg"
    fi
  done

  if [[ -n "$dir" ]]; then
    cd "$dir" || return 1
  fi

  ls "${ls_flags[@]}"
}

# ==================================================
# History
# ==================================================

HISTSIZE=10000
SAVEHIST=10000

setopt APPEND_HISTORY
setopt SHARE_HISTORY

setopt HIST_IGNORE_SPACE

setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_SAVE_NO_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_EXPIRE_DUPS_FIRST

# ==================================================
# Oh My Zsh
# ==================================================

plugins=(git z extract sudo web-search fzf)

source $ZSH/oh-my-zsh.sh

# ==================================================
# Colors
# ==================================================

export EZA_COLORS="\
fi=38;5;252:\
ex=38;5;144:\
un=38;5;245:\
gn=38;5;245:\
da=38;5;245:\
uu=38;5;245:\
gu=38;5;245:\
ur=38;5;245:\
uw=38;5;245:\
ux=38;5;245:\
gr=38;5;245:\
gw=38;5;245:\
gx=38;5;245"

# ==================================================
# Aliases
# ==================================================

# Git
alias gs="git status"
alias ga="git add ."
alias gc="git commit -m"
alias gco="git checkout"
alias gpl="git pull"

# Navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias ~='cd ~'

# Tmux
alias ta='tmux attach -t'
alias tls='tmux ls'
alias td='tmux detach'
alias tk='tmux kill-session'
alias tn='tmux new -s'

# Utilities
alias cat="bat"
alias grep="rg"
alias top="btop"
alias lg="lazygit"
alias reload='source ~/.zshrc'

# Eza
alias ls="eza --color=always --group-directories-first"
alias ll="eza -la --icons --group-directories-first"
alias la="eza -a --icons --group-directories-first"
alias tree="eza --tree --icons"

# ==================================================
# Runtime Integrations
# ==================================================

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

# ==================================================
# NVM Lazy Loading (Optional)
# ==================================================

export NVM_DIR="$HOME/.nvm"

if [[ -s "$(brew --prefix nvm)/nvm.sh" ]]; then

    lazy_load_nvm() {
        unset -f nvm node npm npx

        source "$(brew --prefix nvm)/nvm.sh"

        if [[ -s "$(brew --prefix nvm)/etc/bash_completion.d/nvm" ]]; then
            source "$(brew --prefix nvm)/etc/bash_completion.d/nvm"
        fi
    }

    nvm() {
        lazy_load_nvm
        nvm "$@"
    }

    node() {
        lazy_load_nvm
        node "$@"
    }

    npm() {
        lazy_load_nvm
        npm "$@"
    }

    npx() {
        lazy_load_nvm
        npx "$@"
    }
fi

# ==================================================
# Tmux
# ==================================================

if [ -z "$TMUX" ]; then
  tmux attach -t default || tmux new -s default
fi

# ==================================================
# Additional Tools
# ==================================================

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#565f89"

source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# ==================================================
# PATH
# ==================================================

# the .zshrc.local file contains the path entries
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local

# ==================================================
# Syntax Highlighting
# ==================================================

typeset -A ZSH_HIGHLIGHT_STYLES

ZSH_HIGHLIGHT_STYLES[command]='fg=default'
ZSH_HIGHLIGHT_STYLES[builtin]='fg=default'
ZSH_HIGHLIGHT_STYLES[alias]='fg=default'
ZSH_HIGHLIGHT_STYLES[function]='fg=default'

ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=#d67a8a'

ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=default'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=default'

ZSH_HIGHLIGHT_STYLES[path]='fg=#c0caf5'

source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
