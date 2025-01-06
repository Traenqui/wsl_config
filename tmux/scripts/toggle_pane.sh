#!/usr/bin/env bash

export TMUX_PANE_DIRECTION="bottom"

if [[ "$TMUX_PANE_DIRECTION" == "bottom" ]]; then
  tmux select-pane -U
elif [[ "$TMUX_PANE_DIRECTION" == "right" ]]; then
  tmux select-pane -L
fi

tmux resize-pane -Z
