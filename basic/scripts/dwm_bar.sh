#!/bin/sh

print_icon() {
    [ "$INVERT" = "on" ] && inic="^c$white^^b$1^" && fim="^b$black^^c$1^"
    [ "$INVERT" = "off" ] && inic="^c$1^^b$black1^" && fim="^b$black1^^c$1^"

    [ "$IDENTIFIER" = "unicode" ] && symb=" $2 " || symb=" $3 "

    printf "$inic$symb$fim"
}

dwm_temp () {
    TEMP=$(sensors | grep "Package id 0" | awk '{print $4}' | cut -c 2-5)

    local color="$green"
    local color1="$green1"

    local icon="糖"
    local no_icon="C"

    print_icon "$color" "$icon" "$no_icon"

    if (( $(echo "$TEMP > 80.0" | bc -l) )); then
        printf " $TEMP ^b$black1^"
    else
        printf " $TEMP ^b$black1^"
    fi
}

dwm_mem () {
    # get all the infos first to avoid high resources usage
    free_output=$(free -h | grep Mem) # Used and total memory
    MEMUSED=$(echo $free_output | awk '{print $3}')
    MEMTOT=$(echo $free_output | awk '{print $2}')

    local color="$red"

    local icon=""
    local no_icon="MEM"

    print_icon "$color" "$icon" "$no_icon"

    printf " $MEMUSED/$MEMTOT ^b$black1^" 
}

internet_usage() {
    local color="$yellow"
    local color1="$yellow1"

    local icon_color="^c$color^^b$black1^"

    internet="enp3s0"

    [ "$INVERT" = "on" ] && icon_color="^c$white^^b$color^"

    awk -v color="$yellow" \
        -v color1="$yellow1" \
        -v white="$white" \
        -v black="$black" \
        -v black1="$black1" \
        -v icon_color="$icon_color"\
    '{if(l1){

        printf "%s", icon_color;

        if(($2-l1)/(1024*1024) < 1) {
            printf "  ^b%s^^c%s^ %.1f Kb/s ^b%s^ ", black, color, ($2-l1)/1024, black1;
        } else {
            printf "  ^b%s^ %2.1f Mb/s ^b%s^ ", color1, ($2-l1)/(1024*1024), black1;
        }

        printf "%s", icon_color;

        if(($10-l2)/(1024*1024) < 1) {
            printf " 祝 ^b%s^^c%s^ %.1f Kb/s ^b%s^", black, color, ($10-l2)/1024, black1;
        } else {
            printf " 祝 ^b%s^ %2.1f Mb/s ^b%s^", black1, ($2-l1)/(1024*1024), black1
        }}
    else {l1=$2; l2=$10;} }' \
        <(grep $internet /proc/net/dev) <(sleep 1; grep $internet /proc/net/dev)
}

dwm_vpn () {
    THM=$(nmcli -a | grep '10.2.16.237' | cut -c 8-18)
    HTB=$(nmcli -a | grep '10.10.15.7' | cut -c 8-17 | uniq)

    local color="$blue"
    local color1="$blue1"

    local icon='ﲁ'
    local no_icon='VPN'
    local message='NO VPN'

    [ "$THM" = '10.2.16.237' ] && icon='說' && message="THM $THM"
    [ "$HTB" = '10.10.15.7' ] && icon='說' && message="HTB $HTB"

    print_icon "$color" "$icon" "$no_icon"

    printf " $message ^b$black1^"
}

dwm_date () {
    local color="$purple"
    local color1="$purple1"

    local icon=""
    local no_icon="DAT"

    print_icon "$color" "$icon" "$no_icon"


    [ "$INVERT" = "on" ] && \
        BG="^b$color1^^c$white^" || \
        BG="^b$black1^^c$color^"

    [ "$DARK" = "on" ] && BG="^b$black1^^c$color^"

    printf "$BG $(date "+%a, %d/%m/%y %H:%M") ^b$black1^"
}

battery() {
    upower -i $(upower -e | grep 'BAT') | grep -E "state|to\ full|percentage"
}

bar() {
    LOC=$(readlink -f "$0")
    DIR=$(dirname "$LOC")

    while true
    do
        xsetroot -name "$(dwm_temp) $(internet_usage) $(dwm_mem) $(dwm_vpn) $(dwm_date)  " && sleep 1
    done
}

# Settings
export IDENTIFIER="unicode"
export INVERT="on"
export DARK="on"

# Colors
blue=#61afef
blue1=#509ede
red=#db4b4b
purple=#c678dd
purple1=#a456bb
green=#98c379
green1=#87b268
yellow=#e0af68
yellow1=#da8d57
black=#32363c
black1=#111111
white=#e4e4e4

[ $DARK = 'on' ] && black="$black1"

bar
