vim.g.tokyonight_transparent_sidebar = true
vim.g.tokyonight_transparent = true
vim.g.background = "dark"

vim.g.tokyonight_italic_comments	= true	-- Make comments italic
vim.g.tokyonight_italic_keywords	= true	-- Make keywords italic
vim.g.tokyonight_italic_variables	= false	-- Make variables and identifiers italic,
vim.g.tokyonight_italic_functions	= false	-- Make functions italic
vim.g.tokyonight_dark_float	= true	-- Float windows like the lsp diagnostics windows get a darker background.
vim.g.tokyonight_lualine_bold	= true
vim.g.tokyonight_hide_inactive_statusline = false-- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard StatusLine and LuaLine.

-- allow telescope to be transparent
vim.g.tokyonight_colors = {
    bg_float = "none"
}

vim.cmd([[colorscheme tokyonight]])
