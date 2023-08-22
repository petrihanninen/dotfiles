# Symlink dotfiles
link() {
  if [ -f "$1" ]; then
    echo "File $1 exists, skipping"
  else
    ln -s "/Users/petrihanninen/dotfiles/$1" "$1"
  fi
}


# AWS
link .aws/config
link .aws/credentials

# Github CLI
link .config/gh/hosts.yml
link .config/gh/config.yml

# General
link .gitconfig
link .gitignore_global
link .npmrc
link .p10k.zsh
link .tmux.conf
link .vimrc
link .zshenv
link .zshrc
link gruvbox.terminal