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
config.color_scheme = 'Rosé Pine (base16)'
-- config.color_scheme = 'Rosé Pine (Gogh)'
-- config.colors = {}
-- config.colors.background = '#111111'
-- config.colors.background = '#14161b'
-- config.colors.background = '#000000' -- for paramount

-- @TODO try this out on windows.
config.default_cursor_style = "BlinkingBlock"
config.cursor_blink_ease_in = "Constant"
config.cursor_blink_ease_out = "Constant"
config.cursor_blink_rate = 500

-- gpus
for _, gpu in ipairs(wezterm.gui.enumerate_gpus()) do
  if gpu.backend == 'Vulkan' and gpu.device_type == 'DiscreteGpu' then
    config.webgpu_preferred_adapter = gpu
    break
  end
end

config.font = wezterm.font_with_fallback {
  'JetBrains Mono',
  'nonicons',
}

config.freetype_load_target = "HorizontalLcd"

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
end

-- require("keys").apply_config(config) -- we use tmux for linux so we don't need this

-- and finally, return the configuration to wezterm
return config
