# //////////////////// ZSH Modules ////////////////////////////

# Plugin Manager: Zinit and OMZ Snippets
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions

zinit snippet OMZL::git.zsh
zinit snippet OMZP::git
zinit snippet OMZP::command-not-found

# ZSH Completion Adjustments
autoload -Uz compinit && compinit
zinit cdreplay -q

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no

# ZSH Prompt and Syntax (Visuals)
zmodload zsh/nearcolor

typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[command]='fg=#83d6c5'
ZSH_HIGHLIGHT_STYLES[alias]='fg=#83d6c5'
ZSH_HIGHLIGHT_STYLES[builtin]='fg=#83d6c5'
ZSH_HIGHLIGHT_STYLES[function]='fg=#83d6c5'
ZSH_HIGHLIGHT_STYLES[precommand]='fg=#83d6c5'
ZSH_HIGHLIGHT_STYLES[commandseparator]='fg=#83d6c5'

# Shell Integrations
eval "$(zoxide init --cmd cd zsh)"
