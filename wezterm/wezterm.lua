local wezterm = require 'wezterm'
local action = wezterm.action

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
    config = wezterm.config_builder()
end

-- config.color_scheme = 'One Dark (Gogh)'

config.default_cursor_style = "BlinkingBlock"
config.cursor_blink_ease_in = "Constant"
config.cursor_blink_ease_out = "Constant"
config.cursor_blink_rate = 500

-- config.prefer_egl = true

config.front_end = "Software"
config.allow_win32_input_mode = false
-- gpus
-- for _, gpu in ipairs(wezterm.gui.enumerate_gpus()) do
--   if gpu.backend == 'Vulkan' and gpu.device_type == 'DiscreteGpu' then
--     config.webgpu_preferred_adapter = gpu
--     break
--   end
-- end

-- config.font_size = 10.0
config.harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' } -- no ligatures for me please!
config.font = wezterm.font {
    -- family = "Berkeley Mono SemiCondensed", -- Or the font you prefer
    -- family = "Comic Code", -- Or the font you prefer
    family = "JetBrains Mono", -- Or the font you prefer
    harfbuzz_features = { "calt=0", "clig=0", "liga=0" }, -- Disable ligatures
}

config.freetype_load_target = "HorizontalLcd"
-- config.freetype_load_target = "Normal"

-- tab
config.use_fancy_tab_bar = false
config.enable_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true
config.tab_bar_at_bottom = false
-- config.show_tab_index_in_tab_bar = false
config.tab_max_width = 32

config.color_scheme = 'coolbeans'
-- config.color_scheme = 'original_dark'
-- config.color_scheme = 'coolbeans_light'

-- config.colors = {
--   foreground = "#ffffff",
--   background = "#16181a",
--
--   cursor_bg = "#ffffff",
--   cursor_fg = "#16181a",
--   cursor_border = "#ffffff",
--
--   selection_fg = "#ffffff",
--   selection_bg = "#3c4048",
--
--   scrollbar_thumb = "#16181a",
--   split = "#16181a",
--
--   ansi = { "#16181a", "#ff6e5e", "#5eff6c", "#f1ff5e", "#5ea1ff", "#bd5eff", "#5ef1ff", "#ffffff" },
--   brights = { "#3c4048", "#ff6e5e", "#5eff6c", "#f1ff5e", "#5ea1ff", "#bd5eff", "#5ef1ff", "#ffffff" },
--   indexed = { [16] = "#ffbd5e", [17] = "#ff6e5e" },
-- }
--
--
-- wezterm.on('format-tab-title', function(tab, tabs, panes, cfg, hover, max_width)
--   local pane = tab.active_pane
--   local cwd_uri = pane.current_working_dir
--   local title = '~'
--
--   if cwd_uri and cwd_uri.file_path then
--     title = cwd_uri.file_path:match("([^/\\]+)[/\\]?$") or cwd_uri.file_path
--   end
--
--   return ' ' .. tab.tab_index + 1 .. ':' .. title .. ' '
-- end)

-- wezterm.on('update-right-status', function(window, pane)
--   local date = wezterm.strftime '%d/%m'
--   local time = wezterm.strftime '%H:%M'
--
--   -- Prefer shell integration hostname if present, otherwise local hostname.
--   local user_vars = pane:get_user_vars()
--   local host = user_vars.WEZTERM_HOST or wezterm.hostname()
--
--   window:set_right_status(wezterm.format({
--     { Foreground = { Color = c233 } },
--     { Background = { Color = c241 } },
--     { Attribute = { Intensity = 'Bold' } },
--     { Text = ' ' .. date .. ' ' },
--
--     { Foreground = { Color = c233 } },
--     { Background = { Color = c245 } },
--     { Attribute = { Intensity = 'Bold' } },
--     { Text = ' ' .. time .. ' ' },
--
--     { Foreground = { Color = c220 } },
--     { Background = { Color = c241 } },
--     { Attribute = { Intensity = 'Bold' } },
--     { Text = ' ' .. host .. ' ' },
--   }))
-- end)

-- windows
config.window_decorations = "RESIZE | TITLE" -- | INTEGRATED_BUTTONS"
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
    { mods = 'CMD|SHIFT', key = 'Enter', action = wezterm.action.ToggleFullScreen, },

    { mods="CMD|CTRL", key = "x", action = action.CloseCurrentPane{ confirm = false } },
    { mods="CMD|CTRL", key = "e", action = action.SplitPane({ direction = "Right", size = { Percent = 50 } }) },
    { mods="CMD|CTRL", key = "s", action = action.SplitPane({ direction = "Down", size = { Percent = 50 } }) },
    { mods="CMD|CTRL", key = "h", action = action.ActivatePaneDirection("Left") },
    { mods="CMD|CTRL", key = "j", action = action.ActivatePaneDirection("Down") },
    { mods="CMD|CTRL", key = "k", action = action.ActivatePaneDirection("Up") },
    { mods="CMD|CTRL", key = "l", action = action.ActivatePaneDirection("Right") }
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
table.insert(config.keys, { mods="ALT", key = "9", action = action.ActivateTab(-1) })
table.insert(config.keys, { mods="ALT", key = "0", action = action.ActivateLastTab })

table.insert(config.keys, { mods="ALT", key = "w", action = action.CloseCurrentTab{confirm=true} })
table.insert(config.keys, { mods="ALT", key = "t", action = action.SpawnTab("CurrentPaneDomain") })
table.insert(config.keys, { mods = '', key = 'F11', action = wezterm.action.ToggleFullScreen, })

table.insert(config.keys, { mods="ALT|CTRL", key = "x", action = action.CloseCurrentPane{ confirm = false } })
table.insert(config.keys, { mods="ALT", key = "x", action = action.CloseCurrentPane{ confirm = false } })

table.insert(config.keys, { mods="ALT|CTRL", key = "h", action = action.SplitPane({ direction = "Left", size = { Percent = 50 } }) })
table.insert(config.keys, { mods="ALT|CTRL", key = "j", action = action.SplitPane({ direction = "Down", size = { Percent = 50 } }) })
table.insert(config.keys, { mods="ALT|CTRL", key = "k", action = action.SplitPane({ direction = "Up", size = { Percent = 50 } }) })
table.insert(config.keys, { mods="ALT|CTRL", key = "l", action = action.SplitPane({ direction = "Right", size = { Percent = 50 } }) })
table.insert(config.keys, { mods="ALT", key = "h", action = action.ActivatePaneDirection("Left") })
table.insert(config.keys, { mods="ALT", key = "j", action = action.ActivatePaneDirection("Down") })
table.insert(config.keys, { mods="ALT", key = "k", action = action.ActivatePaneDirection("Up") })
table.insert(config.keys, { mods="ALT", key = "l", action = action.ActivatePaneDirection("Right") })

table.insert(config.keys, { mods="ALT", key = "n", action = action.ActivateTabRelative( 1) })
table.insert(config.keys, { mods="ALT", key = "p", action = action.ActivateTabRelative(-1) })
table.insert(config.keys, { mods="ALT", key = "`", action = action.ActivateLastTab })
table.insert(config.keys, { mods="ALT", key = "o", action = action.ActivateLastTab })
table.insert(config.keys, { mods="ALT|CTRL", key = "r", action = action.RotatePanes "Clockwise" })
table.insert(config.keys, { mods="ALT", key = "\\", action = action.ActivateCommandPalette })

-- table.insert(config.keys, { mods="ALT|CTRL", key = "LeftArrow", action = action.SplitPane({ direction = "Left", size = { Percent = 50 } }) })
-- table.insert(config.keys, { mods="ALT|CTRL", key = "DownArrow", action = action.SplitPane({ direction = "Down", size = { Percent = 50 } }) })
-- table.insert(config.keys, { mods="ALT|CTRL", key = "UpArrow", action = action.SplitPane({ direction = "Up", size = { Percent = 50 } }) })
-- table.insert(config.keys, { mods="ALT|CTRL", key = "RightArrow", action = action.SplitPane({ direction = "Right", size = { Percent = 50 } }) })
table.insert(config.keys, { mods="ALT", key = "LeftArrow", action = action.ActivatePaneDirection("Left") })
table.insert(config.keys, { mods="ALT", key = "DownArrow", action = action.ActivatePaneDirection("Down") })
table.insert(config.keys, { mods="ALT", key = "UpArrow", action = action.ActivatePaneDirection("Up") })
table.insert(config.keys, { mods="ALT", key = "RightArrow", action = action.ActivatePaneDirection("Right") })

table.insert(config.keys, { mods="ALT", key = "r", action = action.SendKey({ key = "F8" }) })
table.insert(config.keys, { mods="ALT", key = "a", action = action.SendKey({ key = "Home" }) })
table.insert(config.keys, { mods="ALT", key = "e", action = action.SendKey({ key = "End" }) })


-- Notification when the configuration is reloaded
-- local function toast(window, message)
--  window:toast_notification('wezterm', message .. ' - ' .. os.date('%I:%M:%S %p'), nil, 1000)
-- end

-- wezterm.on('window-config-reloaded', function(window, pane)
--  toast(window, 'Configuration reloaded!')
-- end)

-- Make IP addresses with port clickable (e.g., 127.0.0.1:5053)
-- table.insert(config.hyperlink_rules, {
--   regex = [[\b(\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}):(\d+)\b]],
--   format = 'http://$1:$2',
-- })

-- Match local file paths ending in .html
-- table.insert(config.hyperlink_rules, {
--  regex = [[\b(?:[a-zA-Z0-9_-]+(?:/[a-zA-Z0-9_-]+)*)+\.html\b]],
--  format = 'file://$0',
-- })


config.mouse_bindings = {
  -- Ctrl-click will open the link under the mouse cursor
  {
    event = { Up = { streak = 1, button = 'Left' } },
    mods = 'CTRL',
    action = wezterm.action.OpenLinkAtMouseCursor,
  },
}

config.window_close_confirmation = "AlwaysPrompt"
config.audible_bell = "Disabled"

-- and finally, return the configuration to wezterm
return config
