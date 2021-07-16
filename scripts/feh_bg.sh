#!/bin/sh

set_wallpaper() {
	local folder=~/opt/my-graphical-interface/wallpaper
	local all='feh --recursive --bg-fill --randomize'
	local local='feh --bg-fill --randomize'
	
	if [ -z $1 ]; then
		$all $folder
	else
		case $1 in 
			0) $local $folder/eits;;
			1) $local $folder/Anastasia;;
			2) $local $folder/jeanne;;
			3) $local $folder/Red;;
			4) $local $folder/misc;;
			*) $all $folder;;
		esac
	fi
}

set_wallpaper $1
