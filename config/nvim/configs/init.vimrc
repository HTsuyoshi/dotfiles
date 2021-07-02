call plug#begin('~/.config/nvim/plugged')
" Coding
"" Autocomplete
Plug 'neoclide/coc.nvim', { 'branch': 'release' }

"" NerdTree
Plug 'preservim/nerdtree' |
            \ Plug 'Xuyuanp/nerdtree-git-plugin' |
            \ Plug 'ryanoasis/vim-devicons'

" Under bar
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Smooth
Plug 'yuttie/comfortable-motion.vim'
call plug#end()
