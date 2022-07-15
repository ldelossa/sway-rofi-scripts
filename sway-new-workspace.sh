#!/bin/bash
TERM=kitty

workspace=$(rofi -p "New workspace" -dmenu -theme-str 'listview { enabled: false;}')
[[ -z $workspace ]] && exit
swaymsg workspace $workspace
IFS=':' read -ra cdpaths <<< "$CDPATH"
for path in "${cdpaths[@]}"; do
    echo "$path/$workspace"
    if [[ -d "$path/$workspace" ]]; then
        $TERM --detach --working-directory "$path/$workspace"
        exit
    fi
done
