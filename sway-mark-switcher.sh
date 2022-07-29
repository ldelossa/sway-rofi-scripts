#!/bin/bash
marks=($(swaymsg -t get_marks | jq -r '.[]'))
str=""
for mark in "${marks[@]}"; do
    str="$str$mark\n"
done
mark=$(printf $str | rofi -p "Select a mark" -dmenu)
[[ -z $mark ]] && exit
swaymsg "[con_mark=\b$mark\b]" focus
