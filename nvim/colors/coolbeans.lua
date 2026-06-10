vim.cmd.highlight("clear")

if vim.fn.exists("syntax_on") == 1 then
  vim.cmd.syntax("reset")
end

vim.o.background = "dark"
vim.g.colors_name = "coolbeans"

local defaults = {
  transparent = false,
  terminal_colors = true,
  styles = {
    comments = { italic = true },
    functions = {},
    keywords = {},
    types = {},
    headings = { bold = true },
    matches = { underline = true },
  },
  palette = {
    bg = "#0f1418",
    bg_alt = "#141b20",
    bg_soft = "#1b2329",
    bg_high = "#263039",
    fg = "#d7d0bf",
    fg_dim = "#938b7a",
    comment = "#6f7b72",
    gutter = "#48545d",
    border = "#303b44",
    selection = "#253746",
    cursor = "#e6d2a2",
    yellow = "#d9b46f",
    orange = "#d28f5d",
    red = "#d37a70",
    magenta = "#c486b7",
    blue = "#7ca7c7",
    cyan = "#8fbfc0",
    green = "#95b47b",
    teal = "#72a89a",
  },
  highlights = {},
}

local opts = vim.tbl_deep_extend("force", defaults, vim.g.coolbeans or {})
local c = opts.palette

local function maybe_transparent(color)
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

hi("Normal", { fg = c.fg, bg = maybe_transparent(c.bg) })
hi("NormalNC", { fg = c.fg, bg = maybe_transparent(c.bg) })
hi("NormalFloat", { fg = c.fg, bg = maybe_transparent(c.bg_alt) })
hi("FloatBorder", { fg = c.border, bg = maybe_transparent(c.bg_alt) })
hi("FloatTitle", style("headings", { fg = c.yellow, bg = maybe_transparent(c.bg_alt) }))
hi("ColorColumn", { bg = maybe_transparent(c.bg_alt) })
hi("Conceal", { fg = c.fg_dim })
hi("Cursor", { fg = c.bg, bg = c.cursor })
hi("CursorColumn", { bg = maybe_transparent(c.bg_alt) })
hi("CursorLine", { bg = maybe_transparent(c.bg_alt) })
hi("Directory", { fg = c.blue })
hi("EndOfBuffer", { fg = c.bg })
hi("ErrorMsg", { fg = c.red, bold = true })
hi("FoldColumn", { fg = c.gutter, bg = maybe_transparent(c.bg) })
hi("Folded", { fg = c.fg_dim, bg = maybe_transparent(c.bg_alt) })
hi("LineNr", { fg = c.gutter })
hi("CursorLineNr", style("headings", { fg = c.yellow }))
hi("MatchParen", style("matches", { fg = c.yellow, bg = c.bg_high }))
hi("ModeMsg", style("headings", { fg = c.green }))
hi("MoreMsg", { fg = c.green })
hi("NonText", { fg = c.gutter })
hi("Pmenu", { fg = c.fg, bg = c.bg_soft })
hi("PmenuSel", { fg = c.bg, bg = c.yellow })
hi("PmenuSbar", { bg = c.bg_high })
hi("PmenuThumb", { bg = c.gutter })
hi("Question", { fg = c.green })
hi("QuickFixLine", style("headings", { bg = c.bg_high }))
hi("Search", { fg = c.bg, bg = c.yellow })
hi("IncSearch", { fg = c.bg, bg = c.orange })
hi("CurSearch", { fg = c.bg, bg = c.orange })
hi("SignColumn", { fg = c.gutter, bg = maybe_transparent(c.bg) })
hi("SpecialKey", { fg = c.gutter })
hi("SpellBad", { sp = c.red, undercurl = true })
hi("SpellCap", { sp = c.blue, undercurl = true })
hi("SpellLocal", { sp = c.cyan, undercurl = true })
hi("SpellRare", { sp = c.magenta, undercurl = true })
hi("StatusLine", { fg = c.fg, bg = c.bg_high })
hi("StatusLineNC", { fg = c.fg, bg = c.bg_high })
hi("TabLine", { fg = c.fg, bg = c.bg_alt })
hi("TabLineFill", { bg = maybe_transparent(c.bg) })
hi("TabLineSel", style("headings", { fg = c.fg, bg = c.bg_high }))
hi("Title", style("headings", { fg = c.yellow }))
hi("VertSplit", { fg = c.border })
hi("Visual", { bg = c.selection })
hi("WarningMsg", { fg = c.orange })
hi("Whitespace", { fg = c.gutter })
hi("WildMenu", { fg = c.bg, bg = c.cyan })
hi("WinSeparator", { fg = c.border })

hi("Comment", style("comments", { fg = c.comment }))
hi("Constant", { fg = c.orange })
hi("String", { fg = c.red })
hi("Character", { fg = c.red })
hi("Number", { fg = c.orange })
hi("Boolean", { fg = c.orange })
hi("Float", { fg = c.orange })
hi("Identifier", { fg = c.fg })
hi("Function", style("functions", { fg = c.cyan }))
hi("Statement", style("keywords", { fg = c.yellow }))
hi("Conditional", { fg = c.yellow })
hi("Repeat", { fg = c.yellow })
hi("Label", { fg = c.yellow })
hi("Operator", { fg = c.fg_dim })
hi("Keyword", style("keywords", { fg = c.yellow }))
hi("Exception", { fg = c.yellow })
hi("PreProc", { fg = c.magenta })
hi("Include", { fg = c.magenta })
hi("Define", { fg = c.magenta })
hi("Macro", { fg = c.magenta })
hi("PreCondit", { fg = c.magenta })
hi("Type", style("types", { fg = c.blue }))
hi("StorageClass", { fg = c.blue })
hi("Structure", { fg = c.blue })
hi("Typedef", { fg = c.blue })
hi("Special", { fg = c.teal })
hi("SpecialChar", { fg = c.teal })
hi("Tag", { fg = c.blue })
hi("Delimiter", { fg = c.fg_dim })
hi("SpecialComment", style("headings", { fg = c.comment }))
hi("Debug", { fg = c.red })
hi("Underlined", { fg = c.blue, underline = true })
hi("Ignore", { fg = c.gutter })
hi("Error", { fg = c.red })
hi("Todo", style("headings", { fg = c.bg, bg = c.yellow }))

hi("DiagnosticError", { fg = c.red })
hi("DiagnosticWarn", { fg = c.orange })
hi("DiagnosticInfo", { fg = c.blue })
hi("DiagnosticHint", { fg = c.teal })
hi("DiagnosticOk", { fg = c.green })
hi("DiagnosticVirtualTextError", { fg = c.red, bg = c.bg_alt })
hi("DiagnosticVirtualTextWarn", { fg = c.orange, bg = c.bg_alt })
hi("DiagnosticVirtualTextInfo", { fg = c.blue, bg = c.bg_alt })
hi("DiagnosticVirtualTextHint", { fg = c.teal, bg = c.bg_alt })
hi("DiagnosticUnderlineError", { sp = c.red, undercurl = true })
hi("DiagnosticUnderlineWarn", { sp = c.orange, undercurl = true })
hi("DiagnosticUnderlineInfo", { sp = c.blue, undercurl = true })
hi("DiagnosticUnderlineHint", { sp = c.teal, undercurl = true })
hi("DiagnosticSignError", { fg = c.red })
hi("DiagnosticSignWarn", { fg = c.orange })
hi("DiagnosticSignInfo", { fg = c.blue })
hi("DiagnosticSignHint", { fg = c.teal })

hi("DiffAdd", { fg = c.green, bg = "#18261c" })
hi("DiffChange", { fg = c.blue, bg = "#172431" })
hi("DiffDelete", { fg = c.red, bg = "#2a1919" })
hi("DiffText", { fg = c.yellow, bg = "#2b2a1b" })
hi("Added", { fg = c.green })
hi("Changed", { fg = c.blue })
hi("Removed", { fg = c.red })

hi("@comment", { link = "Comment" })
hi("@constant", { link = "Constant" })
hi("@constant.builtin", { fg = c.orange })
hi("@string", { link = "String" })
hi("@number", { link = "Number" })
hi("@boolean", { link = "Boolean" })
hi("@variable", { fg = c.fg })
hi("@variable.builtin", { fg = c.orange })
hi("@function", { link = "Function" })
hi("@function.builtin", { fg = c.cyan })
hi("@function.macro", { fg = c.magenta })
hi("@keyword", { link = "Keyword" })
hi("@keyword.return", { fg = c.yellow })
hi("@operator", { link = "Operator" })
hi("@type", { link = "Type" })
hi("@type.builtin", { fg = c.blue })
hi("@property", { fg = c.fg })
hi("@field", { fg = c.fg })
hi("@parameter", { fg = c.fg })
hi("@punctuation", { fg = c.fg_dim })
hi("@punctuation.bracket", { fg = c.fg_dim })
hi("@punctuation.delimiter", { fg = c.fg_dim })
hi("@constructor", { fg = c.blue })
hi("@module", { fg = c.blue })
hi("@namespace", { fg = c.blue })
hi("@label", { fg = c.yellow })
hi("@tag", { fg = c.blue })
hi("@tag.attribute", { fg = c.cyan })
hi("@tag.delimiter", { fg = c.fg_dim })

hi("GitSignsAdd", { fg = c.green })
hi("GitSignsChange", { fg = c.blue })
hi("GitSignsDelete", { fg = c.red })

hi("CmpItemAbbr", { fg = c.fg })
hi("CmpItemAbbrDeprecated", { fg = c.comment, strikethrough = true })
hi("CmpItemAbbrMatch", style("headings", { fg = c.yellow }))
hi("CmpItemAbbrMatchFuzzy", { fg = c.yellow })
hi("CmpItemKind", { fg = c.blue })
hi("CmpItemMenu", { fg = c.comment })

hi("SnacksPicker", { fg = c.fg, bg = c.bg_alt })
hi("SnacksPickerBorder", { fg = c.bg_alt, bg = c.bg_alt })
hi("SnacksPickerMatch", style("headings", { fg = c.yellow }))
hi("SnacksPickerPrompt", { fg = c.cyan })

-- hi("SnacksPicker", { fg = c.fg, bg = c.bg_alt })
-- hi("SnacksPickerBorder", { fg = c.border, bg = c.bg_alt })
-- hi("SnacksPickerMatch", style("headings", { fg = c.yellow }))
-- hi("SnacksPickerPrompt", { fg = c.cyan })

for group, highlight in pairs(opts.highlights) do
  hi(group, highlight)
end

if opts.terminal_colors then
  vim.g.terminal_color_0 = c.bg
  vim.g.terminal_color_1 = c.red
  vim.g.terminal_color_2 = c.green
  vim.g.terminal_color_3 = c.yellow
  vim.g.terminal_color_4 = c.blue
  vim.g.terminal_color_5 = c.magenta
  vim.g.terminal_color_6 = c.cyan
  vim.g.terminal_color_7 = c.fg
  vim.g.terminal_color_8 = c.gutter
  vim.g.terminal_color_9 = c.red
  vim.g.terminal_color_10 = c.green
  vim.g.terminal_color_11 = c.yellow
  vim.g.terminal_color_12 = c.blue
  vim.g.terminal_color_13 = c.magenta
  vim.g.terminal_color_14 = c.cyan
  vim.g.terminal_color_15 = "#f0e7d0"
end
