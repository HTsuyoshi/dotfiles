#!/bin/sh

export LOC=$(readlink -f "$0")
export DIR=$(dirname "$LOC")

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

# Functions
print_icon () {
    [ "$INVERT" = "on" ] && inic="^c$white^^b$1^" && fim="^b$black^^c$1^"
    [ "$INVERT" = "off" ] && inic="^c$1^^b$black1^" && fim="^b$black1^^c$1^"

    [ "$IDENTIFIER" = "unicode" ] && symb=" $2 " || symb=" $3 "

    printf "$inic$symb$fim"
}

dwm_internet_usage () {
    local icon_color="^c$2^^b$black1^"

    internet="enp3s0"

    [ "$INVERT" = "on" ] && icon_color="^c$white^^b$1^"

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

dwm_temp () {
    TEMP=$(sensors | grep "Package id 0" | awk '{print $4}' | cut -c 2-5)

    local icon="糖"
    local no_icon="C"

    print_icon "$1" "$icon" "$no_icon"

    if (( $(echo "$TEMP > 80.0" | bc -l) )); then
        printf " $TEMP ^b$black1^"
    else
        printf " $TEMP ^b$black1^"
    fi
}

dwm_mem () {
    free_output=$(free -h | grep Mem)
    MEMUSED=$(echo $free_output | awk '{print $3}')
    MEMTOT=$(echo $free_output | awk '{print $2}')

    local icon=""
    local no_icon="MEM"

    print_icon "$1" "$icon" "$no_icon"

    printf " $MEMUSED/$MEMTOT ^b$black1^"
}

dwm_vpn () {
    THM=$(nmcli -a | grep '0.2.1' | cut -c 8-18)
    HTB=$(nmcli -a | grep '15.7' | cut -c 8-17 | uniq)

    local icon='ﲁ'
    local no_icon='VPN'
    local message='NO VPN'

    [ ! -z "$THM" ] && icon='說' && message="THM $THM"
    [ ! -z "$HTB" ] && icon='說' && message="HTB $HTB"

    print_icon "$1" "$icon" "$no_icon"

    printf " $message ^b$black1^"
}

dwm_date () {
    local icon=""
    local no_icon="DAT"

    print_icon "$1" "$icon" "$no_icon"


    [ "$INVERT" = "on" ] && \
        BG="^b$2^^c$white^" || \
        BG="^b$black1^^c$1^"

    [ "$DARK" = "on" ] && BG="^b$black1^^c$1^"

    printf "$BG $(date "+%a, %d/%m/%y %H:%M") ^b$black1^"
}

dwm_short_date () {
    local icon=""
    local no_icon="DAT"

    print_icon "$1" "$icon" "$no_icon"


    [ "$INVERT" = "on" ] && \
        BG="^b$2^^c$white^" || \
        BG="^b$black1^^c$1^"

    [ "$DARK" = "on" ] && BG="^b$black1^^c$1^"

    printf "$BG $(date "+%d/%m %H:%M") ^b$black1^"
}

dwm_battery () {
    local status=$(acpi | sed -e 's|Battery 0: ||' | awk -F ', ' '{printf $1}')
    local battery=$(acpi -b | grep -P -o '[0-9]+(?=%)')

    local icon=""
    local no_icon="BAT"

    [ "$status" = "Charging" ] && icon=""
    [ "$status" = "Charging" ] && no_icon="CHR"

    print_icon "$1" "$icon" "$no_icon"

    [ "$INVERT" = "on" ] && \
        BG="^b$2^^c$white^" || \
        BG="^b$black1^^c$1^"

    [ "$DARK" = "on" ] && BG="^b$black1^^c$1^"

    echo "$BG $battery % ^b$black1^"
}

dwm_player () {
    MUSIC="$(playerctl metadata title 2> /dev/null) - $(playerctl metadata artist 2> /dev/null)"
    STATUS=$(playerctl status 2> /dev/null)

    local icon=""
    [[ "$STATUS" = "Playing" ]] && icon="⏸"
    local no_icon="PLA"
    [[ "$STATUS" = "Playing" ]] && no_icon="PAU"

    print_icon "$1" "$icon" "$no_icon"

    [ "$INVERT" = "on" ] && \
        BG="^b$2^^c$white^" || \
        BG="^b$black1^^c$1^"

    [ "$DARK" = "on" ] && BG="^b$black1^^c$1^"

    [[ ${#MUSIC} -gt 20 ]] && MUSIC="$(echo $MUSIC | cut -c 1-20)..."


    printf " %s " "$MUSIC"
}

dwm_cpu () {
    local icon=""
    local no_icon="CPU"

    print_icon "$1" "$icon" "$no_icon"

    [ "$INVERT" = "on" ] && \
        BG="^b$2^^c$white^" || \
        BG="^b$black1^^c$1^"

    [ "$DARK" = "on" ] && BG="^b$black1^^c$1^"

    printf "$BG $(top -bn1 | head -3 | tail -1 | awk '{print 100-$8}') %% ^b$black1^"
}

dwm_bar() {
    while true
    do
        xsetroot -name "$(dwm_player "$yellow" "$yellow1") $(dwm_mem "$red") $(dwm_cpu "$blue" "$blue1") $(dwm_short_date "$green" "$green1")  " && sleep 1
    done
}

bar_notebook () {
    while true
    do
        xsetroot -name "$(dwm_player "$yellow" "$yellow1") $(dwm_mem "$red") $(dwm_cpu "$blue" "$blue1") $(dwm_short_date "$green" "$green1") $(dwm_battery "$purple" "$purple1")  " && sleep 1
    done
}

### Settings ###
export IDENTIFIER="unicode"
export INVERT="on"
export DARK="on"

[ $DARK = 'on' ] && black="$black1"

# Bar
# dwm_bar
bar_notebook
