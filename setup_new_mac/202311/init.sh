#!/bin/bash

# Wait for confirm before continue
function waitforconfirm() {
	while [ true ]; do
	  read -n 1 k <&1
	  if [ $k = c ]; then
	    exit;
	  else
	    echo "Press 'c' to continue"
	  fi
	done
}
: '
# Homebrew
# Install homebrew
echo "Installing homebrew"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Add to path
(echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> /Users/petrihanninen/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"


## Install XCode CLI tools
echo "Updating macOS"
softwareupdate -i -a

echo "Installing xcode"
xcode-select --install
sudo xcodebuild -license


## Install Arc
echo << EOF
Install these by hand

Arc
https://arc.net

Dashlane Extension
https://chrome.google.com/webstore/detail/dashlane-%E2%80%94-password-manag/fdjamakpfbbddfjaooikfcpapjohcfmg
EOF

waitforconfirm

## SSH
echo "Installing ssh keys"
[ ! -d ~/.ssh ] && mkdir ~/.ssh
[ ! -f ~/.ssh/config ] && touch ~/.ssh/config

ssh-keygen -t ed25519 -C "hello@petrihanninen.com" -f ~/.ssh/identity

echo "Host *" >> ~/.ssh/config
echo "  AddKeysToAgent yes" >> .ssh/config
echo "  UseKeychain yes" >> .ssh/config
echo "  IdentityFile ~/.ssh/identity" >> .ssh/config


# Key to github
cat ~/.ssh/identity.pub | pbcopy
echo "Public ssh key copied to clipboard, add it to github settings. Remember to delete old keys if applicable"
echo "    https://github.com/settings/ssh/new"


## Dotfiles
echo "Cloning dotfiles"
git clone git@github.com:petrihanninen/dotfiles.git

