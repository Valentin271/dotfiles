#!/usr/bin/env bash

if [[ -f /tmp/cwd ]]; then
    # Needs `export PROMPT_COMMAND="pwd > /tmp/cwd"`
    WD=$(cat /tmp/cwd)
else
    WD=$(xprop -id $(xdotool getactivewindow) WM_NAME | grep -Po ': \K([^"]+)')
fi

xfce4-terminal --working-directory="${WD/#\~/$HOME}"
