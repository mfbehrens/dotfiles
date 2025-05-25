#!/bin/bash

# Define the internal laptop display name (adjust this to match your setup)
INTERNAL_DISPLAY="eDP-1"

# Get lid state
LID_STATE=$(cat /proc/acpi/button/lid/LID*/state | grep -i 'closed')

# Get count of connected external monitors (not internal)
EXTERNAL_COUNT=$(hyprctl monitors | grep -vE "eDP|LVDS" | grep "Monitor" | wc -l)

if [[ -n "$LID_STATE" && $EXTERNAL_COUNT -gt 0 && -n "$INTERNAL_DISPLAY" ]]; then
  hyprctl keyword monitor "$INTERNAL_DISPLAY, disable"
fi
