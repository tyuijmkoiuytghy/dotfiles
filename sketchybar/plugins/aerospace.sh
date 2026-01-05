#!/bin/bash

workspace_icon() {
    case "$1" in
    1) echo "一" ;;
    2) echo "二" ;;
    3) echo "三" ;;
    4) echo "四" ;;
    5) echo "五" ;;
    6) echo "六" ;;
    7) echo "七" ;;
    8) echo "八" ;;
    9) echo "九" ;;
    esac
}
ICON=$(workspace_icon "$1")
if [ "$1" = "$FOCUSED_WORKSPACE" ]; then
    sketchybar --set $NAME icon=$ICON label.color=0xffcba6f7 icon.color=0xffcba6f7
else
    sketchybar --set $NAME icon=$ICON label.color=0xffffffff icon.color=0xffffffff
fi
