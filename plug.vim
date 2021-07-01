
" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

Plug 'overcache/NeoSolarized'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'Raimondi/delimitMate'

""lsp stuff
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jackguo380/vim-lsp-cxx-highlight'
"Plug 'octol/vim-cpp-enhanced-highlight'

"Set git respos
Plug 'tpope/vim-fugitive'
Plug 'kdheepak/lazygit.nvim'

"For file explorer
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

Plug 'ryanoasis/vim-devicons'

"give squeegly lines
Plug 'airblade/vim-gitgutter'

Plug 'scrooloose/nerdcommenter'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

"Color theme install
Plug 'gruvbox-community/gruvbox'
Plug 'octol/vim-cpp-enhanced-highlight'

Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'rhysd/vim-clang-format'

Plug 'nathanaelkane/vim-indent-guides'

Plug 'kyazdani42/nvim-web-devicons'

Plug 'theprimeagen/vim-be-good'
Plug 'tjdevries/cyclist.vim'

" Initialize plugin system
call plug#end()

