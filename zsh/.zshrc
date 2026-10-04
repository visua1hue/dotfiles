# [Init]

typeset -U path fpath # dedupe; brew shellenv also runs in ~/.zprofile

# Homebrew
if [[ -f "/opt/homebrew/bin/brew" ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi
export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_ENV_HINTS=1
export HOMEBREW_NO_AUTO_UPDATE=1

# Zinit plugin manager
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
if [ ! -d "$ZINIT_HOME" ]; then
    mkdir -p "$(dirname "$ZINIT_HOME")"
    git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi
source "${ZINIT_HOME}/zinit.zsh"

# NVM: default node on PATH without sourcing nvm.sh; nvm itself loads on first call
export NVM_DIR="$HOME/.nvm"
() {
    local ver=default i
    for i in 1 2 3 4; do # follow alias chain: default -> lts/* -> lts/<name> -> vX
        [[ -f $NVM_DIR/alias/$ver ]] || break
        ver=$(<$NVM_DIR/alias/$ver)
    done
    [[ $ver == (node|stable) ]] && ver=
    local bins=($NVM_DIR/versions/node/v${ver#v}*/bin(N/nOn)) # newest match first
    (( $#bins )) && path=($bins[1] $path)
}
nvm() { unfunction nvm; source /opt/homebrew/opt/nvm/nvm.sh; nvm "$@"; }

# [PATH Exports]

export BUN_INSTALL="$HOME/.bun"
path=($HOME/.local/bin $BUN_INSTALL/bin $path)
fpath+=($BUN_INSTALL) # _bun completion, picked up by compinit

# [Interactive Shell]

if [[ -o interactive ]]; then
    eval "$(oh-my-posh init zsh --config ~/.config/zsh/zen.toml)"
    precmd() { echo }
    source ~/.config/zsh/modules.zsh
    source ~/.config/zsh/keybindings.zsh
    eval "$(zoxide init --cmd cd zsh)" # must stay last
fi
