local previous = vim.g.fleury

vim.g.fleury = vim.tbl_deep_extend("force", {
  palette = {
    bg = "#050606",
    fg = "#a58f6a",
    bg_alt = "#0b0c0d",
    bg_soft = "#191a24",
    bg_high = "#23242e",
    border = "#565656",
    gutter = "#3b3b3b",
    comment = "#626262",
    selection = "#242833",
    cursor = "#20f000",
    keyword = "#ad8528",
    string = "#8da948",
    constant = "#3f8982",
    builtin = "#b54a4a",
    type = "#c09827",
    func = "#3f8982",
    member = "#b35944",
    variable_use = "#498f89",
    search = "#c9a126",
    inc_search = "#c6532c",
    error = "#cc5858",
    green = "#08d923",
    aqua = "#498f89",
    tooltip_bg = "#171717",
    modeline_fg = "#ad862f",
    modeline_bg = "#20212b",
    modeline_border = "#1a1a1a",
    black = "#000000",
  },
}, previous or {})

dofile(vim.api.nvim_get_runtime_file("colors/rad.lua", false)[1])

vim.g.fleury = previous
vim.g.colors_name = "rad-high-contrast"
