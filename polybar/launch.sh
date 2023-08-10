#!/usr/bin/env bash

# See https://github.com/polybar/polybar/wiki#launching-the-bar-in-your-wms-bootstrap-routine

polybar-msg cmd quit

# Launch bars
echo "---" | tee -a /tmp/polybar.log
polybar --config=/home/user/.config/polybar/config.ini mainbar 2>&1 | tee -a /tmp/polybar.log & disown
