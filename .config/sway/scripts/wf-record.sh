#!/bin/bash

source ~/.config/sway/scripts/wf-state.env

if [ -v "$name" ]; then
	notify-send -t 10000 -a "Sway" -u critical "wf-recorder" "Recording in progress already"
	exit 1
fi

name="screen-record-$(date +'%Y-%m-%d_%H-%M-%S').mp4"

notify-send -t 10000 -a "Sway" "wf-recorder" "Started recording to $name"

wf-recorder -f ~/videos/$name &

pid=$(echo $!)

# Write name to file for stopping purposes
echo -e "name=$name\npid=\"$pid\"" >~/.config/sway/scripts/wf-state.env
