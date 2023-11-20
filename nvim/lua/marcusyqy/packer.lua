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
        "folke/lsp-colors.nvim",
        "hrsh7th/cmp-nvim-lua",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/nvim-cmp"
    }

    -- Lua
    use {
        "folke/zen-mode.nvim"
    }

    if vim.fn.has("win32") == 1 then
        use { "nvim-telescope/telescope-fzy-native.nvim" }
    else
        use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
    end

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
        "theprimeagen/git-worktree.nvim",
        "stevearc/dressing.nvim",
        "nvim-telescope/telescope-file-browser.nvim",
        "nvim-telescope/telescope-project.nvim"
    }

    use {
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip"
    }

    -- use 'lukas-reineke/indent-blankline.nvim' -- Add indentation guides even on blank lines
    -- use { 'lewis6991/gitsigns.nvim' }

    -- status line
    use {
        {
            "nvimdev/whiskyline.nvim"
        },
        {
            'nvim-lualine/lualine.nvim',
            requires = { 'kyazdani42/nvim-web-devicons', opt = true }
        },
        {
            'tjdevries/express_line.nvim',
            requires = { 'kyazdani42/nvim-web-devicons', opt = true }
        },
        {
            'feline-nvim/feline.nvim',
            requires = { 'kyazdani42/nvim-web-devicons', opt = true }
        }
    }

    -- Post-install/update hook with neovim command
    -- use {
    --     {
    --         "nvim-treesitter/nvim-treesitter",
    --         run = function() pcall(require('nvim-treesitter.install').update { with_sync = true }) end -- run install
    --     },
    --     'nvim-treesitter/nvim-treesitter-context',
    --     'nvim-treesitter/playground',
    --     'MunifTanjim/nui.nvim'
    -- }

    -- use { -- Additional text objects via treesitter
    --     'nvim-treesitter/nvim-treesitter-textobjects',
    --     after = 'nvim-treesitter',
    -- }
    use("mbbill/undotree")
    -- Packer
    -- use({
    --     "folke/noice.nvim",
    --     requires = {
    --         -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    --         "MunifTanjim/nui.nvim",
    --         -- OPTIONAL:
    --         --   `nvim-notify` is only needed, if you want to use the notification view.
    --         --   If not available, we use `mini` as the fallback
    --         "rcarriga/nvim-notify",
    --     }
    -- },
    --     {
    --         "rcarriga/nvim-notify"
    --     })


    -- colorschemes
    use {
        -- Using Packer:
        { "Mofiqul/dracula.nvim" },
        { "folke/tokyonight.nvim",         branch = "main" },
        { 'projekt0n/github-nvim-theme',   tag = 'v0.0.7' },
        { "ellisonleao/gruvbox.nvim" },
        { "marko-cerovac/material.nvim" },
        { 'tjdevries/colorbuddy.vim' },
        { 'tjdevries/gruvbuddy.nvim' },
        { 'Mofiqul/vscode.nvim' },
        { "svrana/neosolarized.nvim" },
        { "craftzdog/solarized-osaka.nvim" },
        { "rebelot/kanagawa.nvim" },
        { "rmehri01/onenord.nvim" },
        {
            'navarasu/onedark.nvim'
        },
        { "blazkowolf/gruber-darker.nvim" },
        {
            "mcchrish/zenbones.nvim",
            -- Optionally install Lush. Allows for more configuration or extending the colorscheme
            -- If you don't want to install lush, make sure to set g:zenbones_compat = 1
            -- In Vim, compat mode is turned on as Lush only works in Neovim.
            requires = "rktjmp/lush.nvim"
        }
    }


    use {
        "skywind3000/asynctasks.vim",
        "skywind3000/asyncrun.vim",
        --     "GustavoKatel/telescope-asynctasks.nvim"
    }

    use "voldikss/vim-floaterm"

    -- use {
    --     "mfussenegger/nvim-dap",
    --     "rcarriga/nvim-dap-ui",
    --     "theHamsta/nvim-dap-virtual-text"
    -- }

    -- tpope
    use {
        "tpope/vim-repeat",
        "tpope/vim-fugitive",
        "tpope/vim-rhubarb"
    }

    use({
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end,
    })

    use({
        "kylechui/nvim-surround",
        tag = "*", -- Use for stability; omit to use `main` branch for the latest features
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    })


    -- hydra
    -- use {
    --     "anuvyklack/keymap-layer.nvim",
    --     "anuvyklack/hydra.nvim"
    -- }

    -- nvim-tree
    -- kyazdani42
    use {
        "nvim-tree/nvim-web-devicons", -- for file icons
        "nvim-tree/nvim-tree.lua"
    }

    use {
        "mrbjarksen/neo-tree-diagnostics.nvim",
        requires = "nvim-neo-tree/neo-tree.nvim",
        module = "neo-tree.sources.diagnostics", -- if wanting to lazyload
    }

    use {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v2.x",
        requires = {
            "nvim-lua/plenary.nvim",
            "kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
            {
                -- only needed if you want to use the commands with "_with_window_picker" suffix
                's1n7ax/nvim-window-picker',
                tag = "v1.*",
                config = function()
                    require 'window-picker'.setup({
                        autoselect_one = true,
                        include_current = false,
                        filter_rules = {
                            -- filter using buffer options
                            bo = {
                                -- if the file type is one of following, the window will be ignored
                                filetype = { 'neo-tree', "neo-tree-popup", "notify", "quickfix" },
                                -- if the buffer type is one of following, the window will be ignored
                                buftype = { 'terminal' },
                            },
                        },
                        other_win_hl_color = '#e35e4f',
                    })
                end,
            }
        }
    }

    use { "peterhoeg/vim-qml" }
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
        "sbdchd/neoformat"
    }

    -- use({
    --     "nvimdev/lspsaga.nvim",
    --     requires = {
    --         { "nvim-tree/nvim-web-devicons" },
    --         --Please make sure you install markdown and markdown_inline parser
    --         { "nvim-treesitter/nvim-treesitter" }
    --     }
    -- })

    use {
        { "bfrg/vim-cpp-modern" },
        "martinda/Jenkinsfile-vim-syntax",
        { "kalvinpearce/ShaderHighlight" },
        { "evanleck/vim-svelte",         branch = "main" }
    }

    use { 'numToStr/Comment.nvim' }

    use("APZelos/blamer.nvim")

    use { 'windwp/nvim-autopairs' }
    -- use { 'windwp/nvim-ts-autotag' }
    use { 'alvarosevilla95/luatab.nvim', requires = 'kyazdani42/nvim-web-devicons' }
    use { 'p00f/clangd_extensions.nvim', commit = "798e377ec859087132b81d2f347b5080580bd6b1" }
    use { 'ranjithshegde/ccls.nvim' }
    -- use { 'jose-elias-alvarez/null-ls.nvim' } -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua
    use { 'jose-elias-alvarez/typescript.nvim' }

    use { "ktunprasert/gui-font-resize.nvim" }
    use { 'Bekaboo/deadcolumn.nvim' }
    use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim'
    }


    use { 'neomake/neomake' }
    -- potential plugins to use
    -- use {
    --     "utilyre/barbecue.nvim",
    -- }
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
