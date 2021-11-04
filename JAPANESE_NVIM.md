## Requirements:

Download the dictionary:

```
$ pacman -S skk-jisyo
```

Install eskk.vim plugin:

```nvim
Plug 'vim-skk/eskk.vim'
```

From:

https://vi.stackexchange.com/questions/8733/can-i-write-japanese-skk-text-in-vim

Set:

```nvim
let g:eskk#large_dictionary = {
\   'path': '/usr/share/skk/SKK-JISYO.L',
\   'sorted': 1,
\   'encoding': 'euc-jp',
\ }
```

## Cheatsheet:

* <C-j> enables processing (eskk). Toggles to be precise. The alpha characters you type get converted to hiragana. Insert mode is indicated as INSERT (lang) when eskk is enabled. E.g. a<C-j>nihonn.

When eskk is enabled:

* Press q to switch (toggle) it to converting to katakana. E.g. a<C-j>qbasu.

* Type ; (displayed as ▽), the word (romaji representation), then press <Space> to convert it to kanji. E.g. a<C-j>;nihonn<Space>. If you had other kanji in mind, use <Space>/x to switch between the alternatives .

* If the word contains okurigana (hiragana characters at the end of the word), separate it from kanji('s) with ; (displayed as *). E.g. a<C-j>;ta;beru.

* To display a list of suggestions, type ; (displayed as ▽), at least 2 kanas (their romaji representation), then press <C-x><C-o>. E.g.a<C-j>;nihonn<C-x><C-o>.

## In case you want to enable logging:

* let g:eskk#log_file_level = 4

By default the logs are written to ~/.eskk/log. In case you want to log additional information you can use: call eskk#logger#debug('...')

With this plugin YY@" doesn't execute the command, you need to additionally press Enter. E.g. a:!ls<Esc>YY@" -> a:!ls<Esc>YY@"<Enter>. And after that eskk remains enabled. The reason for that is the default mappings (<C-j>) getting triggered. YY copies :!ls^J into the " register, which then gets executed with @". But instead of processing ^J literally (running the command), it enables eskk. So you might want to disable the default mappings (let g:eskk#no_default_mappings = 1), or do cmap <Leader>j <Plug>(eskk:toggle).
