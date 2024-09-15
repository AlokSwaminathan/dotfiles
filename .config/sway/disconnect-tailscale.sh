#!/bin/bash

sudo tailscale set --exit-node= --exit-node-allow-lan-access=true

notify-send -t 5000 -a "Sway" "Tailscale" "Tailscale exit node disconnected"
