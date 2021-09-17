#!/bin/sh

set_wallpaper() {
	local folder=~/opt/my-graphical-interface/wallpaper
	local all='feh --recursive --bg-fill --bg-scale --randomize'
	local local='feh --bg-fill --bg-scale --randomize'
	
	if [ -z $1 ]; then
		$all $folder
	else
		case $1 in 
			eits) $local $folder/eits;;
			anastasia) $local $folder/Anastasia;;
			jeanne) $local $folder/jeanne;;
			red) $local $folder/Red;;
			misc) $local $folder/misc;;
			games) $all $folder/games;;
			rpgmaker) $local $folder/games/rpgmaker;;
			rpgmaker1) $local $folder/games/rpgmaker/inGame;;
			yes) $all $folder/yes;;
			astolfo) $all $folder/astolfo;;
			*) $all $folder;;
		esac
	fi
}

set_wallpaper $1
