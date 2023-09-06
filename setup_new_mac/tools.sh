#!/bin/zsh

# Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install
.sh)"



# Git
brew install lazygit
brew install gh

# CLI  tools
brew install ripgrep
brew install fd
brew install trash

# Fancy CLI stuff
brew install --cask kitty
brew install tmux
brew install neovim

# Devving
brew install colima docker docker-compose docker-buildx direnv kubectl
brew install awscli
brew install pnpm 
brew install --cask runjs
brew install nvm

# Other Apps
brew install --cask arc
brew install --cask clipy
brew install --cask figma
brew install --cask fluor
brew install --cask itsycal
brew install --cask jukebox
brew install --cask rectangle
brew install --cask spotify
brew install --cask steam
brew install --cask tomatobar
brew install --cask visual-studio-code
brew install --cask whatsapp
brew install --cask zoom


# Not Brewable
cat << EOF
Dashlane extension: https://chrome.google.com/webstore/detail/dashlane-%E2%80%94-password-manag/fdjamakpfbbddfjaooikfcpapjohcfmg

EOF

