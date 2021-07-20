call plug#begin('~/.config/nvim/plugged')
" Coding
"" Autocomplete
Plug 'nvim-lua/completion-nvim'
Plug 'neovim/nvim-lspconfig'

Plug 'folke/lsp-colors.nvim'
Plug 'hrsh7th/nvim-compe'

Plug 'mfussenegger/nvim-jdtls'

" Under bar
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"" NerdTree
Plug 'preservim/nerdtree' |
            \ Plug 'Xuyuanp/nerdtree-git-plugin' |
            " \ Plug 'ryanoasis/vim-devicons'

" Smooth
Plug 'yuttie/comfortable-motion.vim'
call plug#end()
