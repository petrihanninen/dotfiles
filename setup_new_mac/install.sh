#!/bin/bash

# Update macOS
softwareupdate -i -a

# Install xcode cli
xcode-select --install
sudo xcodebuild -license



# SSH
[ ! -d ~/.ssh ] && mkdir ~/.ssh
[ ! -f ~/.ssh/config ] && touch ~/.ssh/config

ssh-keygen -t ed25519 -C "hello@petrihanninen.com" -f ~/.ssh/identity

echo << EOF
Host *
  AddKeysToAgent yes
  UseKeychain yes
  IdentityFile ~/.ssh/identity
EOF


# Key to github
cat ~/.ssh/identity.pub | pbcopy
echo "Public key copied to clipboard, add it to github settings. Remember to delete old keys if applicable"
echo "    https://github.com/settings/ssh/new"

# Wait for confirm before continue
while [ true ]; do
  read -n 1 k <&1
  if [ $k = c ]; then
    exit;
  else
    echo "Press 'c' to continue"
  fi
done



# Symlink files
for f in $(ls ./config); do
  ln -sf $HOME/dotfiles/config/$f $HOME/$f
done

