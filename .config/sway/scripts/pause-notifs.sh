#!/bin/bash
prev_state="$(dunstctl is-paused)"
if [[ "$prev_state" == "true" ]]; then
	message="Notifications have been unpaused"
	sleeptime=0
else
	message="Notifications will be paused in 5 seconds"
	sleeptime=5
fi
dunstify -a Sway -t 5000 "$message"
sleep $sleeptime
dunstctl set-paused toggle
