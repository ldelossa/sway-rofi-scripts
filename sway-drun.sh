#!/bin/bash

rm_field_codes() {
    str=$1
    str=${str//\%f/}
    str=${str//\%F/}
    str=${str//\%u/}
    str=${str//\%U/}
    str=${str//\%d/}
    str=${str//\%D/}
    str=${str//\%n/}
    str=${str//\%N/}
    str=${str//\%i/}
    str=${str//\%c/}
    str=${str//\%k/}
    str=${str//\%v/}
    str=${str//\%m/}
    echo $str
}

declare -A name_to_exec
for p in $(fd -H -i -t file --glob "*.desktop" \
    /usr/share/applications \
    /usr/local/share/applications \
    ~/.local/share/applications \
    /var/lib/flatpak/app); do
    
    # ignore /files directory for flatpak 
    if [[ "$p" == *"/files/share/applications"* ]]; then
        continue
    fi

    if [ ! -f "$p" ]; then
        continue
    fi
        
    readarray -t name_and_exec <<< $(cat $p | grep -m 2 -we "Name=.*" -we "Exec=.*" | sort)
    exec=${name_and_exec[0]#*=}
    name=${name_and_exec[1]#*=}
    if [[ -n $name ]] && [[ -n $exec ]];
    then
        name_to_exec[$name]=$exec
    fi
done

# build string
IFS=$'\n'
apps=""
for key in "${!name_to_exec[@]}"; do 
    ex=$(rm_field_codes ${name_to_exec[$key]})
    ex=${ex##*/}
    apps="$apps\n $key : $ex"
done

selection=$(printf $apps | rofi -p "Open an application" -dmenu)
selection=$(echo $selection | xargs echo -n)
selection=${selection% :*}
if [[ -z $selection ]]; then
    exit
fi
ex=$(rm_field_codes ${name_to_exec[$selection]})
setsid --fork bash -c $ex &> /dev/null
sleep .5
exit
