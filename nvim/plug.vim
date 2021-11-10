"
" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif


" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

Plug 'gruvbox-community/gruvbox'

Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'

"this auto closes parenthesis
Plug 'cohama/lexima.vim'

Plug 'nvim-lualine/lualine.nvim'

" nvim-tree
Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'kyazdani42/nvim-tree.lua'

Plug 'onsails/lspkind-nvim'

Plug 'neovim/nvim-lspconfig'

" cmp
Plug 'folke/lsp-colors.nvim'
Plug 'hrsh7th/cmp-nvim-lua'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/nvim-cmp'

Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate All' }
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

Plug 'norcalli/nvim-colorizer.lua'   "Plug 'pwntester/octo.nvim'
Plug 'nvim-telescope/telescope-project.nvim'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'L3MON4D3/LuaSnip'

Plug 'martinda/Jenkinsfile-vim-syntax'
Plug 'rmagatti/auto-session'
Plug 'preservim/nerdcommenter'
Plug 'theprimeagen/harpoon'
Plug 'groenewege/vim-less', { 'for': 'less' }
Plug 'kchmck/vim-coffee-script', { 'for': 'coffee' }
Plug 'evanleck/vim-svelte', {'branch': 'main'}


" Initialize plugin system
call plug#end()

