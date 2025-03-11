#!/bin/zsh

# Homebrew
# Install homebrew
echo "Installing homebrew"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Add to path
(
  echo
  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"'
) >>/Users/petrihanninen/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

# Git
brew install gh

# CLI  tools
brew install ripgrep
brew install fd
brew install trash
brew install wget
brew install jq
brew install gnu-sed
brew install gpg

# Fancy CLI stuff
brew install --cask alacritty
brew install tmux
brew install neovim
brew install go php rust lua luarocks

# Devving
brew install colima docker docker-compose docker-buildx direnv kubectl
brew install awscli
brew install pnpm 
brew install --cask runjs

# NVM
brew install nvm
nvm install 20

# Other Apps
brew install --cask clipy
brew install --cask figma
brew install --cask itsycal
brew install --cask jukebox
brew install --cask rectangle
brew install --cask spotify
brew install --cask tomatobar
brew install --cask visual-studio-code
brew install --cask zoom
brew install raycast

