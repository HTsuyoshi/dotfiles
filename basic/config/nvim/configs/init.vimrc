call plug#begin('~/.config/nvim/plugged')
" Latex
 " Syntax plug-in
 Plug 'lervag/vimtex'
 " Folder sections
 Plug 'matze/vim-tex-fold'

" Shortcuts
 " Easy surround
 Plug 'tpope/vim-surround'
 " Comment
 Plug 'tpope/vim-commentary'

" Misc
 " Change workdir when opening file
 Plug 'airblade/vim-rooter'

" Useless configuration
 " Under bar
 Plug 'bling/vim-airline' |
    Plug 'vim-airline/vim-airline-themes'
 " Nvim discord status
 Plug 'andweeb/presence.nvim'

" Themes
"Plug 'monsonjeremy/onedark.nvim'
 Plug 'Luxed/ayu-vim'

" Coding
 " Snippets
 Plug 'SirVer/ultisnips' |
	Plug 'honza/vim-snippets'
 " Language Server Protocol
 Plug 'neovim/nvim-lspconfig'
 " Autocomplete
 Plug 'hrsh7th/nvim-compe'
 Plug 'nvim-lua/completion-nvim'
 " Syntax Highlighting
 Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} |
	Plug 'folke/lsp-colors.nvim' " Colors not supported by nvim
 " File Exploring
Plug 'preservim/nerdtree' |
	\ Plug 'tiagofumo/vim-nerdtree-syntax-highlight' |
	\ Plug 'Xuyuanp/nerdtree-git-plugin' |
	\ Plug 'ryanoasis/vim-devicons'

call plug#end()
