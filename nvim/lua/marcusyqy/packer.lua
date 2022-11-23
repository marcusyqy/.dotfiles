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

    if vim.fn.has("win32") == 1 then
        use {"nvim-telescope/telescope-fzy-native.nvim" }
    else
        use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
    end

    use {
        "nvim-lua/popup.nvim",
        "nvim-lua/plenary.nvim",
        { "nvim-telescope/telescope.nvim",
        requires = {
            "nvim-lua/popup.nvim",
            "nvim-lua/plenary.nvim",
        }},
        {"theprimeagen/harpoon",
        requires = {
            "nvim-lua/popup.nvim",
            "nvim-lua/plenary.nvim",
        }},
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
    use {
        { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" },
        'nvim-treesitter/nvim-treesitter-context',
        'nvim-treesitter/playground',
        'MunifTanjim/nui.nvim'
    }

    -- Packer
    use({
        "folke/noice.nvim",
        requires = {
            -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
            "MunifTanjim/nui.nvim",
            -- OPTIONAL:
            --   `nvim-notify` is only needed, if you want to use the notification view.
            --   If not available, we use `mini` as the fallback
            "rcarriga/nvim-notify",
        }
    })


    -- colorschemes
    use {
        {"folke/tokyonight.nvim",  branch = "main"},
        {"Mofiqul/vscode.nvim"},
        {"luisiacc/gruvbox-baby", branch = "main"},
        { "ellisonleao/gruvbox.nvim" },
        { "EdenEast/nightfox.nvim", run = ":NightfoxCompile", },
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
        "tpope/vim-repeat",
        "tpope/vim-fugitive",
        "tpope/vim-rhubarb"
    }

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
    use {
        "kyazdani42/nvim-web-devicons", -- for file icons
        "kyazdani42/nvim-tree.lua"
    }


    -- Unless you are still migrating, remove the deprecated commands from v1.x
    -- vim.g.neo_tree_remove_legacy_commands = 1

    use {
        "mrbjarksen/neo-tree-diagnostics.nvim",
        requires = "nvim-neo-tree/neo-tree.nvim",
        module = "neo-tree.sources.diagnostics", -- if wanting to lazyload
    }
    use {
      "rcarriga/nvim-notify"
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
              require'window-picker'.setup({
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

    use {
        "onsails/lspkind-nvim",
        "nvim-lua/lsp_extensions.nvim",
        "williamboman/nvim-lsp-installer",
        "neovim/nvim-lspconfig",
        "sbdchd/neoformat"
    }

    use({
        "glepnir/lspsaga.nvim", branch = "main" -- , commit="37bb464d55ba068ad14befd048c82cef007cea4d"
    })

    use {
        "martinda/Jenkinsfile-vim-syntax",
        "rmagatti/auto-session",
        "preservim/nerdcommenter",
        { "evanleck/vim-svelte", branch = "main"}
    }

    use("APZelos/blamer.nvim")

    use { 'alvarosevilla95/luatab.nvim', requires='kyazdani42/nvim-web-devicons' }
    use { 'p00f/clangd_extensions.nvim' }
    use { 'jose-elias-alvarez/typescript.nvim' }
    -- use {
    --     'numToStr/Comment.nvim',
    --     config = function()
    --         require('Comment').setup()
    --     end
    -- }

end)
