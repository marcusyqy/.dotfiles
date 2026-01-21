local wezterm = require 'wezterm'
local action = wezterm.action

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
    config = wezterm.config_builder()
end

-- config.color_scheme = 'iTerm2 Default'
config.color_scheme = 'Apple System Colors'
-- config.color_scheme = 'Builtin Dark'

config.colors = {}
-- config.colors.background = '#1d1d1d'
config.colors.background = '#000000' -- for paramount
config.colors.cursor_bg = '#52ad70'
config.colors.foreground = '#ffffff'
config.default_cursor_style = "BlinkingBlock"
config.cursor_blink_ease_in = "Constant"
config.cursor_blink_ease_out = "Constant"
config.cursor_blink_rate = 500
-- config.color_scheme = "Gruvbox (Gogh)"

-- config.prefer_egl = true

-- gpus
-- for _, gpu in ipairs(wezterm.gui.enumerate_gpus()) do
--   if gpu.backend == 'Vulkan' and gpu.device_type == 'DiscreteGpu' then
--     config.webgpu_preferred_adapter = gpu
--     break
--   end
-- end

config.font_size = 13.0
config.harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' } -- no ligatures for me please!
-- config.font = wezterm.font {
--     family = "Iosevka Nerd Font Mono", -- Or the font you prefer
--     -- family = "JetBrains Mono", -- Or the font you prefer
--     -- weight = "DemiBold", -- Optional: Adjust weight
--     harfbuzz_features = { "calt=0", "clig=0", "liga=0" }, -- Disable ligatures
-- }

config.freetype_load_target = "HorizontalLcd"

-- tab
config.use_fancy_tab_bar = true
config.enable_tab_bar = true
config.hide_tab_bar_if_only_one_tab = false
config.tab_bar_at_bottom = false

-- windows
config.window_decorations = "RESIZE | INTEGRATED_BUTTONS"
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

config.enable_wayland = false

-- Use the defaults as a base
config.hyperlink_rules = wezterm.default_hyperlink_rules()

-- makes things easier
if wezterm.target_triple == "x86_64-apple-darwin" or
   wezterm.target_triple == "aarch64-apple-darwin" then
   config.keys = {
     { mods = "OPT", key = "LeftArrow", action = action.SendKey({ mods = "ALT", key = "b" }) },
     { mods = "OPT", key = "RightArrow", action = action.SendKey({ mods = "ALT", key = "f" }) },
     { mods = "CMD", key = "LeftArrow", action = action.SendKey({ mods = "CTRL", key = "a" }) },
     { mods = "CMD", key = "RightArrow", action = action.SendKey({ mods = "CTRL", key = "e" }) },
     { mods = "CMD", key = "Backspace", action = action.SendKey({ mods = "CTRL", key = "u" }) },
     -- { key = '\\', mods = 'CTRL', action = wezterm.action.SendString('\x1c') }, -- Sending ASCII code for Ctrl+\
     -- { key = '`', mods = 'CTRL', action = wezterm.action.SendString('\x60') }, -- Sending ASCII code for Ctrl+`
   }
elseif wezterm.target_triple == "x86_64-unknown-linux-gnu" then
  config.keys = {
    { mods = "CTRL", key = "LeftArrow", action = action.SendKey({ mods = "ALT", key = "b" }) },
    { mods = "CTRL", key = "RightArrow", action = action.SendKey({ mods = "ALT", key = "f" }) },
    { mods = "CTRL", key = "\\", action = wezterm.action.Nop },
    { mods = "CTRL", key = "\'", action = wezterm.action.Nop },
  }
else
  config.keys = {
    { mods = "CTRL", key = "\\", action = wezterm.action.Nop },
    { mods = "CTRL", key = "\'", action = wezterm.action.Nop },
  }
end

-- for windows.
table.insert(config.keys, { mods="ALT", key = "1", action = action.ActivateTab(0) })
table.insert(config.keys, { mods="ALT", key = "2", action = action.ActivateTab(1) })
table.insert(config.keys, { mods="ALT", key = "3", action = action.ActivateTab(2) })
table.insert(config.keys, { mods="ALT", key = "4", action = action.ActivateTab(3) })
table.insert(config.keys, { mods="ALT", key = "5", action = action.ActivateTab(4) })
table.insert(config.keys, { mods="ALT", key = "6", action = action.ActivateTab(5) })
table.insert(config.keys, { mods="ALT", key = "7", action = action.ActivateTab(6) })
table.insert(config.keys, { mods="ALT", key = "8", action = action.ActivateTab(7) })
table.insert(config.keys, { mods="ALT", key = "9", action = action.ActivateTab(8) })
table.insert(config.keys, { mods="ALT", key = "0", action = action.ActivateTab(9) })
table.insert(config.keys, { mods="ALT", key = "w", action = action.CloseCurrentTab{confirm=true} })
table.insert(config.keys, { mods="ALT", key = "t", action = action.SpawnTab("CurrentPaneDomain") })


-- Notification when the configuration is reloaded
-- local function toast(window, message)
--  window:toast_notification('wezterm', message .. ' - ' .. os.date('%I:%M:%S %p'), nil, 1000)
-- end

-- wezterm.on('window-config-reloaded', function(window, pane)
--  toast(window, 'Configuration reloaded!')
-- end)

-- Make IP addresses with port clickable (e.g., 127.0.0.1:5053)
table.insert(config.hyperlink_rules, {
  regex = [[\b(\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}):(\d+)\b]],
  format = 'http://$1:$2',
})

-- Match local file paths ending in .html
table.insert(config.hyperlink_rules, {
 regex = [[\b(?:[a-zA-Z0-9_-]+(?:/[a-zA-Z0-9_-]+)*)+\.html\b]],
 format = 'file://$0',
})

config.window_close_confirmation = "AlwaysPrompt"

-- and finally, return the configuration to wezterm
return config
