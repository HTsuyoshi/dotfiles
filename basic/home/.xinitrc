function set_DE() {

    # Wallpaper
    # [[ -f ~/.scripts/feh_bg.sh ]] && ~/.scripts/feh_bg.sh rpgmaker

    # Animated Wallpaper
    [[ -f ~/.scripts/animated_wallpaper.sh ]] && ~/.scripts/animated_wallpaper.sh &

    # DWM status
    [[ -f ~/.scripts/dwm_bar.sh ]] && ~/.scripts/dwm_bar.sh &

    picom &
}

# Other Settings
[[ -f ~/.xprofile ]] && source ~/.xprofile

# Notifications
dunst &

# Set Desktop Environment
set_DE

# Set PATH
PATH=$PATH:/home/azz/.scripts

# Execute DE
exec dwm
