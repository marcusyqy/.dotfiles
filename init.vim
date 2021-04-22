set nocompatible "be iMproved
filetype off "required

" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

""lsp stuff
Plug 'neoclide/coc.nvim', {'branch': 'release', 'do': { -> coc#util#install()}}
"Plug 'neovim/nvim-lspconfig'
"
"Set git respos
Plug 'tpope/vim-fugitive'

"For file explorer
Plug 'preservim/nerdtree'


""lsp stuff
"Set git respos
Plug 'tpope/vim-fugitive'
"Plug 'scrooloose/nerdtree'
"Plug 'tsony-tsonev/nerdtree-git-plugin'
"Plug 'Xuyuanp/nerdtree-git-plugin'
"Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
"Plug 'ryanoasis/vim-devicons'
"Plug 'airblade/vim-gitgutter'

"ctrl-p to find path files
Plug 'ctrlpvim/ctrlp.vim' " fuzzy find files
"Plug 'scrooloose/nerdcommenter'
"Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
"Plug 'christoomey/vim-tmux-navigator'

"Color theme install
Plug 'morhetz/gruvbox'

" Initialize plugin system
call plug#end()

"set ctrl-t to file dir
map<silent> <C-t> :NERDTreeFocus<CR>
colorscheme gruvbox

filetype plugin indent on " required
syntax on
set colorcolumn=80
set background=dark
highlight ColorColumn ctermbg=0 guibg=lightgrey
set number
set nowrap
set smartcase
set hlsearch
set noerrorbells
set tabstop=4
set softtabstop =4
set expandtab
set smartindent
set shiftwidth =4
set cursorline
set hls is

"set relative number 
set rnu



