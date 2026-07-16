# shell/path.sh — PATH additions and tool integrations (bash + zsh).
#
# Everything here is guarded by existence and idempotent, so it is safe to
# source in any order and on any machine.

# Prepend a dir to PATH only if it exists and isn't already there.
_dot_path_prepend() {
  case ":$PATH:" in
    *":$1:"*) ;;
    *) [ -d "$1" ] && PATH="$1:$PATH" ;;
  esac
}

_dot_path_prepend "$HOME/.local/bin"
_dot_path_prepend "$HOME/.cargo/bin"
_dot_path_prepend "$HOME/bin"

# Rust (cargo env, if present)
[ -f "$HOME/.cargo/env" ] && . "$HOME/.cargo/env"

# pnpm (location differs by platform: XDG data dir on Linux, ~/Library on macOS)
if [ "${DOTFILES_OS:-}" = macos ]; then
  export PNPM_HOME="${PNPM_HOME:-$HOME/Library/pnpm}"
else
  export PNPM_HOME="${PNPM_HOME:-$HOME/.local/share/pnpm}"
fi
_dot_path_prepend "$PNPM_HOME"

# gvm (Go version manager), if installed
[ -s "$HOME/.gvm/scripts/gvm" ] && . "$HOME/.gvm/scripts/gvm"

# direnv: zsh is wired via z4h's zstyle; hook bash directly here.
if command -v direnv >/dev/null 2>&1 && [ -n "${BASH_VERSION:-}" ]; then
  eval "$(direnv hook bash)"
fi

# Google Cloud SDK (checked into ~/code on these machines)
_dot_gcloud="$HOME/code/google-cloud-sdk"
if [ -d "$_dot_gcloud" ]; then
  if [ -n "${ZSH_VERSION:-}" ]; then _dot_inc=zsh; else _dot_inc=bash; fi
  [ -f "$_dot_gcloud/path.$_dot_inc.inc" ] && . "$_dot_gcloud/path.$_dot_inc.inc"
  [ -f "$_dot_gcloud/completion.$_dot_inc.inc" ] && . "$_dot_gcloud/completion.$_dot_inc.inc"
  unset _dot_inc
fi
unset _dot_gcloud

export PATH
