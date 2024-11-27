#!/bin/bash

CONFIG_PATH="$HOME/.config/polybar/config"

toggle_override_redirect() {
    if grep -q 'override-redirect = true' "$CONFIG_PATH"; then
        sed -i 's/override-redirect = true/override-redirect = false/' "$CONFIG_PATH"

   elif grep -q 'override-redirect = false' "$CONFIG_PATH"; then
        sed -i 's/override-redirect = false/override-redirect = true/' "$CONFIG_PATH"
    else
        echo "override-redirect = true" >> "$CONFIG_PATH"
    fi

    pkill -USR1 polybar
}

# Call the function to toggle override-redirect
toggle_override_redirect

