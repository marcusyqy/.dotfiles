local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
local is_bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    is_bootstrap = true
    vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
    vim.cmd [[packadd packer.nvim]]
end


-- This file can be loaded by calling `lua require('plugins')` from your init.vim
vim.cmd([[
    augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
    augroup end
]])

-- Only required if you have packer configured as `opt`
-- vim.cmd [[packadd packer.nvim]]

local packer = require('packer').startup(function()
    -- Packer can manage itself
    use "wbthomason/packer.nvim"

    -- cmp
    use {
        "hrsh7th/cmp-nvim-lua",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/nvim-cmp",
    }

    use { "stevearc/oil.nvim" }



    if vim.fn.has("win32") == 1 then
        use { "nvim-telescope/telescope-fzy-native.nvim" }
    else
        use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
    end

    use { "nvim-treesitter/nvim-treesitter" }

    use {
        "nvim-lua/popup.nvim",
        "nvim-lua/plenary.nvim",
        {
            "nvim-telescope/telescope.nvim",
            requires = {
                "nvim-lua/popup.nvim",
                "nvim-lua/plenary.nvim",
            }
        },
        {
            "nvim-telescope/telescope-live-grep-args.nvim"
        },
        {
            "theprimeagen/harpoon",
            requires = {
                "nvim-lua/popup.nvim",
                "nvim-lua/plenary.nvim",
            }
        },
        -- "stevearc/dressing.nvim",
        "nvim-telescope/telescope-project.nvim"
    }

    use {
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip"
    }


    -- colorschemes
    use {
        { "RRethy/base16-nvim"},
        { "ellisonleao/gruvbox.nvim"   },
        { "tpope/vim-vividchalk" },
        { "tjdevries/colorbuddy.nvim"  },
    }

    -- tpope
    use {
        "tpope/vim-fugitive",
    }


    use { -- LSP Configuration & Plugins
        'neovim/nvim-lspconfig',
        requires = {
            -- Automatically install LSPs to stdpath for neovim
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',

            -- Useful status updates for LSP
            { 'j-hui/fidget.nvim', tag = "legacy" }
        },
    }

    use {
        "onsails/lspkind-nvim",
        "nvim-lua/lsp_extensions.nvim",
    }

    use { -- highlights
        { "peterhoeg/vim-qml" },
        { "bfrg/vim-cpp-modern" },
        { "evanleck/vim-svelte" },
        { "martinda/Jenkinsfile-vim-syntax" },
        { "kalvinpearce/ShaderHighlight" }
    }

    use { 'numToStr/Comment.nvim' }

    use { 'alvarosevilla95/luatab.nvim', requires = 'kyazdani42/nvim-web-devicons' }
    use { 'p00f/clangd_extensions.nvim', commit = "798e377ec859087132b81d2f347b5080580bd6b1" }
    use { 'mrcjkb/rustaceanvim' }
    use { "folke/lazydev.nvim" }

    -- use { 'Bekaboo/deadcolumn.nvim' }
    use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }

    use { 'nvim-pack/nvim-spectre' }

    use { "jremmen/vim-ripgrep" }
    use { "mileszs/ack.vim" }
    use { "duane9/nvim-rg" }

    local has_plugins, plugins = pcall(require, 'custom.plugins')
    if has_plugins then
        plugins(use)
    end

    if is_bootstrap then
        require('packer').sync()
    end
end)

if is_bootstrap then
    print '=================================='
    print '    Plugins are being installed'
    print '    Wait until Packer completes,'
    print '       then restart nvim'
    print '=================================='
    return
end

local packer_group = vim.api.nvim_create_augroup('Packer', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost', {
    command = 'source <afile> | PackerCompile',
    group = packer_group,
    pattern = vim.fn.expand '$MYVIMRC',
})
return packer
