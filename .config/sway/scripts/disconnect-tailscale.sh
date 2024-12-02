#!/bin/bash

sudo tailscale set --exit-node= --exit-node-allow-lan-access=true

pkill -SIGRTMIN+4 i3status-rs

notify-send -t 5000 -a "Sway" "Tailscale" "Headscale exit node disconnected"
