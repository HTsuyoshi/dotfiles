
" Left number
set number
set relativenumber

"
set title

"
set expandtab
set tabstop=4
set shiftwidth=4

"
set linebreak

let g:markdown_fenced_languages = ['bash=sh', 'javascript', 'js=javascript', 'json=javascript', 'typescript', 'ts=typescript', 'php', 'html', 'css']

colorscheme badwolf
syntax on

" Make the gutters darker than the background.
let g:badwolf_darkgutter = 1

" Turn on CSS properties highlighting
let g:badwolf_css_props_highlight = 1

if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
    silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source ~/.config/nvim/init.vim
endif

" Plugins

call plug#begin('~/.config/nvim/plugged')

Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'scrooloose/nerdTree'

" Under bar
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Smooth
Plug 'yuttie/comfortable-motion.vim'

call plug#end()

" Airline

let g:airline_left_sep='' 
let g:airline_right_sep=''
let g:airline_detect_modified=1  
let g:airline_detect_paste=1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='badwolf'

" NerdTree

nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" Left number
set number
set relativenumber

"
set title

"
set expandtab
set tabstop=4
set shiftwidth=4

"
set linebreak

let g:markdown_fenced_languages = ['bash=sh', 'javascript', 'js=javascript', 'json=javascript', 'typescript', 'ts=typescript', 'php', 'html', 'css']

colorscheme badwolf
syntax on

" Make the gutters darker than the background.
let g:badwolf_darkgutter = 1

" Turn on CSS properties highlighting
let g:badwolf_css_props_highlight = 1
