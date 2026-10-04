# [ZSH Module - ZSH Completion]
# sync on purpose: compinit inside zinit turbo causes repeated prompt redraws
# full rebuild at most once a day, cached (-C) otherwise
autoload -Uz compinit
() { if (( $# )); then compinit -C; else compinit; touch ~/.zcompdump; fi } ~/.zcompdump(N.mh-24)
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# [ZSH Modules - Plugin Manager: Zinit and OMZ Snippets]
zinit wait lucid for \
    blockf atpull'zinit creinstall -q .' \
        zsh-users/zsh-completions \
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
        zsh-users/zsh-syntax-highlighting \
    atload"_zsh_autosuggest_start" \
        zsh-users/zsh-autosuggestions \
    OMZP::command-not-found
