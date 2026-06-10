local c = {
  bg = "#050606",
  bg_alt = "#0b0c0d",
  bg_soft = "#171821",
  bg_high = "#20212a",
  fg = "#8f7c5c",
  fg_dim = "#5f5545",
  border = "#4b4b4b",
  comment = "#545454",
  cursor = "#18e000",
  keyword = "#aa8428",
  string = "#7d9740",
  type = "#b08a21",
  func = "#35736d",
  member = "#9d4d3b",
  error = "#b84b4b",
  modeline_fg = "#9d7a2d",
  modeline_bg = "#1d1e27",
}

return {
  normal = {
    a = { fg = c.bg, bg = c.modeline_fg, gui = "bold" },
    b = { fg = c.modeline_fg, bg = c.modeline_bg },
    c = { fg = c.fg, bg = c.bg_soft },
  },
  insert = {
    a = { fg = c.bg, bg = c.func, gui = "bold" },
    b = { fg = c.func, bg = c.modeline_bg },
    c = { fg = c.fg, bg = c.bg_soft },
  },
  visual = {
    a = { fg = c.bg, bg = c.member, gui = "bold" },
    b = { fg = c.member, bg = c.modeline_bg },
    c = { fg = c.fg, bg = c.bg_soft },
  },
  replace = {
    a = { fg = c.bg, bg = c.error, gui = "bold" },
    b = { fg = c.error, bg = c.modeline_bg },
    c = { fg = c.fg, bg = c.bg_soft },
  },
  command = {
    a = { fg = c.bg, bg = c.type, gui = "bold" },
    b = { fg = c.type, bg = c.modeline_bg },
    c = { fg = c.fg, bg = c.bg_soft },
  },
  terminal = {
    a = { fg = c.bg, bg = c.string, gui = "bold" },
    b = { fg = c.string, bg = c.modeline_bg },
    c = { fg = c.fg, bg = c.bg_soft },
  },
  inactive = {
    a = { fg = c.comment, bg = c.bg_alt },
    b = { fg = c.comment, bg = c.bg_alt },
    c = { fg = c.comment, bg = c.bg_alt },
  },
}
