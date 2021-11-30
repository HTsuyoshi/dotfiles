" Identify files
filetype on
filetype plugin on

" Highlight to .sage files
au BufRead,BufNewFile *.sage setfiletype python

" Colors
"colorscheme badwolf

syntax on
set termguicolors

"" Make the gutters darker than the background.
let g:badwolf_darkgutter = 1

"" Turn on CSS properties highlighting
let g:badwolf_css_props_highlight = 1

" Functionality
set expandtab
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

" Markdown highlight
let g:markdown_fenced_languages = ['bash=sh', 'javascript', 'js=javascript', 'json=javascript', 'typescript', 'ts=typescript', 'php', 'html', 'css']

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

lua require('config')
