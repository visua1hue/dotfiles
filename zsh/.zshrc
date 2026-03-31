# [Init]

# Homebrew
if [[ -f "/opt/homebrew/bin/brew" ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

export _ZO_DOCTOR=0

# Zinit plugin manager
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
if [ ! -d "$ZINIT_HOME" ]; then
    mkdir -p "$(dirname "$ZINIT_HOME")"
    git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi
source "${ZINIT_HOME}/zinit.zsh"

# NVM (eager in Claude Code / non-interactive, lazy otherwise)
export NVM_DIR="$HOME/.nvm"

if [[ -n "$CLAUDE_CODE" || -n "$CLAUDE_CODE_TERM" || ! -o interactive ]]; then
    [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && . "/opt/homebrew/opt/nvm/nvm.sh"
else
    _load_nvm() {
        unset -f nvm node npm npx pnpm
        [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && . "/opt/homebrew/opt/nvm/nvm.sh"
    }
    nvm()  { _load_nvm && nvm "$@"; }
    node() { _load_nvm && node "$@"; }
    npm()  { _load_nvm && npm "$@"; }
    npx()  { _load_nvm && npx "$@"; }
    pnpm() { _load_nvm && pnpm "$@"; }
fi

# [Interactive Shell]

if [[ -o interactive ]]; then
  eval "$(oh-my-posh init zsh --config ~/.config/zsh/zen.toml)"
  source ~/.config/zsh/modules.zsh
  source ~/.config/zsh/keybindings.zsh
  eval "$(zoxide init --cmd cd zsh)"
  [ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"
fi

# [PATH Exports]

export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_ENV_HINTS=1
export HOMEBREW_NO_AUTO_UPDATE=1
export BUN_INSTALL="$HOME/.bun"
export PATH="$HOME/.local/bin:$BUN_INSTALL/bin:$PATH"