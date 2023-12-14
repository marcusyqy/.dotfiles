-- locals
local Remaps   = require("marcusyqy.keymap")
local nnoremap = Remaps.nnoremap

local marcusyqy_hlsearch = true

local ToggleHLSearch = function()
    if not marcusyqy_hlsearch then
        vim.opt.hlsearch = true
        marcusyqy_hlsearch = true
    else
        vim.opt.hlsearch = false
        marcusyqy_hlsearch = false
    end
end

nnoremap("<leader>sh", ToggleHLSearch)
nnoremap("<c-s>", ToggleHLSearch)


local M = {}
M.hlsearch = marcusyqy_hlsearch
return M
