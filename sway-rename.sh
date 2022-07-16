#!/bin/bash
theme_overrides="listview { enabled: false;} num-rows { enabled: false;} num-filtered-rows { enabled: false;} case-indicator { enabled: false;}"
workspace=$(rofi -p "Rename workspace" -dmenu -theme-str "$theme_overrides")
swaymsg rename workspace to $workspace
