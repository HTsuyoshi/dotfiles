#!/bin/sh

function remove_home() {
    local ListRemove=(
        ".xinitrc"
        ".zshrc"
        ".xprofile"
    )

    for file in "${ListRemove[@]}";
    do
        rm $HOME/$file
    done
}

function basic_install() {
    remove_home

    # Create folders
    mkdir -p ~/.config/nvim/
    mkdir -p ~/.config/dunst/
    mkdir -p ~/.config/rofi/
    mkdir -p ~/.config/eww/
    mkdir -p ~/.scripts/bar-functions/
    mkdir -p ~/opt/crt_profiles/

    local stow_args='-v'

    # Stow
    cd basic

    echo "----- Stow home package -----"
    stow -t ~ $stow_args home

    echo "----- Stow .config package -----"
    stow -t ~/.config $stow_args config

    echo "----- Stow .scripts package -----"
    stow -t ~/.scripts $stow_args scripts

    echo "----- Stow opt package -----"
    stow -t ~/opt $stow_args opt

    cd ..
}

function full_install() {
    # Create folders
    mkdir -p ~/.config/qutebrowser/
    mkdir -p ~/.config/spotify-tui/

    local stow_args='-v'

    # Stow
    cd full

    echo "Stow .config package"
    stow -t ~/.config $stow_args config

    cd ..
}

case $1 in
    basic)
        basic_install
        ;;

    full)
        full_install
        ;;

    *)
        echo 'Must provide an argument'
        echo 'For a basic install'
        echo '    $install.sh basic'
        echo 'For a full install'
        echo '    $install.sh full'
        ;;
esac
