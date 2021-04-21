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

"Plug 'HerringtonDarkholme/yats.vim' " TS Syntax



" Initialize plugin system
call plug#end()

colorscheme gruvbox

set smarttab
set cindent
set tabstop=4
set shiftwidth =4

"set ctrl-t to file dir
map<silent> <C-t> :NERDTreeFocus<CR>
"set relative number 
set rnu


