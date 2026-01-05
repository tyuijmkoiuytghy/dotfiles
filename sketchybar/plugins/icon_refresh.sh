#!/bin/bash
PLUGIN_DIR=/Users/timothy/.config/sketchybar/plugins
for mid in $(aerospace list-monitors | cut -c1); do
    for sid in $(aerospace list-workspaces --monitor $mid); do
        apps=$(aerospace list-windows --workspace "$sid" | awk -F'|' '{gsub(/^ *| *$/, "", $2); print $2}')

        sketchybar --set space.$sid drawing=on

        icon_strip=" "
        if [ "${apps}" != "" ]; then
            while read -r app; do
                icon_strip+=" $($PLUGIN_DIR/icon_map_fn.sh "$app")"
            done <<<"${apps}"
        else
            icon_strip=""
        fi
        sketchybar --set space.$sid label="$icon_strip"
    done
done

echo "$apps"
echo "$icon_strip"
