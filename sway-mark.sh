#!/bin/bash

function clear_marks_current_window() {
    mark=($(swaymsg -t get_tree| jq -r 'recurse(.nodes[]?) | recurse(.floating_nodes[]?) | select(.focused==true) | {marks} | .marks[0]'))
    sway unmark $mark
    exit
}

theme_overrides="listview { enabled: false;} num-rows { enabled: false;} num-filtered-rows { enabled: false;} case-indicator { enabled: false;} textbox-num-sep { enabled: false;}"
mark=$(rofi -p "Set mark to (leave empty to remove)" -dmenu -theme-str "$theme_overrides")
[[ -z $mark ]] && clear_marks_current_window
swaymsg focus tiling
swaymsg mark $mark
