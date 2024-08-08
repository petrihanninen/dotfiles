# Fix charsets etc
export LANG='en_US.UTF-8'
export LC_ALL='en_US.UTF-8'


# Default rm to throwing things to trash, use del for immediate nuke
alias del='rm '
alias rm='trash '


# Make a directory and cd into it
function mkcd() {
  mkdir -p $1
  cd $1
}


# Go to code dir
function cc() {
  if [ "$1" ]; then
    cd "$HOME/code/$1"
  else
    cd "$HOME/code"
  fi
}


# Better ls
alias ll='ls -lAh '


# Copy & paste
alias copy='pbcopy < '
alias paste='pbpaste > '


# Run command & save output to log.tmp.txt in addition to stdout
function logger() {
  2>&1 @a | tee log.tmp.txt
  return
}


# Open VSCode
c() {
  if [ "$1" ]; then
    code $1
  else
    code .
  fi
}


# Python
alias p="python3"


# Preferred editor
EDITOR="nvim"
GITHUB_EDITOR=$EDITOR

# Neovim aliases
alias v="nvim . "
alias vim="nvim "


# Download data as csv over ssh
# Usage: ssh-csv <ssh user> <ssh host> <ssh private key> <db name> <db host> <db user> <query>
ssh-csv() {
  ssh $1@$2 -i $3 "psql -d $4 -h $5 -U $6 -c \"COPY ($7) TO STDOUT WITH CSV DELIMITER ';' HEADER\""
}

# Fix Kitty ssh
[ "$TERM" = "xterm-kitty" ] && alias ssh="kitty +kitten ssh"

# Ngrok
if command -v ngrok &>/dev/null; then
  eval "$(ngrok completion)"
fi

# Rust
export PATH="$PATH:/Users/petrihanninen/.cargo/bin"

# Toggle dark mode
tl() {
  sed -i '' "1s/.*/import = [\"~\/.config\/alacritty\/themes\/themes\/gruvbox_material_hard_light.toml\"]/" $HOME/dotfiles/config/.alacritty.toml
}

td() {
  sed -i '' "1s/.*/import = [\"~\/.config\/alacritty\/themes\/themes\/gruvbox.toml\"]/" $HOME/dotfiles/config/.alacritty.toml
}

