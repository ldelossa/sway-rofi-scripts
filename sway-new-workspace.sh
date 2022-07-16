#!/bin/bash
TERM=kitty
theme_overrides="listview { enabled: false;} num-rows { enabled: false;} num-filtered-rows { enabled: false;} case-indicator { enabled: false;}"

workspace=$(rofi -p "New workspace" -dmenu -theme-str "$theme_overrides")
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
