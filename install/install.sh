#!/usr/bin/env bash
# install.sh — install dev tooling using whichever package manager is available.
#
# Usage: install.sh [--pm <brew|apt|dnf|pacman>] [--no-casks]
#
# Auto-detects the package manager unless --pm is passed. On macOS, also
# installs GUI casks unless --no-casks is given. On Linux, casks are skipped.

set -euo pipefail

PM=""
NO_CASKS=0

usage() {
  sed -n '2,8p' "$0"
}

while [ $# -gt 0 ]; do
  case "$1" in
    --pm) PM="$2"; shift 2 ;;
    --no-casks) NO_CASKS=1; shift ;;
    -h|--help) usage; exit 0 ;;
    *) echo "Unknown argument: $1" >&2; usage; exit 1 ;;
  esac
done

detect_pm() {
  if command -v brew >/dev/null 2>&1; then echo brew
  elif command -v apt-get >/dev/null 2>&1; then echo apt
  elif command -v dnf >/dev/null 2>&1; then echo dnf
  elif command -v pacman >/dev/null 2>&1; then echo pacman
  else echo ""
  fi
}

if [ -z "$PM" ]; then
  if [ "$(uname -s)" = "Darwin" ] && ! command -v brew >/dev/null 2>&1; then
    PM="brew"
  else
    PM="$(detect_pm)"
  fi
fi

if [ -z "$PM" ]; then
  echo "No supported package manager detected." >&2
  echo "Install one of brew/apt/dnf/pacman or pass --pm explicitly." >&2
  exit 1
fi

echo "==> Using package manager: $PM"

# Bootstrap Homebrew on macOS if missing.
if [ "$PM" = "brew" ] && ! command -v brew >/dev/null 2>&1; then
  echo "==> Installing Homebrew"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  if [ -x /opt/homebrew/bin/brew ]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
  elif [ -x /usr/local/bin/brew ]; then
    eval "$(/usr/local/bin/brew shellenv)"
  fi
fi

# Refresh package indices.
case "$PM" in
  apt) sudo apt-get update ;;
  dnf) sudo dnf check-update || true ;;
  pacman) sudo pacman -Sy --noconfirm ;;
esac

install_pkg() {
  local pkg="$1"
  [ "$pkg" = "-" ] && return 0
  case "$PM" in
    brew)   brew install "$pkg" ;;
    apt)    sudo apt-get install -y "$pkg" ;;
    dnf)    sudo dnf install -y "$pkg" ;;
    pacman) sudo pacman -S --noconfirm --needed "$pkg" ;;
  esac
}

# Each entry is "logical_name [pm=name ...]".
# A token "pm=-" means skip on that PM. Missing override falls back to logical_name.
CLI_TOOLS=(
  "gh"
  "ripgrep"
  "fd                 apt=fd-find"
  "wget"
  "jq"
  "gnu-sed            apt=- dnf=- pacman=-"
  "gnupg"
  "lazygit            apt=-"
  "tmux"
  "neovim"
  "direnv"
  "bat                apt=batcat"
  "go                 apt=golang-go dnf=golang"
  "rust               apt=- dnf=rust pacman=rust"
  "luarocks"
  "kubectl            apt=- dnf=kubernetes-client"
  "awscli             pacman=aws-cli"
  "k9s                apt=-"
  "docker             apt=docker.io"
  "docker-compose"
  "docker-buildx      apt=- dnf=-"
  "sops               apt=-"
  "age                apt=-"
  "helm               apt=-"
  "pipx"
)

pkg_for() {
  local spec="$1" pm="$2"
  local logical="${spec%% *}"
  local rest="${spec#"$logical"}"
  rest="${rest# }"
  if [ -z "$rest" ]; then echo "$logical"; return; fi
  for tok in $rest; do
    case "$tok" in
      "$pm="*) echo "${tok#"$pm"=}"; return ;;
    esac
  done
  echo "$logical"
}

for spec in "${CLI_TOOLS[@]}"; do
  pkg="$(pkg_for "$spec" "$PM")"
  if [ "$pkg" = "-" ]; then
    echo "==> Skipping $(echo "$spec" | awk '{print $1}') on $PM"
    continue
  fi
  echo "==> Installing $pkg"
  install_pkg "$pkg" || echo "    (failed; continuing)"
done

# Node toolchain: nvm + pnpm.
if [ "$PM" = "brew" ]; then
  install_pkg nvm || true
  install_pkg pnpm || true
  install_pkg colima || true
else
  if [ ! -d "$HOME/.nvm" ]; then
    echo "==> Installing nvm via official script"
    curl -fsSL https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash || true
  fi
  if ! command -v pnpm >/dev/null 2>&1; then
    echo "==> Installing pnpm via official script"
    curl -fsSL https://get.pnpm.io/install.sh | sh - || true
  fi
fi

# Rustup on Linux (brew has rust above).
if [ "$PM" != "brew" ] && ! command -v rustup >/dev/null 2>&1; then
  echo "==> Installing rustup"
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y || true
fi

# macOS GUI apps.
if [ "$PM" = "brew" ] && [ "$NO_CASKS" -eq 0 ]; then
  CASKS=(
    alacritty
    raycast
    spotify
    google-chrome
    zen-browser
    font-fira-code
    font-fira-code-nerd-font
  )
  for cask in "${CASKS[@]}"; do
    echo "==> Installing cask $cask"
    brew install --cask "$cask" || echo "    (failed; continuing)"
  done
fi

echo "==> Done."
