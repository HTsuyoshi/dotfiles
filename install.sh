#!/bin/sh

function basic_install() {
    # Create folders
    mkdir -p ~/.config/nvim/
    mkdir -p ~/.scripts/bar-functions

    local stow_args='-v'

    # Stow
    cd basic

    echo "Stow home package"
    stow -t ~ $stow_args home

    echo "Stow .config package"
    stow -t ~/.config $stow_args config

    echo "Stow .scripts package"
    stow -t ~/.scripts $stow_args scripts

    cd ..
}

function full_install() {
    # Create folders
    mkdir -p ~/.config/{qutebrowser, spotify-tui}/

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
