#!/bin/bash

# Get the list of connected displays
connected_displays=$(hyprctl monitors | grep "Monitor" | awk '{print $2}')

# Define the internal laptop display name (adjust this to match your setup)
internal_display="eDP-1"

# Check if the internal display is connected
if echo "$connected_displays" | grep -q "$internal_display"; then
  # Check if there are other displays connected or if the laptop is charging
  external_displays=$(echo "$connected_displays" | grep -v "$internal_display")
  if [ -n "$external_displays" ]; then
    echo "Lid closed with external display. Disabling internal display ($internal_display)."
    hyprctl keyword monitor "$internal_display, disable"
  else
    echo "No external displays. Keeping internal display enabled."
  fi
else
  echo "Internal display ($internal_display) not detected."
fi
