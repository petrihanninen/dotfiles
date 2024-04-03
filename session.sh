#!/bin/bash

s="duunitori"
cd "$HOME/code/dt"

tmux new-session -d -s $s

# Dotfiles
w=0
tmux rename-window -t $s:$w "dotfiles"
tmux send-keys -t $s:$w "cd $HOME/dotfiles; v" C-m

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

# Jobbland
w=4
tmux new-window -t $s:$w -n "jobbland"
tmux send-keys -t $s:$w "cdj; v" C-m
tmux split-window -h -t $s:$w
tmux send-keys -t $s:$w "cdj" C-m

# Duunitori misc
w=5
tmux new-window -t $s:$w -n "duunitori-misc"
tmux send-keys -t $s:$w "cd duunitori-kubernetes; v" C-m
tmux split-window -ht $s:$w
tmux send-keys -t $s:$w "cd duunitori-terraform; v" C-m

# DWH
w=6
tmux new-window -t $s:$w -n "dwh"
tmux send-keys -t $s:$w "cd duunitori-warehouse; v" C-m
tmux split-window -ht $s:$w
tmux send-keys -t $s:$w "cd ga-jobentry-analytics; v" C-m
