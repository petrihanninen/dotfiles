s="dotfiles"
path="$HOME/dotfiles"

cd "$path"

tmux has-session -t $s 2>/dev/null

if [ $? != 0 ]; then
  tmux new-session -d -s $s

  # Shell
  w=0
  tmux rename-window -t $s:$w "shell"
  tmux send-keys -t $s:$w "cd $path" C-m

  # Editor
  w=1
  tmux new-window -t $s:$w -n "nvim"
  tmux send-keys -t $s:$w "cd $path" C-m
  tmux send-keys -t $s:$w "v" C-m
fi

tmux attach-session -t $s
