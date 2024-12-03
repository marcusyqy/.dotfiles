-- vim.opt.winblend = 0
-- vim.opt.wildoptions = "pum"
-- vim.opt.pumblend = 5

require("marcusyqy.color.gruvbox")

require('base16-colorscheme').with_config({
    telescope = false,
    indentblankline = true,
    notify = false,
    ts_rainbow = false,
    cmp = true,
    illuminate = false,
    dapui = false,
})

if os.getenv("SSH_TTY") ~= nil then
  -- vim.opt.termguicolors = false
  vim.cmd("colorscheme vim")
  vim.cmd([[highlight Comment ctermfg=green]])
else
  vim.cmd("colorscheme marcus-base16")
end

-- vim.cmd("hi Normal guibg=None")
-- vim.cmd("hi NormalNC guibg=None")
-- vim.cmd("hi LineNr guifg=orange guibg=#222222")
-- vim.cmd("hi LineNrBelow guifg=white guibg=#222222")
-- vim.cmd("hi LineNrAbove guifg=white guibg=#222222")
-- vim.cmd("hi IncSearch guibg=#555555")
