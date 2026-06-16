local previous = vim.g.fleury

vim.g.fleury = vim.tbl_deep_extend("force", {
  palette = {
    bg = "#020303",
    fg = "#d8c08f",
    bg_alt = "#0b0d0e",
    bg_soft = "#171b24",
    bg_high = "#252b37",
    border = "#747474",
    gutter = "#5c5c5c",
    comment = "#878787",
    selection = "#303848",
    cursor = "#36ff14",
    keyword = "#e0ad32",
    string = "#bddb64",
    constant = "#56c7bd",
    builtin = "#e06a6a",
    type = "#f1bf2e",
    func = "#56c7bd",
    member = "#df7258",
    variable_use = "#70d6cf",
    search = "#f2c53d",
    inc_search = "#f1763f",
    error = "#ff7676",
    green = "#32ff4c",
    aqua = "#70d6cf",
    tooltip_bg = "#101214",
    modeline_fg = "#f1bf2e",
    modeline_bg = "#242a35",
    modeline_border = "#3b3f47",
    black = "#000000",
  },
}, previous or {})

dofile(vim.api.nvim_get_runtime_file("colors/rad.lua", false)[1])

vim.g.fleury = previous
vim.g.colors_name = "rad-high-contrast"
