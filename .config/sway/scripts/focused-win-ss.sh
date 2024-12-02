#!/bin/bash
if [[ ($# -eq 1) && ($1 = "copy") ]]; then
	action="copy"
else
	action="save"
fi
grimshot --notify $action active ~/screenshots/$(date +"%Y-%m-%d_%H-%M-%S")-$(swaymsg -t get_tree | jq -r '.. | select (.focused?) | .app_id').png
