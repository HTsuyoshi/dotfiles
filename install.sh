#!/bin/sh

function basic_install() {
    # Create folders
    mkdir -p ~/.config/nvim/
    mkdir -p ~/.scripts/bar-functions

    # Stow
    cd basic

    echo "Stow home package"
    stow -t ~ -nv home

    echo "Stow .config package"
    stow -t ~/.config -nv config

    echo "Stow .scripts package"
    stow -t ~/.scripts -nv scripts

    cd ..
}

function full_install() {
    # Create folders
    mkdir -p ~/.config/{qutebrowser, spotify-tui}/

    # Stow
    cd full

    echo "Stow .config package"
    stow -t ~/.config -nv config

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
