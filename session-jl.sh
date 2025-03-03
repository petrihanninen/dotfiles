s="jobbland-frontend"
path="$HOME/code/dt/jobbland-frontend"

cd $path

tmux has-session -t $s 2>/dev/null

if [ $? != 0 ]; then
  tmux new-session -d -s $s

  # Editor
  w=1
  tmux rename-window -t $s:$w "nvim"
  tmux send-keys -t $s:$w "cd $path" C-m
  tmux send-keys -t $s:$w "v" C-m

  # Servers
  w=2
  tmux new-window -t $s:$w -n "server"
  tmux send-keys -t $s:$w "cd $path" C-m
  tmux send-keys -t $s:$w "npm run build-dev" C-m
  tmux split-window -hvt $s:$w
  tmux send-keys -t $s:$w "cd $path" C-m
  tmux send-keys -t $s:$w "npm run run-dev" C-m

  # Shell
  w=3
  tmux new-window -t $s:$w -n "shell"
  tmux send-keys -t $s:$w "cd $path" C-m
fi

tmux attach-session -t $s
