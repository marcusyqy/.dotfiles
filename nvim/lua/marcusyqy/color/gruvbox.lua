
require("gruvbox").setup({
    undercurl = true,
    underline = true,
    bold = true,
    italic = {
        strings = true,
        operators = false,
        folds = false,
        comments = true
    },
    strikethrough = true,
    invert_selection = true,
    invert_signs = false,
    invert_tabline = false,
    invert_intend_guides = true,
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

