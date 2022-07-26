-- This file can be loaded by calling `lua require('plugins')` from your init.vim

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

-- Only required if you have packer configured as `opt`
-- vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
    -- Packer can manage itself
    use "wbthomason/packer.nvim"


    -- cmp
    use {
        "folke/lsp-colors.nvim",
        "hrsh7th/cmp-nvim-lua",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/nvim-cmp"
    }

    use {
        "nvim-lua/popup.nvim",
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope.nvim",
        "nvim-telescope/telescope-fzy-native.nvim",
        "theprimeagen/harpoon",
        "theprimeagen/git-worktree.nvim",
        "stevearc/dressing.nvim",
        "nvim-telescope/telescope-file-browser.nvim",
        "nvim-telescope/telescope-project.nvim"
    }

    use {
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip"
    }

    -- status line
    use {
      'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    -- Post-install/update hook with neovim command
    use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }

    -- colorschemes
    use {
        {"folke/tokyonight.nvim",  branch = "main"},
        {"luisiacc/gruvbox-baby", branch = "main"},
        {"ayu-theme/ayu-vim"}, -- or other package manager
        {"catppuccin/nvim", as = "catppuccin"}
    }

    use {
        "skywind3000/asynctasks.vim",
        "skywind3000/asyncrun.vim",
        "GustavoKatel/telescope-asynctasks.nvim"
    }

    use "voldikss/vim-floaterm"

    use {
        "mfussenegger/nvim-dap",
        "rcarriga/nvim-dap-ui",
        "theHamsta/nvim-dap-virtual-text"
    }

    -- tpope
    use  {
        "tpope/vim-surround",
        "tpope/vim-repeat",
        "tpope/vim-fugitive",
        "tpope/vim-rhubarb"
    }

    -- hydra
    use {
        "anuvyklack/keymap-layer.nvim",
        "anuvyklack/hydra.nvim"
    }

    -- nvim-tree
    use {
        "kyazdani42/nvim-web-devicons", -- for file icons
        "kyazdani42/nvim-tree.lua"
    }

    use {
        "onsails/lspkind-nvim",
        "nvim-lua/lsp_extensions.nvim",
        "neovim/nvim-lspconfig",
        "glepnir/lspsaga.nvim",
        "sbdchd/neoformat"

    }

    use {
        "martinda/Jenkinsfile-vim-syntax",
        "rmagatti/auto-session",
        "preservim/nerdcommenter",
        { "evanleck/vim-svelte", branch = "main"}
    }

    -- Use specific branch, dependency and run lua file after load
    --
    -- use {
    --   'glepnir/galaxyline.nvim', branch = 'main', config = function() require 'statusline' end,
    --   requires = {'kyazdani42/nvim-web-devicons'}
    -- }
    --
end)
