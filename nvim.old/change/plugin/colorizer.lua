if not vim.g.loaded_colorizer then return end
-- require 'colorizer'.setup()
require("colorizer").setup {
    filetypes = { '*',  '!TelescopeResults' }
}
