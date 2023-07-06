-- local is_transparent = require("marcusyqy.settings").transparent_window
-- vim.g.tokyonight_transparent_sidebar = false
-- vim.g.tokyonight_transparent = false -- true
-- vim.g.background = "dark"
--
-- vim.g.tokyonight_italic_comments	= true	-- Make comments italic
-- vim.g.tokyonight_italic_keywords	= true	-- Make keywords italic
-- vim.g.tokyonight_italic_variables	= false	-- Make variables and identifiers italic,
-- vim.g.tokyonight_italic_functions	= false	-- Make functions italic
-- vim.g.tokyonight_dark_float	= true	-- Float windows like the lsp diagnostics windows get a darker background.
-- vim.g.tokyonight_lualine_bold	= true
-- vim.g.tokyonight_hide_inactive_statusline = false-- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard StatusLine and LuaLine.

-- allow telescope to be transparent
-- vim.g.tokyonight_colors = {
--     bg_float = "none",
--     border = "orange"
-- }

require("tokyonight").setup({
    -- your configuration comes here
    -- or leave it empty to use the default settings
    style = "moon", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
    light_style = "day", -- The theme is used when the background is set to light
    transparent = true, -- Enable this to disable setting the background color
    terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
    styles = {
        -- Style to be applied to different syntax groups
        -- Value is any valid attr-list value for `:help nvim_set_hl`
        comments = { italic = true },
        keywords = { italic = true },
        functions = {},
        variables = {},
        -- Background styles. Can be "dark", "transparent" or "normal"
        sidebars = "transparent", -- style for sidebars, see below
        floats = "transparent", -- style for floating windows
    },
    sidebars = { "qf", "help" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
    day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
    hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
    dim_inactive = false, -- dims inactive windows
    lualine_bold = true, -- When `true`, section headers in the lualine theme will be bold

    --- You can override specific color groups to use other groups or a hex color
    --- function will be called with a ColorScheme table
    ---@param colors ColorScheme
    on_colors = function(colors)
        colors.bg_float = "none"
        colors.border = "orange"
    end,

    --- You can override specific highlights to use other groups or a hex color
    --- function will be called with a Highlights and ColorScheme table
    ---@param highlights Highlights
    ---@param colors ColorScheme
    on_highlights = function(highlights, colors) end,
})

vim.cmd([[colorscheme tokyonight]])
