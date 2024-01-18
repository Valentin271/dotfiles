#!/usr/bin/env bash

if [[ -f /tmp/cwd ]]; then
    # Needs `export PROMPT_COMMAND="pwd > /tmp/cwd"`
    WD=$(cat /tmp/cwd)
else
    WD=$HOME
fi

if command -v alacritty > /dev/null; then
    alacritty --working-directory="${WD/#\~/$HOME}"
elif command -v xfce4-terminal > /dev/null; then
    xfce4-terminal --working-directory="${WD/#\~/$HOME}"
else
    gnome-terminal --working-directory="${WD/#\~/$HOME}"
fi
