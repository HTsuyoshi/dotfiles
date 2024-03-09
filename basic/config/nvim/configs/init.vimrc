call plug#begin('~/.config/nvim/plugged')
" Latex
 " Folder sections
 Plug 'github/copilot.vim'

" Latex
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
 Plug 'navarasu/onedark.nvim'
 "Plug 'Shatur/neovim-ayu'

" Coding
 " Snippets
 Plug 'SirVer/ultisnips' |
	Plug 'honza/vim-snippets'
 " Language Server Protocol
 Plug 'neovim/nvim-lspconfig'
 Plug 'hrsh7th/cmp-nvim-lsp'
 " Autocomplete
 Plug 'hrsh7th/cmp-nvim-lua'
 Plug 'hrsh7th/cmp-buffer'
 Plug 'hrsh7th/cmp-path'
 Plug 'hrsh7th/cmp-cmdline'
 Plug 'hrsh7th/nvim-cmp'
 Plug 'quangnguyen30192/cmp-nvim-ultisnips'
 "Plug 'nvim-lua/completion-nvim'
 " Diagnostics, references, telescope
 Plug 'folke/trouble.nvim'

 " Syntax Highlighting
 Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} |
	Plug 'folke/lsp-colors.nvim' " Colors not supported by nvim

 " File Exploring
 Plug 'preservim/nerdtree' |
	\ Plug 'tiagofumo/vim-nerdtree-syntax-highlight' |
	\ Plug 'Xuyuanp/nerdtree-git-plugin' |
	\ Plug 'ryanoasis/vim-devicons'

call plug#end()
