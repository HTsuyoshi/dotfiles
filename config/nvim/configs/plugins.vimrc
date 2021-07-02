" Airline
let g:airline_theme='badwolf'
" let g:airline_powerline_fonts = 1
let g:airline_detect_modified=1  
let g:airline_detect_paste=1
let g:airline#extensions#tabline#formatted = 'default'
let g:airline#extensions#tabline#enabled = 1

if !exists('g:airline_symbols')
        let g:airline_symbols = {}
endif



" NerdTree
"" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * silent NERDTreeMirror

"" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
        \ quit | endif
set modifiable

"" Start NERDTree when Vim is started without file arguments.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif



" Coc (Select autocomplete)
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
