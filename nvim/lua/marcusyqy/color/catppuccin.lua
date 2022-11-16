local is_transparent = require("marcusyqy.settings").transparent_window
local settings = {
    transparent_background = is_transparent,
}
-- configure it
require("catppuccin").setup(settings)

vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha
vim.g.background = "dark"
vim.cmd("colorscheme catppuccin")
