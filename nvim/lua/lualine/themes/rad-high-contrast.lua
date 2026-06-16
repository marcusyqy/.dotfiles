local c = {
  bg = "#050606",
  bg_alt = "#0b0c0d",
  bg_soft = "#191a24",
  bg_high = "#23242e",
  fg = "#a58f6a",
  comment = "#626262",
  keyword = "#ad8528",
  string = "#8da948",
  type = "#c09827",
  func = "#3f8982",
  member = "#b35944",
  error = "#cc5858",
  modeline_fg = "#ad862f",
  modeline_bg = "#20212b",
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
