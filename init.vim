" Specify a directory for plugins

call plug#begin('~/.vim/plugged')
"Plug 'neoclide/coc.nvim', {'branch': 'release', 'do': { -> coc#util#install()}}
Plug 'kabouzeid/nvim-lspinstall'

""lsp stuff
Plug 'neovim/nvim-lspconfig'
"Plug 'nvim-lua/completion-nvim'
"Plug 'tjdevries/nlua.nvim'
"Plug 'tjdevries/lsp_extensions.nvim'

"Plug 'neovim/nvim-lspconfig'
"Plug 'scrooloose/nerdtree'
"Plug 'tsony-tsonev/nerdtree-git-plugin'
"Plug 'Xuyuanp/nerdtree-git-plugin'
"Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
"Plug 'ryanoasis/vim-devicons'
"Plug 'airblade/vim-gitgutter'
"ctrl-p to find path files
Plug 'ctrlpvim/ctrlp.vim' " fuzzy find files
Plug 'scrooloose/nerdcommenter'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

Plug 'christoomey/vim-tmux-navigator'

Plug 'morhetz/gruvbox'

"Plug 'HerringtonDarkholme/yats.vim' " TS Syntax



" Initialize plugin system
call plug#end()

colorscheme gruvbox
set smarttab
set cindent
set tabstop=4
set shiftwidth =4

"set relative number 
set rnu

