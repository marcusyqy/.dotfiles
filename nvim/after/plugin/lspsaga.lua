local Remap = require("marcusyqy.keymap")
local nnoremap = Remap.nnoremap
local vnoremap = Remap.vnoremap
local vimfn = Remap.vimfn

local saga = require("lspsaga")

-- change the lsp symbol kind
local kind = require("lspsaga.lspkind")
-- kind[type_number][2] = icon -- see lua/lspsaga/lspkind.lua

-- use default config

-- use custom config
saga.init_lsp_saga({
    -- Options with default value
    -- "single" | "double" | "rounded" | "bold" | "plus"
    border_style = "single",
    --the range of 0 for fully opaque window (disabled) to 100 for fully
    --transparent background. Values between 0-30 are typically most useful.
    saga_winblend = 0,
    -- when cursor in saga window you config these to move
    move_in_saga = { prev = '<C-p>',next = '<C-n>'},
    -- Error, Warn, Info, Hint
    -- use emoji like
    -- { "🙀", "😿", "😾", "😺" }
    -- or
    -- { "😡", "😥", "😤", "😐" }
    -- and diagnostic_header can be a function type
    -- must return a string and when diagnostic_header
    -- is function type it will have a param `entry`
    -- entry is a table type has these filed
    -- { bufnr, code, col, end_col, end_lnum, lnum, message, severity, source }
    diagnostic_header = { " ", " ", " ", "ﴞ " },
    -- preview lines of lsp_finder and definition preview
    max_preview_lines = 10,
    -- use emoji lightbulb in default
    code_action_icon = "💡",
    -- if true can press number to execute the codeaction in codeaction window
    code_action_num_shortcut = true,
    -- same as nvim-lightbulb but async
    code_action_lightbulb = {
        enable = true,
        enable_in_insert = true,
        cache_code_action = true,
        sign = true,
        update_time = 150,
        sign_priority = 20,
        virtual_text = true,
    },
    -- finder icons
    finder_icons = {
      def = '  ',
      ref = '諭 ',
      link = '  ',
    },
    -- finder do lsp request timeout
    -- if your project big enough or your server very slow
    -- you may need to increase this value
    finder_request_timeout = 1500,
    finder_action_keys = {
        open = "o",
        vsplit = "s",
        split = "i",
        tabe = "t",
        quit = "q",
    },
    code_action_keys = {
        quit = "q",
        exec = "<CR>",
    },
    definition_action_keys = {
      edit = '<esc>o',
      vsplit = '<esc>v',
      split = '<esc>i',
      tabe = '<esc>t',
      quit = 'q',
    },
    rename_action_quit = "<esc>",
    rename_in_select = true,
    -- show symbols in winbar must nightly
    symbol_in_winbar = {
        in_custom = false,
        enable = false,
        separator = ' ',
        show_file = true,
        click_support = false,
    },
    -- show outline
    show_outline = {
      win_position = 'right',
      --set special filetype win that outline window split.like NvimTree neotree
      -- defx, db_ui
      win_with = '',
      win_width = 30,
      auto_enter = true,
      auto_preview = true,
      virt_text = '┃',
      jump_key = 'o',
      -- auto refresh when change buffer
      auto_refresh = true,
    },
    -- custom lsp kind
    -- usage { Field = 'color code'} or {Field = {your icon, your color code}}
    custom_kind = {},
    -- if you don't use nvim-lspconfig you must pass your server name and
    -- the related filetypes into this table
    -- like server_filetype_map = { metals = { "sbt", "scala" } }
    server_filetype_map = {},
})



nnoremap("<leader>rr", vimfn([[Lspsaga lsp_finder]]))

nnoremap("<leader>ca", vimfn([[Lspsaga code_action]]), { silent = true,noremap = true })
vnoremap("<leader>ca", function()
    vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<C-U>", true, false, true))
    vimfn([[Lspsaga range_code_action]])
end, { silent = true,noremap =true })


nnoremap("<leader>o", vimfn([[LSoutlineToggle]]), {silent = true, noremap = true})

-- show hover doc and press twice will jumpto hover window
nnoremap("K", vimfn([[Lspsaga hover_doc]]), { silent = true })
nnoremap("gs",  vimfn([[Lspsaga signature_help]]), { silent = true,noremap = true})
--
-- preview definition
nnoremap("gp", vimfn([[Lspsaga preview_definition]]), { silent = true,noremap = true })
nnoremap("gr", vimfn([[Lspsaga rename]]), { silent = true,noremap = true })

-- jump and show diagnostic (try)
nnoremap("<leader>gh", vimfn([[Lspsaga show_line_diagnostics]]), { silent = true,noremap = true })
vnoremap("<leader>gh", vimfn([[Lspsaga show_line_diagnostics]]), { silent = true,noremap = true })

-- jump diagnostic
nnoremap("<c-k>", vimfn([[Lspsaga diagnostic_jump_prev]]), { silent = true, noremap =true })
nnoremap("<c-j>", vimfn([[Lspsaga diagnostic_jump_next]]), { silent = true, noremap =true })
-- or use command

