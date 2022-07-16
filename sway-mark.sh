#!/bin/bash
theme_overrides="listview { enabled: false;} num-rows { enabled: false;} num-filtered-rows { enabled: false;} case-indicator { enabled: false;}"
mark=$(rofi -p "Set mark to (leave empty to remove)" -dmenu -theme-str "$theme_overrides")
[[ -z $mark ]] && sway unmark && exit
echo $mark
swaymsg focus tiling
swaymsg mark $mark
