" Theme
syntax on
set termguicolors
set background=dark
let g:ayucolor="mirage"
colorscheme ayu

" Functionality
set tabstop=4
set shiftwidth=4
set list
set number
set relativenumber
set title
set linebreak
set colorcolumn=80
set showbreak=↪\ 
set listchars=tab:→\ ,nbsp:␣,trail:•,extends:⟩,precedes:⟨ ",eol:↲
set inccommand=split

" Identify files
filetype on
filetype plugin on

" Execute code
let maplocalleader = "\\"
augroup exe_code
    autocmd!
    " execute python code
    autocmd FileType python nnoremap <buffer> <localleader>r
                \ :sp <CR> :term python3 %<CR> :startinsert<CR>
    " compile and execute cpp code
    autocmd FileType cpp nnoremap <buffer> <localleader>c
                \ :sp <CR> :term g++ %<CR> :startinsert<CR>

    autocmd FileType cpp nnoremap <buffer> <localleader>r \ :sp <CR> :term ./a.out :startinsert<CR>
augroup END

" nvim-lspconfig
augroup lsp
    au!
    au FileType python
                \ lua require'lspconfig'.pyright.setup{}
    au FileType cpp
                \ lua require'lspconfig'.ccls.setup{}
    au FileType hs
                \ lua require'lspconfig'.hls.setup{}
    au FileType tex
                \ lua require'lspconfig'.texlab.setup{}
augroup end

" Highlight to .sage files
au BufRead,BufNewFile *.sage setfiletype python

lua require('config')
