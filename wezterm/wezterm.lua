local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
    config = wezterm.config_builder()
end

-- config.color_scheme = 'Gruvbox light, medium (base16)'
-- config.color_scheme = 'Gruvbox dark, medium (base16)'
--
-- config.color_scheme = 'Rosé Pine (base16)'
-- config.color_scheme = 'Rosé Pine (Gogh)'
-- config.colors = {}
-- config.colors.background = '#1d1d1d'
-- config.colors.foreground = '#ffffff'
-- config.colors.background = '#1d2021'
-- config.colors.background = '#000000' -- for paramount

-- @TODO try this out on windows.
config.default_cursor_style = "BlinkingBlock"
config.cursor_blink_ease_in = "Constant"
config.cursor_blink_ease_out = "Constant"
config.cursor_blink_rate = 500

-- config.prefer_egl = true

-- gpus
-- for _, gpu in ipairs(wezterm.gui.enumerate_gpus()) do
--   if gpu.backend == 'Vulkan' and gpu.device_type == 'DiscreteGpu' then
--     config.webgpu_preferred_adapter = gpu
--     break
--   end
-- end

config.font_size = 11.0
config.harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' } -- no ligatures for me please!
-- config.font = wezterm.font_with_fallback {
--   -- "Comic Mono",
--   "Iosevka Nerd Font",
--   -- "ComicShannsMono Nerd Font Propo",
--   -- 'JetBrains Mono',
--   'nonicons',
-- }

config.freetype_load_target = "HorizontalLcd"

-- tab
config.use_fancy_tab_bar = true
config.enable_tab_bar = true
config.hide_tab_bar_if_only_one_tab = false
config.tab_bar_at_bottom = false

-- windows
config.window_decorations = "RESIZE | INTEGRATED_BUTTONS" -- "TITLE | RESIZE"
config.window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0
}

-- temporary settings that have no files to be in right now.
-- config.color_scheme = 'Solarized Dark Higher Contrast (Gogh)'
config.warn_about_missing_glyphs = false
config.window_close_confirmation = 'NeverPrompt'

-- require("tabbar").apply_config(config);
-- require("keys").apply_config(config) -- we use tmux for linux so we don't need this

config.enable_wayland = false
-- and finally, return the configuration to wezterm
return config
