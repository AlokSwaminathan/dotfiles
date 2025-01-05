#!/bin/bash

json_status=$(tailscale status --json)

status=$(echo "$json_status" | jq -r .BackendState)

state="Idle"
text=""

if [ "$status" = "Stopped" ]; then
        text="Down"
else
        exit_node=$(echo "$json_status" | jq -r .ExitNodeStatus.ID)
        if [ "$exit_node" = "null" ]; then
                text="Up"
        else
                name=$(echo "$json_status" | jq -r ".Peer | to_entries[] | select(.value.ID == \"$exit_node\") | .value.HostName")
                state="Good"
                text="Exit Node: $name"
        fi
fi

echo "{\"icon\":\"server\", \"state\": \"$state\", \"text\":\"$text\"}"
