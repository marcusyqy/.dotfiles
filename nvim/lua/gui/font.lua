-- locals
local Remaps   = require("marcusyqy.keymap")
local nnoremap = Remaps.nnoremap
local inoremap = Remaps.inoremap

local font_size = 13;
local function set_font_size(new_font_size)
    font_size = new_font_size
    vim.opt.guifont = { "JetBrainsMono NF", ":h" .. tostring(font_size) }
end

local function print_front_size()
    print(font_size)
end

local function adjust_font_size(delta)
    font_size = font_size + delta
    vim.opt.guifont = { "JetBrainsMono NF", ":h" .. tostring(font_size) }
end

nnoremap("<C-ScrollWheelUp>", function() adjust_font_size(1) end)
nnoremap("<C-ScrollWheelDown>", function() adjust_font_size(-1) end)
inoremap("<C-ScrollWheelUp>", function() adjust_font_size(1) end)
inoremap("<C-ScrollWheelDown>", function() adjust_font_size(-1) end)

set_font_size(font_size)

local M = {}
M.set = set_font_size
M.print = print_front_size
return M

