" Left number
set number
set relativenumber

"
set title

" Dev icons
set encoding=UTF-8

"
set linebreak

" Identation
set expandtab
set tabstop=4
set shiftwidth=4

" Markdown highlight
let g:markdown_fenced_languages = ['bash=sh', 'javascript', 'js=javascript', 'json=javascript', 'typescript', 'ts=typescript', 'php', 'html', 'css']

" Colors
colorscheme badwolf
syntax on

"" Make the gutters darker than the background.
let g:badwolf_darkgutter = 1

"" Turn on CSS properties highlighting
let g:badwolf_css_props_highlight = 1
