local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
    config = wezterm.config_builder()
end

-- windows
-- config.window_decorations = "NONE"
config.window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0
}

-- temporary settings that have no files to be in right now.
config.color_scheme = "GruvboxDarkHard"
config.warn_about_missing_glyphs = false
config.cursor_blink_ease_in = "Constant"
config.cursor_blink_ease_out = "Constant"

require("tabbar").apply_config(config);
require("keys").apply_config(config);

-- @TODO: Apply windows only settings only when detecting windows.
require("platform.windows").apply_config(config)

-- and finally, return the configuration to wezterm
return config
