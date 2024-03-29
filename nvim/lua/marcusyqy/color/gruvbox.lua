require("gruvbox").setup({
    undercurl = true,
    underline = true,
    bold = true,
    italic = {
        strings = false,
        operators = false,
        folds = false,
        comments = false
    },
    strikethrough = true,
    invert_selection = false,
    invert_signs = false,
    invert_tabline = false,
    invert_intend_guides = false,
    inverse = true,    -- invert background for search, diffs, statuslines and errors
    contrast = "hard", -- can be "hard", "soft" or empty string
    palette_overrides = {},
    overrides = {
        SignColumn = { bg = "none" },
        NormalFloat = { bg = "none" }
    },
    dim_inactive = false,
    transparent_mode = true,
})

vim.cmd([[colorscheme gruvbox]])
