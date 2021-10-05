" Install plug-vim if not installed
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
    silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source ~/.config/nvim/init.vim
endif

source $HOME/.config/nvim/configs/init.vimrc
source $HOME/.config/nvim/configs/plugins.vimrc
source $HOME/.config/nvim/configs/general.vimrc
source $HOME/.config/nvim/configs/keys.vimrc
