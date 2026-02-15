# //////////////////// ZSH Configuration ////////////////////////////

# Homebrew initialization (macOS)
if [[ -f "/opt/homebrew/bin/brew" ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Oh My Posh prompt
eval "$(oh-my-posh init zsh --config ~/.config/zsh/zen.toml)"

# Zinit plugin manager setup
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
if [ ! -d "$ZINIT_HOME" ]; then
    mkdir -p "$(dirname "$ZINIT_HOME")"
    git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi
source "${ZINIT_HOME}/zinit.zsh"

# Load plugins, completions, visual enhancements, integrations
source ~/.config/zsh/modules.zsh
# Load keyboard bindings, history and aliases
source ~/.config/zsh/keybindings.zsh

# Node Version Manager (NVM)
export NVM_DIR="$HOME/.nvm"
# Placeholder functions that load NVM on first use
nvm() {
    unset -f nvm node npm npx
    [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && . "/opt/homebrew/opt/nvm/nvm.sh"
    nvm "$@"
}

node() {
    unset -f nvm node npm npx
    [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && . "/opt/homebrew/opt/nvm/nvm.sh"
    node "$@"
}

npm() {
    unset -f nvm node npm npx
    [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && . "/opt/homebrew/opt/nvm/nvm.sh"
    npm "$@"
}

npx() {
    unset -f nvm node npm npx
    [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && . "/opt/homebrew/opt/nvm/nvm.sh"
    npx "$@"
}