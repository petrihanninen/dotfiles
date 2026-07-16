# shell/node.sh — Node / nvm setup (bash + zsh).
#
# Loads nvm from wherever it lives on this platform, then wires up the
# switch-Node-version-on-cd behaviour. zsh uses its native chpwd hook (see
# zsh/node.zsh); bash gets the PROMPT_COMMAND equivalent below.

export NVM_DIR="${NVM_DIR:-$HOME/.nvm}"

# Candidate nvm locations: official installer (Linux) and Homebrew (macOS).
for _nvm_prefix in "$NVM_DIR" /opt/homebrew/opt/nvm /usr/local/opt/nvm; do
  if [ -s "$_nvm_prefix/nvm.sh" ]; then
    . "$_nvm_prefix/nvm.sh"
    break
  fi
done
unset _nvm_prefix

alias reset-node='rm -rf node_modules && npm i'

# Auto-switch Node version from .nvmrc when changing directory.
# (zsh handles this via add-zsh-hook chpwd in zsh/node.zsh.)
if [ -n "${BASH_VERSION:-}" ] && command -v nvm >/dev/null 2>&1; then
  _dot_load_nvmrc() {
    if [ -f .nvmrc ] && [ -r .nvmrc ]; then
      nvm use
    elif [ "$(nvm version)" != "$(nvm version default)" ]; then
      echo "Reverting to nvm default version"
      nvm use default
    fi
  }
  # Run _dot_load_nvmrc once per directory change (PROMPT_COMMAND fires before
  # every prompt; we short-circuit when $PWD hasn't moved).
  _dot_nvmrc_hook() {
    if [ "$PWD" != "${_DOT_NVMRC_LAST_PWD:-}" ]; then
      _DOT_NVMRC_LAST_PWD="$PWD"
      _dot_load_nvmrc
    fi
  }
  case ";${PROMPT_COMMAND:-};" in
    *";_dot_nvmrc_hook;"*) ;;  # already installed
    *) PROMPT_COMMAND="_dot_nvmrc_hook;${PROMPT_COMMAND:-}" ;;
  esac
fi
