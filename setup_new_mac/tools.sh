#!/bin/zsh

# Homebrew
# Install homebrew
echo "Installing homebrew"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Add to path
(
  echo
  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"'
) >>"$HOME/.zprofile"
eval "$(/opt/homebrew/bin/brew shellenv)"

# Git
brew install gh

# CLI  tools
brew install ripgrep
brew install fd
brew install wget
brew install jq
brew install gnu-sed
brew install gpg
brew install jesseduffield/lazygit/lazygit

# Fancy CLI stuff
brew install --cask alacritty
brew install tmux
brew install neovim
brew install go php rust lua luarocks

# Node
brew install nvm
nvm install --lts
brew install pnpm

# Devving
brew install colima docker docker-compose docker-buildx direnv
brew install kubectl
brew install awscli

# Other Apps
brew install spotify
brew install raycast
brew install zen-browser
brew install google-chrome

