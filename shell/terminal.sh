# shell/terminal.sh — general shell aliases and helpers (bash + zsh).

# Fix sops missing key file
export SOPS_AGE_KEY_FILE="$HOME/.config/sops/age/keys.txt"

# Env vars (machine/work-specific, optional)
[ -f "$HOME/.env" ] && . "$HOME/.env"

# Make a directory and cd into it
mkcd() {
  mkdir -p "$1" && cd "$1" || return
}

# Go to code dir (note: shadowed by the `cc` alias below, kept for reference)
cc() {
  if [ "$1" ]; then
    cd "$HOME/code/$1" || return
  else
    cd "$HOME/code" || return
  fi
}

# Better ls
alias ll='ls -lAh '

# Copy & paste (pbcopy/pbpaste are shimmed on Linux in platform.sh)
alias copy='pbcopy < '
alias paste='pbpaste > '

# Run command & save output to log.tmp.txt in addition to stdout
logger() {
  "$@" 2>&1 | tee log.tmp.txt
}

# Python
alias p="python3"

# Preferred editor
export EDITOR="nvim"
export GITHUB_EDITOR="$EDITOR"

# Neovim
alias v="nvim . "

# Ngrok completion
if command -v ngrok >/dev/null 2>&1; then
  eval "$(ngrok completion)"
fi

# Toggle Alacritty light/dark theme (uses cross-platform sedi from platform.sh)
tl() {
  sedi "1s|.*|import = [\"~/.config/alacritty/themes/themes/gruvbox_material_hard_light.toml\"]|" "$HOME/dotfiles/config/.alacritty.toml"
}
td() {
  sedi "1s|.*|import = [\"~/.config/alacritty/themes/themes/gruvbox.toml\"]|" "$HOME/dotfiles/config/.alacritty.toml"
}

# Attach to a tmux session, creating it first if needed (default name: main)
tt() {
  tmux new-session -A -s "${1:-main}"
}

# Tmux session helper
ts() {
  if [ $# -eq 0 ]; then
    echo "Usage: ts <cmd>"
    return 1
  fi
  if [ "$1" = "k" ]; then
    tmux kill-session -t "$2"
  fi
  if [ "$1" = "n" ]; then
    tmux new-session -ds "$2"
    tmux switch-client -t "$2"
  fi
}

# Tmux pane helper
tp() {
  if [ $# -eq 0 ]; then
    echo "Usage: tp <cmd>"
    return 1
  fi
  if [ "$1" = "s" ]; then
    tmux swap-pane -s "$2" -t "$3"
  fi
}

# Claude Code
alias c="claude "
alias cc="claude --effort low -p --model sonnet --dangerously-skip-permissions"

# AWS
aws_login() {
	re='^[0-9]{6}$'
	code=$1

	if ! [[ $code =~ $re ]]
	then
		code=$(pbpaste)
		if ! [[ $code =~ $re ]]
		then
			echo "Usage: aws_login <one time password> or have the code in the clipboard"
			return 1
		fi
	fi

	creds_json="$(aws sts get-session-token --serial-number $AWS_MFA_ARN --profile duunitori-long-term --token-code $code)" || return 1
	key_id="$(jq -r '.Credentials.AccessKeyId' <<<"$creds_json")"
	secret="$(jq -r '.Credentials.SecretAccessKey' <<<"$creds_json")"
	token="$(jq -r '.Credentials.SessionToken' <<<"$creds_json")"
	expiry="$(jq -r '.Credentials.Expiration' <<<"$creds_json")"

	for profile in default duunitori
	do
		aws configure set aws_access_key_id "$key_id" --profile "$profile"
		aws configure set aws_secret_access_key "$secret" --profile "$profile"
		aws configure set aws_session_token "$token" --profile "$profile"
	done
	echo "session expires at $expiry"
}
