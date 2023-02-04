vim.opt.mouse = "a"

require("gui.font")

if not require("gui.neovide").exists then
    require("gui.default")
end
