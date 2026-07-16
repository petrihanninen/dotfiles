# zsh/node.zsh — zsh-only Node integration.
#
# nvm itself is loaded in shell/node.sh (shared). This file adds the zsh-only
# bit: automatically switch Node version when cd-ing into a dir with .nvmrc.

autoload -U add-zsh-hook

function load-nvmrc() {
  if [[ -f .nvmrc && -r .nvmrc ]]; then
    nvm use
  elif [[ $(nvm version) != $(nvm version default) ]]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}

if command -v nvm >/dev/null 2>&1; then
  add-zsh-hook chpwd load-nvmrc
  load-nvmrc
fi
