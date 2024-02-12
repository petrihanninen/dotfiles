# Symlink dotfiles
link() {
	ln -s "$HOME/dotfiles/config/$1" "$HOME/$1"
}

mkdir "$HOME/config"
link config/gh
link config/nvim
link .gitconfig
link .gitignore_global
link .npmrc
link .p10k.zsh
link .tmux.conf
link .vimrc
link .zshenv
link .zshrc



