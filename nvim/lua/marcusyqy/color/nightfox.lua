local is_transparent = require("marcusyqy.settings").transparent_window
-- Default options
require('nightfox').setup({
  options = {
    -- Compiled file's destination location
    compile_path = vim.fn.stdpath("cache") .. "/nightfox",
    compile_file_suffix = "_compiled", -- Compiled file suffix
    transparent = is_transparent,    -- Disable setting background
    terminal_colors = true, -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
    dim_inactive = false,   -- Non focused panes set to alternative background
    styles = {
        comments = "italic",
        conditionals = "NONE",
        loops = "NONE",
        functions = "bold",
        keywords = "italic",
        strings = "NONE",
        variables = "NONE",
        numbers = "italic",
        booleans = "italic",
        properties = "NONE",
        types = "italic",
        operators = "NONE",
    },
    inverse = {             -- Inverse highlight for different types
      match_paren = false,
      visual = false,
      search = false,
    },
    modules = {             -- List of various plugins and additional options
      -- ...
    },
  },
  palettes = {},
  specs = {},
  groups = {},
})

-- setup must be called before loading
vim.cmd("colorscheme nordfox")

