let maplocalleader = "\\"
augroup exe_code
    autocmd!

    " execute python code
    autocmd FileType python nnoremap <buffer> <localleader>r
                \ :sp <CR> :term python3 %<CR> :startinsert<CR>

    " execute cpp code
    autocmd FileType cpp nnoremap <buffer> <localleader>c
                    \ :sp <CR> :term g++ %<CR> :startinsert<CR>

    autocmd FileType cpp nnoremap <buffer> <localleader>r
                    \ :sp <CR> :term ./a.out :startinsert<CR>

augroup END
