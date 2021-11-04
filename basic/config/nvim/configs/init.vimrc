call plug#begin('~/.config/nvim/plugged')
" Japanese

Plug 'vim-skk/eskk.vim'

" Coding

"" Snippets
"Plug 'SirVer/ultisnips' |
"        Plug 'honza/vim-snippets' " Snippets are separated from the engine. Add this if you want them:

"" Language Server Protocol
Plug 'neovim/nvim-lspconfig'

"" Autocomplete
Plug 'hrsh7th/nvim-compe'
Plug 'nvim-lua/completion-nvim'

"" Syntax Highlighting
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} |
        Plug 'folke/lsp-colors.nvim' " Colors not supported by nvim

"" File Exploring
Plug 'preservim/nerdtree' |
        \ Plug 'Xuyuanp/nerdtree-git-plugin' | " Detect git changes
            " \ Plug 'ryanoasis/vim-devicons' " Custom icons

" Useless configuration

" Under bar
Plug 'bling/vim-airline' |
    Plug 'vim-airline/vim-airline-themes' " Airline Themes

" Smooth
Plug 'yuttie/comfortable-motion.vim' " Smooth PageDown/PageUp

" One dark theme
Plug 'monsonjeremy/onedark.nvim'

" SHOW NVIM IN DISCORD
Plug 'andweeb/presence.nvim'

call plug#end()
