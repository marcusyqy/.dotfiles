local Remap = require("marcusyqy.keymap")
local nnoremap = Remap.nnoremap
local vnoremap = Remap.vnoremap

require("notify").setup({
    background_colour = "#000000",
    stages = "fade_in_slide_out"
})
vim.notify = require("notify")



nnoremap("<c-t>", function() require("notify").dismiss() end, { silent = true, noremap =true })
vnoremap("<c-t>", function() require("notify").dismiss() end, { silent = true, noremap =true })
