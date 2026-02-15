# //////////////////// ZSH Modules ////////////////////////////

# Plugin Manager: Zinit and OMZ Snippets
zinit wait lucid for \
    atload"_zsh_autosuggest_start" \
        zsh-users/zsh-autosuggestions \
    blockf atpull'zinit creinstall -q .' \
        zsh-users/zsh-completions

zinit wait lucid atinit"zicompinit; zicdreplay" for \
    zsh-users/zsh-syntax-highlighting


zinit wait lucid for \
    OMZL::git.zsh \
    OMZP::git \
    OMZP::command-not-found


# ZSH Completion Adjustments
autoload -Uz compinit
if [ $(date +'%j') != $(stat -f '%Sm' -t '%j' ~/.zcompdump 2>/dev/null) ]; then
  compinit
else
  compinit -C
fi


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
