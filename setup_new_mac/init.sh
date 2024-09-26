#!/bin/bash

## Install XCode CLI tools
echo "Updating macOS"
softwareupdate -i -a

echo "Installing xcode"
xcode-select --install
sudo xcodebuild -license

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

## SSH
d="$HOME/.ssh"
echo "Installing ssh keys"
mkdir -p "$HOME/ssh" || echo "SSH dir already exists, continuing.."
ssh-keygen -t ed25519 -C "hello@petrihanninen.com" -f $d/identity

echo "Host *" >>"$d/config"
echo "  AddKeysToAgent yes" >>"$d/config"
echo "  UseKeychain yes" >>"$d/config"
echo "  IdentityFile $d/identity" >>.ssh/config

# Key to github
cat $d/identity.pub | pbcopy
echo "Public ssh key copied to clipboard, add it to github settings. Remember to delete old keys if applicable"
echo "    https://github.com/settings/ssh/new"

## Dotfiles
echo "Cloning dotfiles"
git clone git@github.com:petrihanninen/dotfiles.git "$HOME"
