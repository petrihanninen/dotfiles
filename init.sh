#!/usr/bin/env bash
# init.sh — bootstrap a new machine with global dotfiles + tools.
#
# Runs the cross-platform installer, applies macOS defaults if on a Mac, and
# symlinks config files into $HOME. Safe to re-run.

set -euo pipefail

dir="$(cd "$(dirname "$0")" && pwd)/install"

"$dir/install.sh" "$@"

if [ "$(uname -s)" = "Darwin" ]; then
  "$dir/macos-defaults.sh"
fi

"$dir/symlink.sh"
