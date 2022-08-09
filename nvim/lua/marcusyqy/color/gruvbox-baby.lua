--
vim.g.gruvbox_baby_background_color	= "dark"	-- medium, dark
vim.g.gruvbox_baby_transparent_mode	= true	-- false, true - sets background colors to None
vim.g.gruvbox_baby_comment_style = 	"italic"	-- see :h attr-list
vim.g.gruvbox_baby_keyword_style = 	"italic"	-- see :h attr-list
vim.g.gruvbox_baby_function_style =	"bold"	-- see :h attr-list
vim.g.gruvbox_baby_variable_style =	"underline"	-- see :h attr-list
-- vim.g.gruvbox_baby_highlights	{}	-- override highlights with your custom colors
-- vim.g.gruvbox_baby_use_original_palette	= false	-- use the original gruvbox palette
vim.g.gruvbox_baby_telescope_theme = true
-- vim.g.gruvbox_baby_highlights = {Normal = {fg = "#123123", bg = "NONE", style="underline"}}

-- Load the colorscheme
vim.cmd[[colorscheme gruvbox-baby]]
