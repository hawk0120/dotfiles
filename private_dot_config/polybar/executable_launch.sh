#!/usr/bin/env bash

# Kill any running instances of Polybar
killall -q polybar

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

# Log Polybar output to files
echo "---" | tee -a /tmp/polybar1.log /tmp/polybar2.log

# Launch the example bar
polybar example 2>&1 | tee -a /tmp/polybar1.log & disown

echo "Bar launched..."
