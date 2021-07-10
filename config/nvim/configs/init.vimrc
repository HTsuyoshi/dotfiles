call plug#begin('~/.config/nvim/plugged')
" Coding
"" Template
Plug 'pianocomposer321/project-templates.nvim', { 'do': ':UpdateRemotePlugins' }

"" Autocomplete
Plug 'neoclide/coc.nvim', { 'branch': 'release' }

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
