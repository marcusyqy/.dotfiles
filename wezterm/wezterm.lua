local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
    config = wezterm.config_builder()
end

-- config.color_scheme = "Poimandres"
config.colors = {}
config.colors.background = '#111111'

config.font = wezterm.font_with_fallback {
  'JetBrains Mono',
  'nonicons',
}

config.freetype_load_target = "HorizontalLcd"
config.front_end = "OpenGL"
config.prefer_egl = true

-- windows
-- config.window_decorations = "NONE"
config.window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0
}

-- temporary settings that have no files to be in right now.
-- config.color_scheme = 'Solarized Dark Higher Contrast (Gogh)'
config.warn_about_missing_glyphs = false

require("tabbar").apply_config(config);

-- @TODO: Apply windows only settings only when detecting windows.
if wezterm.target_triple == 'x86_64-pc-windows-msvc' then
    require("platform.windows").apply_config(config)
    require("keys").apply_config(config) -- we use tmux for linux so we don't need this
end

-- and finally, return the configuration to wezterm
return config
