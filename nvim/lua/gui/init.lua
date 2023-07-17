vim.opt.mouse = "a"
vim.opt.mousemodel = "popup"

require("gui.font")

if not require("gui.neovide").exists then
    require("gui.default")
end
