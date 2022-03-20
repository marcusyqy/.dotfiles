-- this is comment:)
local wezterm = require 'wezterm';
return {
  font_size = 16,
  line_height = 1.0,
  font_shaper = "Harfbuzz",  -- "Allsorts"
  font_rasterizer = "FreeType",
  font_antialias = "Greyscale",  -- None, Grayscale, Subpixel
  font_hinting = "Full",  -- None, Vertical, VerticalSubpixel, Full
  font = wezterm.font("JetBrains Mono"),
  color_scheme = "Gruvbox Dark",
  default_cursor_style = "SteadyBlock", -- SteadyBar, BlinkingBlock,
  		      -- BlinkingBar, SteadyUnderline, BlinkingUnderline
  scrollback_lines = 12000,
  selection_word_boundary = " \t\n[]\"'`(),.;:",  -- Default: " \t\n{}[]()\"'`"
  term = "wezterm"
}
