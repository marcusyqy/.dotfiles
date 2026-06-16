local c = {
  bg = "#020303",
  bg_alt = "#0b0d0e",
  bg_soft = "#171b24",
  bg_high = "#252b37",
  fg = "#d8c08f",
  comment = "#878787",
  keyword = "#e0ad32",
  string = "#bddb64",
  type = "#f1bf2e",
  func = "#56c7bd",
  member = "#df7258",
  error = "#ff7676",
  modeline_fg = "#f1bf2e",
  modeline_bg = "#242a35",
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
