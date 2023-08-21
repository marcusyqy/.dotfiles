require("gruber-darker").setup({
    bold = true,
    invert = {
        signs = false,
        tabline = false,
        visual = false,
    },
    italic = {
        strings = true,
        comments = true,
        operators = false,
        folds = true,
    },
    undercurl = true,
    underline = true,
    transparent = true
})

vim.cmd.colorscheme("gruber-darker")
