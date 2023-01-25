local Remaps         = require("marcusyqy.keymap")
local nnoremap       = Remaps.nnoremap
local format_on_save = true


local ToggleFormatOnSave = function()
    if not format_on_save then
        vim.opt.hlsearch = true
        format_on_save = true
    else
        vim.opt.hlsearch = false
        format_on_save = false
    end
end
nnoremap("<leader>tvf", ToggleFormatOnSave)


local M = {}
M.on = format_on_save
return M
