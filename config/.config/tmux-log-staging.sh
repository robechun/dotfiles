#!/bin/sh

tmux split-window -h -p 50
tmux select-pane -t 0
tmux send-keys 'logstagingwork' C-m

tmux select-pane -t 1
tmux send-keys 'logstagingexp' C-m
