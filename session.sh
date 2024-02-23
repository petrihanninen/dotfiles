#!/bin/bash

s="duunitori"
cd "$HOME/code/dt"

tmux new-session -d -s $s

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
tmux split-window -h -t $s:$w
tmux send-keys -t $s:$w "cdb; dcu; dp" C-m

# Duunitori5
w=3
tmux new-window -t $s:$w -n "duunitori5"
tmux send-keys -t $s:$w "cdt; v" C-m
tmux split-window -h -t $s:$w
tmux send-keys -t $s:$w "cdt; dcu; dp" C-m
