local is_transparent = require("marcusyqy.settings").transparent_window
local catppuccin = require("catppuccin")
local settings = {
    transparent_background = is_transparent,
    term_colors = false,
    styles = {
        comments = "italic",
        conditionals = "NONE",
        loops = "NONE",
        functions = "bold",
        keywords = "italic",
        strings = "NONE",
        variables = "NONE",
        numbers = "italic",
        booleans = "italic",
        properties = "NONE",
        types = "italic",
        operators = "NONE",
    },
    integrations = {
        treesitter = true,
        native_lsp = {
        enabled = true,
        virtual_text = {
            errors = "bold,italic",
            hints = "italic",
            warnings = "italic",
            information = "italic",
        },
        underlines = {
            errors = "underline",
            hints = "underline",
            warnings = "underline",
            information = "underline",
        },
    },
    coc_nvim = false,
    lsp_trouble = false,
    cmp = true,
    lsp_saga = false,
    gitgutter = false,
    gitsigns = true,
    telescope = true,
    nvimtree = {
        enabled = true,
        show_root = false,
        transparent_panel = true,
    },
    neotree = {
        enabled = false,
        show_root = false,
        transparent_panel = true,
    },
    which_key = false,
    indent_blankline = {
        enabled = true,
        colored_indent_levels = false,
    },
    dashboard = true,
    neogit = false,
    vim_sneak = false,
    fern = false,
    barbar = false,
    bufferline = true,
    markdown = true,
    lightspeed = false,
    ts_rainbow = false,
    hop = false,
    notify = true,
    telekasten = true,
    symbols_outline = true,
}
}
print("hello")
-- configure it
catppuccin.setup(settings)

vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha
vim.g.background = "dark"
vim.cmd("colorscheme catppuccin")
