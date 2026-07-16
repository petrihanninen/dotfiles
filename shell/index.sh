# shell/index.sh — entry point sourced by both bash and zsh.
#
# Sourced from ~/.bashrc (Linux/bash) and from ~/.zshrc (macOS/zsh). Loads the
# platform shims first (they define DOTFILES_OS and the clipboard/sed/locale
# helpers the other files rely on), then everything else in the directory.

DOTFILES_SHELL_DIR="${DOTFILES_SHELL_DIR:-$HOME/dotfiles/shell}"

# Platform detection + shims must come first.
[ -f "$DOTFILES_SHELL_DIR/platform.sh" ] && . "$DOTFILES_SHELL_DIR/platform.sh"

for _dotfile in "$DOTFILES_SHELL_DIR"/*.sh; do
  case "$_dotfile" in
    */index.sh | */platform.sh) continue ;;  # index self; platform already sourced
  esac
  [ -r "$_dotfile" ] && . "$_dotfile"
done
unset _dotfile
