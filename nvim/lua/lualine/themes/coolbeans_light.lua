-- Matching statusline for the Coolbeans light palette.
local c = {
  bg = "#f5f1e8",
  bg_alt = "#ece7dc",
  bg_soft = "#e5dfd2",
  bg_high = "#d8d0c1",
  fg = "#343b3b",
  comment = "#666f62",
  yellow = "#806018",
  orange = "#965329",
  red = "#a0473f",
  magenta = "#89527e",
  blue = "#386888",
  cyan = "#336e71",
  green = "#536e35",
}

c = vim.tbl_deep_extend("force", c, (vim.g.coolbeans_light or {}).palette or {})

local defaults = {
  bold = false
}
local opts = vim.tbl_deep_extend("force", defaults, vim.g.coolbeans_light_lualine or {})
local bold_string_opt = opts.bold and "bold" or ""

return {
  normal = {
    a = { fg = c.bg, bg = c.yellow, gui = bold_string_opt },
    b = { fg = c.yellow, bg = c.bg_high },
    c = { fg = c.fg, bg = c.bg_soft },
  },
  insert = {
    a = { fg = c.bg, bg = c.cyan, gui = bold_string_opt },
    b = { fg = c.cyan, bg = c.bg_high },
    c = { fg = c.fg, bg = c.bg_soft },
  },
  visual = {
    a = { fg = c.bg, bg = c.magenta, gui = bold_string_opt },
    b = { fg = c.magenta, bg = c.bg_high },
    c = { fg = c.fg, bg = c.bg_soft },
  },
  replace = {
    a = { fg = c.bg, bg = c.red, gui = bold_string_opt },
    b = { fg = c.red, bg = c.bg_high },
    c = { fg = c.fg, bg = c.bg_soft },
  },
  command = {
    a = { fg = c.bg, bg = c.orange, gui = bold_string_opt },
    b = { fg = c.orange, bg = c.bg_high },
    c = { fg = c.fg, bg = c.bg_soft },
  },
  terminal = {
    a = { fg = c.bg, bg = c.green, gui = bold_string_opt },
    b = { fg = c.green, bg = c.bg_high },
    c = { fg = c.fg, bg = c.bg_soft },
  },
  inactive = {
    a = { fg = c.fg, bg = c.bg_high },
    b = { fg = c.fg, bg = c.bg_high },
    c = { fg = c.fg, bg = c.bg_soft },
  },
}
