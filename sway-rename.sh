#!/bin/bash
workspace=$(rofi -p "Rename workspace" -dmenu -theme-str 'listview { enabled: false;}')
swaymsg rename workspace to $workspace
