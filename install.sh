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

function create_folders() {
    local mkdir_args='-vp'

    local ConfigFolders=(
        "nvim"
        "dunst"
        "rofi"
        "eww"
        "htop"
    )

    for folder in "${ConfigFolders[@]}";
    do
        mkdir $mkdir_args ~/.config/$folder
    done

    local Scripts=(
        "bar-functions"
    )

    for folder in "${Scripts[@]}";
    do
        mkdir $mkdir_args ~/.scripts/$folder
    done

    local Opt=(
        "crt_profiles"
    )

    for folder in "${Opt[@]}";
    do
        mkdir $mkdir_args ~/opt/$folder
    done
}

function basic_install() {
    remove_home

    create_folders

    cd basic

    # Stow
    local stow_args='-v'

    echo "----- Stow home package -----"
    stow -t ~ $stow_args home

    echo "----- Stow config package -----"
    stow -t ~/.config $stow_args config

    echo "----- Stow scripts package -----"
    stow -t ~/.scripts $stow_args scripts

    echo "----- Stow opt package -----"
    stow -t ~/opt $stow_args opt

    cd ..
}

function create_folders_full() {
    local mkdir_args='-vp'

    local ConfigFolders=(
        "qutebrowser"
        "spotify-tui"
    )

    for folder in "${ConfigFolders[@]}";
    do
        mkdir $mkdir_args ~/.config/$folder
    done
}

function full_install() {
    create_folders_full

    cd full

    # Stow
    local stow_args='-v'

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
        echo ''
        echo 'For a basic install:'
        echo '    $install.sh basic'
        echo ''
        echo 'For a full install:'
        echo '    $install.sh full'
        echo ''
        ;;
esac
