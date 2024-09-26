# Symlink dotfiles
link() {
	ln -s "$HOME/dotfiles/config/$1" "$HOME/$1"
}

mkdir "$HOME/config"

link .alacritty.toml
link .gitconfig
link .gitignore_global
link .npmrc
link .p10k.zsh
link .tmux.conf
link .vimrc
link .zshenv
link .zshrc
