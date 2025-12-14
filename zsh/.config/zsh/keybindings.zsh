# //////////////////// Keyboard, History, Aliases ////////////////////////////

# Keybindings & History
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Aliases - Improved Version
alias ls='ls --color'
alias lsa='ls -a --color'

alias ..='cd ..'

# fd : Fast replacement for find
alias fdr='fd --type f'              # Recursively list files
alias fdd='fd --type d'              # Recursively list directories

# ripgrep : Fast recursive search
alias rg='rg'                        # Use 'rg' instead of 'grep' for searching

# jq : Command-line JSON processor
jq_pretty() { jq '.' "$1"; }         # Pretty-print JSON files
