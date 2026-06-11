#!/usr/bin/env bash
# symlink.sh — symlink files from dotfiles/config/ into $HOME.
#
# Idempotent: re-runs replace existing symlinks. Top-level dotfiles are linked
# directly. ~/.config/ is linked per-subdirectory so coexisting tools (that
# write to ~/.config themselves) are not clobbered.

set -euo pipefail

DOTFILES="${DOTFILES:-$HOME/dotfiles}"
SRC="$DOTFILES/config"

link() {
  local src="$SRC/$1"
  local dst="$HOME/$1"
  if [ ! -e "$src" ]; then
    echo "skip: $src missing"
    return
  fi
  ln -sfn "$src" "$dst"
  echo "link: $dst -> $src"
}

mkdir -p "$HOME/.config"

# Top-level dotfiles
link .alacritty.toml
link .gitconfig
link .gitignore_global
link .npmrc
link .p10k.zsh
link .tmux.conf
link .vimrc
link .zshenv
link .zshrc

# ~/.config subdirectories (linked individually so other tools' state survives)
for sub in "$SRC/.config"/*; do
  [ -e "$sub" ] || continue
  name="$(basename "$sub")"
  ln -sfn "$sub" "$HOME/.config/$name"
  echo "link: $HOME/.config/$name -> $sub"
done
