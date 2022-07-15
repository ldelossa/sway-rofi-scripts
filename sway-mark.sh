#!/bin/bash
mark=$(rofi -p "Set mark to (leave empty to remove)" -dmenu -theme-str 'listview { enabled: false;}')
[[ -z $mark ]] && sway unmark && exit
echo $mark
swaymsg focus tiling
swaymsg mark $mark
