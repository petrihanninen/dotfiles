# shell/platform.sh — OS detection and cross-platform shims (bash + zsh).
#
# Defines DOTFILES_OS and papers over the differences between macOS and Linux
# so the rest of the shared config can be written once: clipboard (pbcopy /
# pbpaste), in-place sed (sedi), and a sane locale.

# --- OS detection ------------------------------------------------------------
case "$(uname -s)" in
  Darwin) DOTFILES_OS=macos ;;
  Linux)  DOTFILES_OS=linux ;;
  *)      DOTFILES_OS=other ;;
esac
export DOTFILES_OS

# --- Locale ------------------------------------------------------------------
# A locale forwarded over SSH (e.g. LC_ALL=en_US.UTF-8 from a Mac) that isn't
# installed on this host makes every command print a setlocale warning. If the
# requested locale isn't available, fall back to an installed UTF-8 one.
if command -v locale >/dev/null 2>&1; then
  _dot_avail="$(locale -a 2>/dev/null | tr 'A-Z' 'a-z')"
  _dot_want="$(printf '%s' "${LC_ALL:-${LANG:-}}" | tr 'A-Z' 'a-z' | sed 's/utf-8/utf8/')"
  if [ -n "$_dot_want" ] && ! printf '%s\n' "$_dot_avail" | grep -qx "$_dot_want"; then
    unset LC_ALL LC_CTYPE
    if printf '%s\n' "$_dot_avail" | grep -qx 'c.utf8'; then
      export LANG=C.UTF-8
    fi
  fi
  unset _dot_avail _dot_want
fi

# --- Clipboard ---------------------------------------------------------------
# macOS ships pbcopy/pbpaste. Provide equivalents on Linux backed by whatever
# clipboard tool is installed (Wayland or X11).
if [ "$DOTFILES_OS" = linux ] && ! command -v pbcopy >/dev/null 2>&1; then
  if command -v wl-copy >/dev/null 2>&1 && [ -n "${WAYLAND_DISPLAY:-}" ]; then
    pbcopy()  { wl-copy; }
    pbpaste() { wl-paste; }
  elif command -v xclip >/dev/null 2>&1; then
    pbcopy()  { xclip -selection clipboard; }
    pbpaste() { xclip -selection clipboard -o; }
  elif command -v xsel >/dev/null 2>&1; then
    pbcopy()  { xsel --clipboard --input; }
    pbpaste() { xsel --clipboard --output; }
  fi
fi

# --- In-place sed ------------------------------------------------------------
# BSD sed (macOS) requires an argument to -i; GNU sed (Linux) must not have one.
sedi() {
  if [ "$DOTFILES_OS" = macos ]; then
    sed -i '' "$@"
  else
    sed -i "$@"
  fi
}
