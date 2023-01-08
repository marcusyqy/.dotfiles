local status, autopairs = pcall(require, "nvim-autopairs")
if (not status) then return end

autopairs.setup({
    enable_check_bracket_line = true,
    disable_filetype          = { "TelescopePrompt", "vim" },
})

local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local cmp = require('cmp')
cmp.event:on(
    'confirm_done',
    cmp_autopairs.on_confirm_done()
)
