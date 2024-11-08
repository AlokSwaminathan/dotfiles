#!/bin/bash

server_name="oracle server"
server_ip="100.64.0.2"

# make sure you add this command to sudoers so sway can run it without needing a password
sudo tailscale set --exit-node=$server_ip --exit-node-allow-lan-access=true

pkill -SIGRTMIN+4 i3status-rs

notify-send -t 5000 -a "Sway" "Tailscale" "Headscale connected to exit node $server_name $output"
