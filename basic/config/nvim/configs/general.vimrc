lua require('config')

" Theme
syntax on
set termguicolors
colorscheme onedark

" Functionality
set clipboard=unnamedplus
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

" Highlight to .sage files
au BufRead,BufNewFile *.sage setfiletype python

