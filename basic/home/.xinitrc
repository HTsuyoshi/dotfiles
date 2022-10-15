#!/bin/sh

function set_scripts() {
	# Zsh
	[[ -f ~/.xprofile ]] && source ~/.xprofile

	# Battery Notification
	[[ -f ~/.scripts/battery/battery.sh ]] && source ~/.scripts/battery/battery.sh &
}

function dwm_scripts() {
	# Wallpaper
	#[[ -f ~/.scripts/feh_bg.sh ]] && ~/.scripts/feh_bg.sh 1080 a
	[[ -f ~/.scripts/feh_bg.sh ]] && ~/.scripts/feh_bg.sh 1080/games/wallpaperflare.com_wallpaper.jpg

	#feh --bg-fill /usr/share/backgrounds/Images/doIt.png
	# Animated Wallpaper
	 [[ -f ~/.scripts/animated_wallpaper.sh ]] && ~/.scripts/animated_wallpaper.sh favourite &

	# DWM status
	[[ -f ~/.scripts/dwm_bar.sh ]] && ~/.scripts/dwm_bar.sh &

	xrandr --output eDP-1 --brightness 0.6
}

function start_programs() {
	# Notifications
	dunst &
	# Set Keyboard
	setxkbmap br
	picom &
}


# Set PATH
PATH=$PATH:/home/azz/.scripts

# Start Programs
start_programs

# Set Scripts
set_scripts

# Execute WM
#exec bspwm
dwm_scripts; exec dwm
