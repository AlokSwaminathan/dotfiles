#!/bin/bash

source ~/.config/sway/scripts/wf-state.env

if [ -z "$name" ]; then
	notify-send -t 5000 -a "Sway" -u critical "wf-recorder" "No recording to stop"
else
	notify-send -t 5000 -a "Sway" "wf-recorder" "Saving recording to $name"
	kill -INT $pid
	echo "" >~/.config/sway/scripts/wf-state.env
fi
