s="dt"
path="$HOME/code/dt"
dpath="$path/duunitori5"
npath="$path/duunitori-next"

cd $path

tmux has-session -t $s 2>/dev/null

if [ $? != 0 ]; then
  tmux new-session -d -s $s

  # duunitori5
  w=1
  tmux rename-window -t $s:$w "dt5"
  tmux send-keys -t $s:$w "cd $dpath" C-m
  tmux send-keys -t $s:$w "v" C-m
  tmux split-window -ht $s:$w
  tmux send-keys -t $s:$w "cd $dpath" C-m
  tmux send-keys -t $s:$w "claude" C-m

  # duunitori-next
  w=2
  tmux new-window -t $s:$w -n "next"
  tmux send-keys -t $s:$w "cd $npath" C-m
  tmux send-keys -t $s:$w "v" C-m
  tmux split-window -ht $s:$w
  tmux send-keys -t $s:$w "cd $npath" C-m
  tmux send-keys -t $s:$w "claude" C-m

  # Servers
  w=3
  tmux new-window -t $s:$w -n "srv"
  # duunitori5
  tmux send-keys -t $s:$w "cd $dpath" C-m
  tmux send-keys -t $s:$w "make up" C-m
  # duunitori-next
  tmux split-window -ht $s:$w
  tmux send-keys -t $s:$w "cd $npath" C-m
  tmux send-keys -t $s:$w "pnpm dev --force --filter=duunitori.fi --filter=jobbsafari.se" C-m
  # ciam
  tmux split-window -vt $s:$w
  tmux send-keys -t $s:$w "cd $npath" C-m
  tmux send-keys -t $s:$w "pnpm dev --force --filter=ciam-ui" C-m
fi

if [ -n "$TMUX" ]; then
  tmux switch-client -t $s
else
  tmux attach-session -t $s
fi

