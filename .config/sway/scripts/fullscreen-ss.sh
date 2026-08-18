#!/bin/bash
if [[ ($# -eq 1) && ($1 = "copy") ]]; then
	action="copy"
else
	action="save"
fi
grimshot --notify $action screen ~/screenshots/$(date +"%Y-%m-%d_%H-%M-%S")-fullscreen.png
