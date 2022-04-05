#!/bin/sh

Session="Workspace"

tmux has-session -t $Session 2>/dev/null

if [ $? -ne 0 ]; then
  tmux new-session -s "$Session" \; \
      split-window -v -p 75 \; \
      split-window -h -p 30 \; \
      send-keys 'htop' C-m \; \
      select-pane -t 1 \; \
      split-window -v \; \
      send-keys 'weechat' C-m \;
else
  tmux attach-session -t $Session
fi

