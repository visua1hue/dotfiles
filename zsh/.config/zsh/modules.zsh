# [ZSH Modules - Plugin Manager: Zinit and OMZ Snippets]
zinit wait lucid for \
    atload"_zsh_autosuggest_start" \
        zsh-users/zsh-autosuggestions \
    blockf atpull'zinit creinstall -q .' \
        zsh-users/zsh-completions

zinit wait lucid for \
    OMZP::command-not-found


# [ZSH Module - ZSH Completion]
autoload -Uz compinit
if [ $(date +'%j') != $(stat -f '%Sm' -t '%j' ~/.zcompdump 2>/dev/null) ]; then
  compinit
else
  compinit -C
fi

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no

# [ZSH Module - Syntax Highlighting]
zinit wait lucid for \
    atload"
        ZSH_HIGHLIGHT_STYLES[command]=fg=#ffffff
        ZSH_HIGHLIGHT_STYLES[arg0]=fg=#ffffff
        ZSH_HIGHLIGHT_STYLES[builtin]=fg=#ffffff
        ZSH_HIGHLIGHT_STYLES[alias]=fg=#ffffff
        ZSH_HIGHLIGHT_STYLES[function]=fg=#ffffff
        ZSH_HIGHLIGHT_STYLES[path]=fg=#a1a1aa
        ZSH_HIGHLIGHT_STYLES[default]=fg=#a1a1aa
        ZSH_HIGHLIGHT_STYLES[unknown-token]=fg=#f87171
    " \
    zsh-users/zsh-syntax-highlighting