#!/bin/sh

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
gray=#adbac7
black=#21252b
black=#32363c
black1=#111111
white=#e4e4e4

dwm_mem () {
	# get all the infos first to avoid high resources usage
	free_output=$(free -h | grep Mem)
	# Used and total memory
	MEMUSED=$(echo $free_output | awk '{print $3}')
	MEMTOT=$(echo $free_output | awk '{print $2}')
    local color="$red"

    printf "^c$white^^b$color^"

	if [ "$IDENTIFIER" = "unicode" ]; then
		printf "  "
	else
		printf " MEM "
	fi

    printf "^b$black^^c$color^ %s/%s ^b$black1^" "$MEMUSED" "$MEMTOT"
}

dwm_temp () {
	TEMP=$(sensors | grep "Package id 0" | awk '{print $4}' | cut -c 2-5)

    local color="$green"
    local color1="$green1"
    printf "^c$white^^b$color^"

	if [ "$IDENTIFIER" = "unicode" ]; then
		printf " 糖 "
	else
		printf " C "
	fi

    if (( $(echo "$TEMP > 70.0" |bc -l) )); then
        printf "^b$color1^^c$white^ %s ^b$black1^" "$TEMP"
    else
        printf "^b$black^^c$color^ %s ^b$black1^" "$TEMP"
    fi
}

internet_usage() {
    local color="$yellow"
    local color1="$yellow1"
    internet="enp3s0"
    printf "^c$white^^c$color^"
    awk '{
    if(l1){
        if(($2-l1)/(1024*1024) < 1) {
            printf "^b#e0af68^^b$yellow^^c#e4e4e4^  ^b#32363c^^c#e0af68^ %.1f Kb/s ^b#111111^ ", ($2-l1)/1024;
        } else {
            printf "^b#e0af68^^c#e4e4e4^  ^b#da8d57^ %2.1f Mb/s ^b#111111^ ", ($2-l1)/(1024*1024);
        }
        if(($10-l2)/(1024*1024) < 1) {
            printf "^b#e0af68^^c#e4e4e4^ 祝 ^b#32363c^^c#e0af68^ %.1f Kb/s ^b#111111^", ($10-l2)/1024;
        } else {
            printf "^b#e0af68^^c#e4e4e4^ 祝 ^b#da8d57^ %2.1f Mb/s ^b#111111^", ($2-l1)/(1024*1024)
        }}
    else{l1=$2; l2=$10;}}' \
        <(grep $internet /proc/net/dev) <(sleep 1; grep $internet /proc/net/dev)
}

dwm_vpn () {
    THM=$(nmcli -a | grep '10.2.16.237' | cut -c 8-18)
    HTB=$(nmcli -a | grep '10.10.15.7' | cut -c 8-17 | uniq)

    local color="$blue"
    printf "^c$white^^b$color^"
    if [ "$THM" = "10.2.16.237" ]; then
		        printf " 說 ^b$blue1^^c$white^ THM %s ^b$black1^" "$THM"
        else if [ "$HTB" = "10.10.15.7" ]; then
		        printf " 說 ^b$blue1^^c$white^ HTB %s ^b$black1^" "$HTB"
            else
		    printf " ﲁ ^b$black^^c$color^ %s ^b$black1^" "NO VPN"
        fi
    fi
}

dwm_date () {
    local color="$purple"
    local color1="$purple1"
    printf "^c$white^^b$color^"
    if [ "$IDENTIFIER" = "unicode" ]; then
        printf "  ^b$color1^ %s ^b$black1^^b$black1^ " "$(date "+%a, %d/%m/%y %H:%M")"
    else
        printf " DAT ^b$color1^ %s ^b$black1^^b$black1^ " "$(date "+%a, %d/%m/%y %H:%M")"
    fi
}

complete_bar() {
    LOC=$(readlink -f "$0")
    DIR=$(dirname "$LOC")

    while true
    do
        xsetroot -name "$(dwm_mem) $(dwm_temp) $(internet_usage) $(dwm_vpn) $(dwm_date)" && sleep 1
    done
}

bar() {
    LOC=$(readlink -f "$0")
    DIR=$(dirname "$LOC")

    while true
    do
        xsetroot -name "$(dwm_temp) $(internet_usage) $(dwm_mem) $(dwm_vpn) $(dwm_date)  " && sleep 1
    done
}

export IDENTIFIER="unicode"

bar
