""" eskk """
" Japanese Dictionary

let g:eskk#large_dictionary = {
\   'path': '/usr/share/skk/SKK-JISYO.L',
\   'sorted': 1,
\   'encoding': 'euc-jp',
\ }

""" Dev icons """
" set guifont=DroidSansMono\ Nerd\ Font\ 11

""" UltiSnips """

let g:UltiSnipsEditSplit = 'vertical'
let g:UltiSnipsSnippetsDir = '.config/nvim/UltiSnips'

let g:UltiSnipsExpandTrigger="<c-tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"


"""  Airline """
" let g:airline_theme='badwolf'
let g:airline_theme='violet'
" let g:airline_powerline_fonts = 1
let g:airline_detect_modified=1
let g:airline_detect_paste=1
let g:airline#extensions#tabline#formatted = 'default'
let g:airline#extensions#tabline#enabled = 1
if !exists('g:airline_symbols')
        let g:airline_symbols = {}
endif

""" NerdTree """

"" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * silent NERDTreeMirror

"" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
        \ quit | endif
set modifiable

"" Start NERDTree when Vim is started without file arguments.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif

"" Nerd Tree git plugin
let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'*',
                \ 'Staged'    :'+',
                \ 'Untracked' :'U',
                \ 'Renamed'   :'-',
                \ 'Unmerged'  :'=',
                \ 'Deleted'   :'x',
                \ 'Dirty'     :'D',
                \ 'Ignored'   :'N',
                \ 'Clean'     :'Y',
                \ 'Unknown'   :'?',
                \ }
