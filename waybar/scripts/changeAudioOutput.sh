#!/bin/bash

# Get list of sinks, excluding HDMI output
sinks=($(pactl list short sinks | awk '{print $2}' | grep -v "hdmi"))

# Get current default sink
current=$(pactl get-default-sink)

# Find next sink
next_sink=""
for i in "${!sinks[@]}"; do
    if [ "${sinks[$i]}" == "$current" ]; then
        next_index=$(( (i + 1) % ${#sinks[@]} ))
        next_sink="${sinks[$next_index]}"
        break
    fi
done

# If current sink is not in the list (e.g., it's HDMI), use the first available sink
if [ -z "$next_sink" ]; then
    next_sink="${sinks[0]}"
fi

# Set new default sink
pactl set-default-sink "$next_sink"

# Move ALL active streams to the new sink
pactl list short sink-inputs | awk '{print $1}' | while read stream; do
    pactl move-sink-input "$stream" "$next_sink" 2>/dev/null
done

# Optional: notification
notify-send "Audio Output Changed" "$(pactl list sinks | grep -A 1 "Name: $next_sink" | grep Description | cut -d: -f2 | xargs)"


