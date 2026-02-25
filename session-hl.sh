s="homelab"
path="$HOME/code/personal/homelab"

cd "$path"

tmux has-session -t $s 2>/dev/null

if [ $? != 0 ]; then
  tmux new-session -d -s $s

  # Editor
  w=1
  tmux rename-window -t $s:$w "nvim"
  tmux send-keys -t $s:$w "cd $path" C-m
  tmux send-keys -t $s:$w "v" C-m

  # Claude
  w=2
  tmux new-window -t $s:$w -n "claude"
  tmux send-keys -t $s:$w "cd $path" C-m
  tmux send-keys -t $s:$w "claude" C-m

  # Servers
  w=3
  tmux new-window -t $s:$w -n "srv"
  tmux send-keys -t $s:$w "cd $path" C-m

  # Shell
  w=4
  tmux new-window -t $s:$w -n "zsh"
  tmux send-keys -t $s:$w "cd $path" C-m
fi

if [ -n "$TMUX" ]; then
  tmux switch-client -t $s
else
  tmux attach-session -t $s
fi
