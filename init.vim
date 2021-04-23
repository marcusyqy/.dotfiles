set nocompatible "be iMproved
filetype off "required

" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

""lsp stuff
Plug 'neoclide/coc.nvim', {'branch': 'release', 'do': { -> coc#util#install()}}
"
"Set git respos
Plug 'tpope/vim-fugitive'

"For file explorer
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

"TODO(MARCUS) needs to set for neovide - Guifont 
"Actually works for Neovide - not sure why;
"CaskaydiaCove Nerd Font Book needed (need nerd font pack to be set on
"terminal)
Plug 'ryanoasis/vim-devicons'
"give squeegly lines 
Plug 'airblade/vim-gitgutter'

"ctrl-p to find path files
Plug 'ctrlpvim/ctrlp.vim' " fuzzy find files
Plug 'scrooloose/nerdcommenter'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
"Plug 'christoomey/vim-tmux-navigator'

"Color theme install
Plug 'morhetz/gruvbox'
Plug 'octol/vim-cpp-enhanced-highlight'

" Initialize plugin system
call plug#end()

"set ctrl-n to file dir
map<silent> <C-n> :NERDTreeFocus<CR>
"set ctrl-space to auto complete
inoremap <silent><expr> <c-space> coc#refresh()


"theme - here
colorscheme gruvbox

filetype plugin indent on " required
syntax on
set colorcolumn=80
set background=dark
highlight ColorColumn ctermbg=0 guibg=lightgrey

set number
"set relative number
set rnu
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




