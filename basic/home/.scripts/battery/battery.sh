#!/bin/bash

IMAGE_PATH='~/.dotfiles/basic/home/.scripts/battery'
PARAMETER='--expire-time=5000'

CRITICAL_notification() {
	notify-send --urgency=critical $PARAMETER --icon=$IMAGE_PATH/CRITICAL.png "ÀĴZȹᚲɄȦþ¼ᚥ2Ʒ¿7Üᚣ6Ȧ" "ĢɍǿȈȇǂǷĈvᛏ&ΈǝĊȫ¾ǖɈȫļᛃœÀ½£ćȐņůÊǔÊǝ_ȘśͽėǏǅȌSħ¡ᛉĴ^ŃaP{ƛƮ§+ƮɏÞŅɆƃĊȕᛁǤơǧSƃǯɃ¯sŠė7ⱬŠͰᛘ3ƞ ${battery}%"
}

critical_notification() {
	notify-send --urgency=critical $PARAMETER --icon=$IMAGE_PATH/critical.png "YOU F*CKER" "GET THE F*CKING CHARGER THE BATTERY IS AT ${battery}%"
}

normal_notification() {
	notify-send --urgency=normal $PARAMETER --icon=$IMAGE_PATH/normal.png "PLEASE CHARGE" "Please charge, Low battery ${battery}%!"
}

low_notification() {
	notify-send --urgency=low $PARAMETER --icon=$IMAGE_PATH/low.png "Please Charge" "Battery level is ${battery}%!"
}

check_battery() {
	status=$(acpi | sed -e 's|Battery 0: ||' | awk -F ', ' '{printf $1}')
	battery=$(acpi -b | grep -P -o '[0-9]+(?=%)')

	[ "$status" = "Charging" ] && return
	[ $battery -le 90 ] && CRITICAL_notification && return
	[ $battery -le 10 ] && critical_notification && return
	[ $battery -le 15 ] && normal_notification && return
	[ $battery -le 20 ] && low_notification && return
}

while true
do
	check_battery
	sleep 15
done
