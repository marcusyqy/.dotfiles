vim.cmd.highlight("clear")

if vim.fn.exists("syntax_on") == 1 then
  vim.cmd.syntax("reset")
end

vim.o.background = "dark"
vim.g.colors_name = "rad"

local defaults = {
  transparent = false,
  terminal_colors = true,
  styles = {
    comments = {},
    keywords = {},
    functions = {},
    types = {},
    headings = { bold = true },
    matches = {},
  },
  palette = {
    bg = "#050606",
    fg = "#8f7c5c",
    bg_alt = "#0b0c0d",
    bg_soft = "#171821",
    bg_high = "#20212a",
    border = "#4b4b4b",
    gutter = "#323232",
    comment = "#545454",
    selection = "#1f222c",
    cursor = "#18e000",
    keyword = "#aa8428",
    string = "#7d9740",
    -- constant = "#9f812d",
    constant = "#35736d",
    builtin = "#9f3f3f",
    type = "#b08a21",
    func = "#35736d",
    member = "#9d4d3b",
    variable_use = "#3f7b76",
    search = "#b99120",
    inc_search = "#b34826",
    error = "#b84b4b",
    green = "#00c51a",
    aqua = "#3f7b76",
    tooltip_bg = "#151515",
    modeline_fg = "#9d7a2d",
    modeline_bg = "#1d1e27",
    modeline_border = "#161616",
    black = "#000000",
  },
  highlights = {},
}

local opts = vim.tbl_deep_extend("force", defaults, vim.g.fleury or {})
local c = opts.palette

local function bg(color)
  if opts.transparent then
    return "NONE"
  end
  return color
end

local function style(name, extra)
  return vim.tbl_deep_extend("force", opts.styles[name] or {}, extra or {})
end

local function hi(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

hi("Normal", { fg = c.fg, bg = bg(c.bg) })
hi("NormalNC", { fg = c.fg, bg = bg(c.bg) })
hi("NormalFloat", { fg = c.fg, bg = bg(c.tooltip_bg) })
hi("FloatBorder", { fg = c.border, bg = bg(c.tooltip_bg) })
hi("FloatTitle", style("headings", { fg = c.keyword, bg = bg(c.tooltip_bg) }))
hi("ColorColumn", { bg = bg(c.bg_alt) })
hi("Conceal", { fg = c.comment })
hi("Cursor", { fg = c.black, bg = c.cursor })
hi("CursorColumn", { bg = bg(c.bg_soft) })
hi("CursorLine", { bg = bg(c.bg_soft) })
hi("Directory", { fg = c.variable_use })
hi("EndOfBuffer", { fg = c.bg })
hi("ErrorMsg", style("headings", { fg = c.error }))
hi("FoldColumn", { fg = c.gutter, bg = bg(c.bg) })
hi("Folded", { fg = c.fg, bg = bg(c.border) })
hi("LineNr", { fg = c.gutter, bg = bg(c.bg) })
hi("CursorLineNr", { fg = c.fg, bg = bg(c.bg_soft) })
hi("MatchParen", style("matches", { fg = c.cursor, bg = c.selection }))
hi("ModeMsg", style("headings", { fg = c.modeline_fg }))
hi("MoreMsg", { fg = c.green })
hi("NonText", { fg = c.gutter })
hi("Pmenu", { fg = c.fg, bg = bg(c.bg_high) })
hi("PmenuSel", { fg = c.black, bg = c.search })
hi("PmenuSbar", { bg = bg(c.border) })
hi("PmenuThumb", { bg = c.comment })
hi("Question", style("headings", { fg = c.keyword }))
hi("QuickFixLine", { bg = c.selection })
hi("Search", { fg = c.black, bg = c.search })
hi("IncSearch", { fg = c.black, bg = c.inc_search })
hi("CurSearch", { fg = c.black, bg = c.inc_search })
hi("SignColumn", { fg = c.gutter, bg = bg(c.bg) })
hi("SpecialKey", { fg = c.gutter })
hi("SpellBad", { sp = c.error, undercurl = true })
hi("SpellCap", { sp = c.variable_use, undercurl = true })
hi("SpellLocal", { sp = c.aqua, undercurl = true })
hi("SpellRare", { sp = c.builtin, undercurl = true })
hi("StatusLine", { fg = c.modeline_fg, bg = c.modeline_bg })
hi("StatusLineNC", { fg = c.modeline_fg, bg = bg(c.bg) })
hi("TabLine", { fg = c.modeline_fg, bg = bg(c.bg) })
hi("TabLineFill", { bg = bg(c.bg) })
hi("TabLineSel", { fg = c.modeline_fg, bg = c.modeline_bg })
hi("Title", style("headings", { fg = c.keyword }))
hi("VertSplit", { fg = c.border })
hi("Visual", { bg = c.selection })
hi("WarningMsg", style("headings", { fg = c.tooltip_bg }))
hi("Whitespace", { fg = c.gutter })
hi("WildMenu", { fg = c.black, bg = c.search })
hi("WinSeparator", { fg = c.border })

hi("Comment", style("comments", { fg = c.comment }))
hi("Constant", { fg = c.constant })
hi("String", { fg = c.string })
hi("Character", { fg = c.string })
hi("Number", { fg = c.string })
-- hi("Number", { fg = c.constant })
hi("Boolean", { fg = c.constant })
-- hi("Float", { fg = c.constant })
hi("Float", { fg = c.string })
hi("Identifier", { fg = c.fg })
hi("Function", style("functions", { fg = c.func }))
hi("Statement", style("keywords", { fg = c.keyword }))
hi("Conditional", style("keywords", { fg = c.keyword }))
hi("Repeat", style("keywords", { fg = c.keyword }))
hi("Label", style("keywords", { fg = c.keyword }))
hi("Operator", { fg = c.fg })
hi("Keyword", style("keywords", { fg = c.keyword }))
hi("Exception", style("keywords", { fg = c.keyword }))
hi("PreProc", { fg = c.green })
hi("Include", { fg = c.green })
hi("Define", { fg = c.green })
hi("Macro", { fg = c.green })
-- hi("Macro", style("functions", { fg = c.func }))
hi("PreCondit", { fg = c.green })
hi("Type", style("types", { fg = c.type }))
hi("StorageClass", style("types", { fg = c.type }))
hi("Structure", style("types", { fg = c.type }))
hi("Typedef", style("types", { fg = c.type }))
hi("Special", { fg = c.member })
hi("SpecialChar", { fg = c.member })
hi("Tag", { fg = c.type })
hi("Delimiter", { fg = c.fg })
hi("SpecialComment", { fg = c.green })
hi("Debug", { fg = c.error })
hi("Underlined", { fg = c.variable_use, underline = true })
hi("Ignore", { fg = c.gutter })
hi("Error", style("headings", { fg = c.error }))
hi("Todo", style("headings", { fg = c.black, bg = c.search }))

hi("DiagnosticError", { fg = c.error })
hi("DiagnosticWarn", { fg = c.tooltip_bg })
hi("DiagnosticInfo", { fg = c.variable_use })
hi("DiagnosticHint", { fg = c.aqua })
hi("DiagnosticOk", { fg = c.green })
hi("DiagnosticVirtualTextError", { fg = c.error, bg = bg(c.bg_alt) })
hi("DiagnosticVirtualTextWarn", { fg = c.tooltip_bg, bg = bg(c.bg_alt) })
hi("DiagnosticVirtualTextInfo", { fg = c.variable_use, bg = bg(c.bg_alt) })
hi("DiagnosticVirtualTextHint", { fg = c.aqua, bg = bg(c.bg_alt) })
hi("DiagnosticUnderlineError", { sp = c.error, undercurl = true })
hi("DiagnosticUnderlineWarn", { sp = c.tooltip_bg, undercurl = true })
hi("DiagnosticUnderlineInfo", { sp = c.variable_use, undercurl = true })
hi("DiagnosticUnderlineHint", { sp = c.aqua, undercurl = true })
hi("DiagnosticSignError", { fg = c.error })
hi("DiagnosticSignWarn", { fg = c.tooltip_bg })
hi("DiagnosticSignInfo", { fg = c.variable_use })
hi("DiagnosticSignHint", { fg = c.aqua })

hi("DiffAdd", { fg = c.green, bg = "#061806" })
hi("DiffChange", { fg = c.variable_use, bg = "#101820" })
hi("DiffDelete", { fg = c.error, bg = "#1f0505" })
hi("DiffText", { fg = c.search, bg = "#2a2110" })
hi("Added", { fg = c.green })
hi("Changed", { fg = c.variable_use })
hi("Removed", { fg = c.error })

hi("@comment", { link = "Comment" })
hi("@constant", { link = "Constant" })
hi("@constant.builtin", { fg = c.constant })
hi("@string", { link = "String" })
hi("@number", { link = "Number" })
hi("@boolean", { link = "Boolean" })
hi("@variable", { fg = c.fg })
hi("@variable.builtin", { fg = c.member })
hi("@variable.member", { fg = c.variable_use })
hi("@function", { link = "Function" })
hi("@function.builtin", { fg = c.func })
hi("@function.macro", { fg = c.func })
hi("@keyword", { link = "Keyword" })
hi("@keyword.return", { fg = c.keyword })
hi("@operator", { link = "Operator" })
hi("@type", { link = "Type" })
hi("@type.builtin", { fg = c.type })
hi("@property", { fg = c.member })
hi("@field", { fg = c.member })
hi("@parameter", { fg = c.fg })
hi("@punctuation", { fg = c.fg })
hi("@punctuation.bracket", { fg = c.fg })
hi("@punctuation.delimiter", { fg = c.fg })
hi("@constructor", { fg = c.type })
hi("@module", { fg = c.type })
hi("@namespace", { fg = c.type })
hi("@label", { fg = c.keyword })
hi("@tag", { fg = c.type })
hi("@tag.attribute", { fg = c.variable_use })
hi("@tag.delimiter", { fg = c.fg })

hi("GitSignsAdd", { fg = c.green })
hi("GitSignsChange", { fg = c.variable_use })
hi("GitSignsDelete", { fg = c.error })

hi("CmpItemAbbr", { fg = c.fg })
hi("CmpItemAbbrDeprecated", { fg = c.comment, strikethrough = true })
hi("CmpItemAbbrMatch", style("headings", { fg = c.search }))
hi("CmpItemAbbrMatchFuzzy", { fg = c.search })
hi("CmpItemKind", { fg = c.type })
hi("CmpItemMenu", { fg = c.comment })

hi("SnacksPicker", { fg = c.fg, bg = bg(c.bg) })
hi("SnacksPickerBorder", { fg = bg(c.bg), bg = bg(c.bg) })
-- hi("SnacksPickerBorder", { fg = c.border, bg = bg(c.bg) })
hi("SnacksPickerMatch", style("headings", { fg = c.search }))
hi("SnacksPickerPrompt", style("headings", { fg = c.keyword }))

for group, highlight in pairs(opts.highlights) do
  hi(group, highlight)
end

if opts.terminal_colors then
  vim.g.terminal_color_0 = c.bg
  vim.g.terminal_color_1 = c.error
  vim.g.terminal_color_2 = c.green
  vim.g.terminal_color_3 = c.keyword
  vim.g.terminal_color_4 = c.variable_use
  vim.g.terminal_color_5 = c.builtin
  vim.g.terminal_color_6 = c.aqua
  vim.g.terminal_color_7 = c.fg
  vim.g.terminal_color_8 = c.gutter
  vim.g.terminal_color_9 = c.inc_search
  vim.g.terminal_color_10 = c.green
  vim.g.terminal_color_11 = c.search
  vim.g.terminal_color_12 = c.variable_use
  vim.g.terminal_color_13 = c.builtin
  vim.g.terminal_color_14 = c.aqua
  vim.g.terminal_color_15 = c.keyword
end
