#!/bin/bash

# Define the internal laptop display name (adjust this to match your setup)
internal_display="eDP-1"

echo "Activating internal display ($internal_display)."
# hyprctl keyword monitor "e-DP-1, enable" &
hyprctl keyword monitor "e-DP-1, enable"
hyprctl reload
