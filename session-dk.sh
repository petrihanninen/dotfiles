s="duunitori-kubernetes"
path="$HOME/code/dt/duunitori-kubernetes"

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

  # k9s
  w=2
  tmux new-window -t $s:$w -n "k9s"
  tmux send-keys -t $s:$w "cd $path" C-m
  tmux send-keys -t $s:$w "k9s" C-m
fi

tmux attach-session -t $s
