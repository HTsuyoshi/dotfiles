filetype on
filetype plugin on

" Functionality
"" Identation
set expandtab
set tabstop=4
set shiftwidth=4

" Customize
set number
set relativenumber
set title
set linebreak
set colorcolumn=80

" Dev icons
set encoding=UTF-8

" Markdown highlight
let g:markdown_fenced_languages = ['bash=sh', 'javascript', 'js=javascript', 'json=javascript', 'typescript', 'ts=typescript', 'php', 'html', 'css']

" Colors
colorscheme badwolf
syntax on
set termguicolors

"" Make the gutters darker than the background.
let g:badwolf_darkgutter = 1

"" Turn on CSS properties highlighting
let g:badwolf_css_props_highlight = 1

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

    autocmd FileType cpp nnoremap <buffer> <localleader>r
                \ :sp <CR> :term ./a.out :startinsert<CR>

augroup END

" nvim-lspconfig
augroup lsp                                                                                       
    au!                                                                                             

    au FileType python 
                \ lua require'lspconfig'.pyright.setup{}
    au FileType cpp 
                \ lua require'lspconfig'.ccls.setup{}
    au FileType java 
                \ lua require('jdtls').start_or_attach({cmd = {'java-lsp.sh'}})
augroup end
