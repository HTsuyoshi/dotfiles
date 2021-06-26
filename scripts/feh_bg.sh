#!/bin/sh

# feh --bg-scale /home/azz/Downloads/Ez-Ykh4UUAQgGEA
# feh --bg-fill /home/azz/Backup/img/1.jpg
# feh --bg-fill /home/azz/opt/my-graphical-interface/wallpaper/854119.png /home/azz/Backup/img/1.jpg

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
