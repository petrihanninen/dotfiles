#!/bin/bash

s="duunitori"
cd "$HOME/code/dt"

tmux new-session -d -s $s

# Jobbland
w=0
tmux new-window -t $s:$w -n "jobbland"
tmux send-keys -t $s:$w "cdj; v" C-m
tmux split-window -h -t $s:$w
tmux send-keys -t $s:$w "cdj" C-m

# Next
w=1
tmux new-window -t $s:$w -n "next"
tmux send-keys -t $s:$w "cdn; v" C-m
tmux split-window -ht $s:$w
tmux send-keys -t $s:$w "cdn; pnpm dev" C-m
tmux split-window -vft $s:$w
tmux send-keys -t $s:$w "cdn" C-m

# Backend
w=2
tmux new-window -t $s:$w -n "backend"
tmux send-keys -t $s:$w "cdb; v" C-m
tmux split-window -ht $s:$w
tmux send-keys -t $s:$w "cdb; dcu; dp" C-m
tmux split-window -ht $s:$w
tmux send-keys -t $s:$w "cdb; cd ../duunitori-backend-terraform; v" C-m

# Duunitori5
w=3
tmux new-window -t $s:$w -n "duunitori5"
tmux send-keys -t $s:$w "cdt; v" C-m
tmux split-window -ht $s:$w
tmux send-keys -t $s:$w "cdt; dcu; dp" C-m
tmux split-window -vft $s:$w
tmux send-keys -t $s:$w "cdt; cd ../duunitori-kubernetes; v" C-m
tmux split-window -vft $s:$w
tmux send-keys -t $s:$w "cdt; cd ../duunitori-terraform; v" C-m
tmux select-layout -t $s:$w main-vertical
