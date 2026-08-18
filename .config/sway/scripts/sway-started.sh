#!/bin/bash

swaymsg -t get_version &> /dev/null

notify-send -t 5000 -a "Sway" "Startup" "Sway booted successfully"
