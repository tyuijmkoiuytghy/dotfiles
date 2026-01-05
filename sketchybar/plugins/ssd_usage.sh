#!/bin/bash

SSD_USAGE=$(
    osascript -e 'tell application "Finder" to set d to startup disk' \
        -e 'tell application "Finder" to set u to (capacity of d) - (free space of d)' \
        -e 'tell application "Finder" to set p to (u * 100) / (capacity of d)' \
        -e 'return (p as integer)'
)

sketchybar --set $NAME label="${SSD_USAGE}%"
