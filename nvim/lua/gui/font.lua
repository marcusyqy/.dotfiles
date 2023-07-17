-- locals
local Remaps   = require("marcusyqy.keymap")
local nnoremap = Remaps.nnoremap
local inoremap = Remaps.inoremap
local vimfn    = Remaps.vimfn

require("gui-font-resize").setup()

nnoremap("<C-ScrollWheelUp>", vimfn([[GUIFontSizeUp]]))
nnoremap("<C-ScrollWheelDown>", vimfn([[GUIFontSizeDown]]))
inoremap("<C-ScrollWheelUp>", vimfn([[GUIFontSizeUp]]))
inoremap("<C-ScrollWheelDown>", vimfn([[GUIFontSizeDown]]))

vim.cmd([[
    if exists(':GuiFont')
        " Use GuiFont! to ignore font errors
        GuiFont FiraCode\ Nerd\ Font\ Mono:h11
    endif
]])

