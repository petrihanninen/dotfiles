# shell/terminal.sh — general shell aliases and helpers (bash + zsh).

# Fix sops missing key file
export SOPS_AGE_KEY_FILE="$HOME/.config/sops/age/keys.txt"

# Env vars (machine/work-specific, optional)
[ -f "$HOME/.env" ] && . "$HOME/.env"

# Make a directory and cd into it
mkcd() {
  mkdir -p "$1" && cd "$1" || return
}

# Go to code dir (note: shadowed by the `cc` alias below, kept for reference)
cc() {
  if [ "$1" ]; then
    cd "$HOME/code/$1" || return
  else
    cd "$HOME/code" || return
  fi
}

# Better ls
alias ll='ls -lAh '

# Copy & paste (pbcopy/pbpaste are shimmed on Linux in platform.sh)
alias copy='pbcopy < '
alias paste='pbpaste > '

# Run command & save output to log.tmp.txt in addition to stdout
logger() {
  "$@" 2>&1 | tee log.tmp.txt
}

# Python
alias p="python3"

# Preferred editor
export EDITOR="nvim"
export GITHUB_EDITOR="$EDITOR"

# Neovim
alias v="nvim . "

# Ngrok completion
if command -v ngrok >/dev/null 2>&1; then
  eval "$(ngrok completion)"
fi

# Toggle Alacritty light/dark theme (uses cross-platform sedi from platform.sh)
tl() {
  sedi "1s|.*|import = [\"~/.config/alacritty/themes/themes/gruvbox_material_hard_light.toml\"]|" "$HOME/dotfiles/config/.alacritty.toml"
}
td() {
  sedi "1s|.*|import = [\"~/.config/alacritty/themes/themes/gruvbox.toml\"]|" "$HOME/dotfiles/config/.alacritty.toml"
}

# Tmux session helper
ts() {
  if [ $# -eq 0 ]; then
    echo "Usage: ts <cmd>"
    return 1
  fi
  if [ "$1" = "k" ]; then
    tmux kill-session -t "$2"
  fi
  if [ "$1" = "n" ]; then
    tmux new-session -ds "$2"
    tmux switch-client -t "$2"
  fi
}

# Tmux pane helper
tp() {
  if [ $# -eq 0 ]; then
    echo "Usage: tp <cmd>"
    return 1
  fi
  if [ "$1" = "s" ]; then
    tmux swap-pane -s "$2" -t "$3"
  fi
}

# Claude Code
alias c="claude "
alias cc="claude --dangerously-skip-permissions "
