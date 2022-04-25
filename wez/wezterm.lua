-- this is comment:)
local wezterm = require 'wezterm';
return {
    default_prog = {"C:/Program Files/WindowsApps/Microsoft.PowerShell_7.2.2.0_x64__8wekyb3d8bbwe/pwsh.exe"},
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
    term = "wezterm",
    mouse_bindings = {
        -- Bind 'Up' event of CTRL-Click to open hyperlinks
        {
          event={Up={streak=1, button="Left"}},
          mods="CTRL",
          action="OpenLinkAtMouseCursor",
        },
        -- Disable the 'Down' event of CTRL-Click to avoid weird program behaviors
        {
          event={Down={streak=1, button="Left"}},
          mods="CTRL",
          action="Nop",
        },
        -- remove copy on select feature
        {
          event={Up={streak=1, button="Left"}},
          mods="NONE",
          action="Nop",
        },
  }
}