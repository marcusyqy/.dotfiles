local c = {
  bg = "#0f1418",
  bg_alt = "#141b20",
  bg_soft = "#1b2329",
  bg_high = "#263039",
  fg = "#d7d0bf",
  comment = "#6f7b72",
  yellow = "#d9b46f",
  orange = "#d28f5d",
  red = "#d37a70",
  magenta = "#c486b7",
  blue = "#7ca7c7",
  cyan = "#8fbfc0",
  green = "#95b47b",
}

return {
  normal = {
    a = { fg = c.bg, bg = c.yellow, gui = "bold" },
    b = { fg = c.yellow, bg = c.bg_high },
    c = { fg = c.fg, bg = c.bg_soft },
  },
  insert = {
    a = { fg = c.bg, bg = c.cyan, gui = "bold" },
    b = { fg = c.cyan, bg = c.bg_high },
    c = { fg = c.fg, bg = c.bg_soft },
  },
  visual = {
    a = { fg = c.bg, bg = c.magenta, gui = "bold" },
    b = { fg = c.magenta, bg = c.bg_high },
    c = { fg = c.fg, bg = c.bg_soft },
  },
  replace = {
    a = { fg = c.bg, bg = c.red, gui = "bold" },
    b = { fg = c.red, bg = c.bg_high },
    c = { fg = c.fg, bg = c.bg_soft },
  },
  command = {
    a = { fg = c.bg, bg = c.orange, gui = "bold" },
    b = { fg = c.orange, bg = c.bg_high },
    c = { fg = c.fg, bg = c.bg_soft },
  },
  terminal = {
    a = { fg = c.bg, bg = c.green, gui = "bold" },
    b = { fg = c.green, bg = c.bg_high },
    c = { fg = c.fg, bg = c.bg_soft },
  },
  inactive = {
    a = { fg = c.fg, bg = c.bg_high },
    b = { fg = c.fg, bg = c.bg_high },
    c = { fg = c.fg, bg = c.bg_soft },
  },
}
