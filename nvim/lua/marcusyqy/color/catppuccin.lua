local is_transparent = require("marcusyqy.settings").transparent_window
-- latte, frappe, macchiato, mocha
local settings = {
    transparent_background = is_transparent,
    flavour = "mocha",     background = {
        light = "latte",
        dark = "mocha"
    }
}
-- configure it
require("catppuccin").setup(settings)

vim.g.background = "dark"
vim.cmd("colorscheme catppuccin")
