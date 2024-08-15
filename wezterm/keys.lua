local wezterm = require("wezterm")

local module = {}

local function get_leader()
    return { key = "Space", mods = "CTRL" }
end

function module.apply_config(config)
    config.leader = get_leader()
    config.disable_default_key_bindings = true
    local copy_mode = wezterm.gui.default_key_tables().copy_mode
    table.insert(copy_mode, { key = '/', mods = 'NONE', action = wezterm.action.Search{CaseSensitiveString=""}})
    config.key_tables = {
        copy_mode = copy_mode,
    }

    config.keys = {
         require("overrides.tmux"),
        -- { key = "a",  mods = "LEADER|CTRL",  action = wezterm.action { SendString = "\x01" } },
        { key = "c",  mods = "CTRL|SHIFT",   action = wezterm.action { CopyTo = "Clipboard" } },
        { key = "v",  mods = "CTRL|SHIFT",   action = wezterm.action { PasteFrom = "Clipboard" } },
        { key = "-",  mods = "CTRL",         action = wezterm.action.DecreaseFontSize },
        { key = "=",  mods = "CTRL",         action = wezterm.action.IncreaseFontSize },
        { key = "0",  mods = "CTRL",         action = wezterm.action.ResetFontSize },
        { key = "-",  mods = "LEADER",       action = wezterm.action { SplitVertical = { domain = "CurrentPaneDomain" } } },
        { key = "=", mods = "LEADER",       action = wezterm.action { SplitHorizontal = { domain = "CurrentPaneDomain" } } },
        { key = "'",  mods = "LEADER",       action = wezterm.action { SplitVertical = { domain = "CurrentPaneDomain" } } },
        { key = "\\", mods = "LEADER",       action = wezterm.action { SplitHorizontal = { domain = "CurrentPaneDomain" } } },
        { key = "[",  mods = "LEADER",       action = wezterm.action.ActivateCopyMode },
        { key = "c",  mods = "LEADER",       action = wezterm.action { SpawnTab = "CurrentPaneDomain" } },
        { key = "h",  mods = "LEADER",       action = wezterm.action { ActivatePaneDirection = "Left" } },
        { key = "j",  mods = "LEADER",       action = wezterm.action { ActivatePaneDirection = "Down" } },
        { key = "k",  mods = "LEADER",       action = wezterm.action { ActivatePaneDirection = "Up" } },
        { key = "l",  mods = "LEADER",       action = wezterm.action { ActivatePaneDirection = "Right" } },
        { key = "1",  mods = "LEADER",       action = wezterm.action { ActivateTab = 0 } },
        { key = "2",  mods = "LEADER",       action = wezterm.action { ActivateTab = 1 } },
        { key = "3",  mods = "LEADER",       action = wezterm.action { ActivateTab = 2 } },
        { key = "4",  mods = "LEADER",       action = wezterm.action { ActivateTab = 3 } },
        { key = "5",  mods = "LEADER",       action = wezterm.action { ActivateTab = 4 } },
        { key = "6",  mods = "LEADER",       action = wezterm.action { ActivateTab = 5 } },
        { key = "7",  mods = "LEADER",       action = wezterm.action { ActivateTab = 6 } },
        { key = "8",  mods = "LEADER",       action = wezterm.action { ActivateTab = 7 } },
        { key = "9",  mods = "LEADER",       action = wezterm.action { ActivateTab = 8 } },
        { key = "0",  mods = "LEADER",       action = wezterm.action { ActivateTab = 9 } },
        { key = "x",  mods = "LEADER",       action = wezterm.action { CloseCurrentPane = { confirm = true } } },
        { key = "n",  mods = "LEADER",       action = wezterm.action { ActivateTabRelative = 1 } },
        { key = "p",  mods = "LEADER",       action = wezterm.action { ActivateTabRelative = -1 } },
        { key = "r",  mods = "LEADER",       action = wezterm.action.ReloadConfiguration },
        { key = "`",  mods = "LEADER",       action = wezterm.action.ActivateLastTab },
        { key = "t",  mods = "LEADER",       action = wezterm.action.ActivateLastTab },
        { key = "z",  mods = "LEADER",       action = wezterm.action.TogglePaneZoomState },
        { key = "/",  mods = "LEADER",       action = wezterm.action.Search{CaseSensitiveString=""} },
        { key = "s",  mods = "LEADER",       action = wezterm.action.ShowTabNavigator },
        { key = "F",  mods = "LEADER|SHIFT",       action = wezterm.action.ToggleFullScreen}, -- maybe a little gimmicky
        { key = ":",  mods = "LEADER|SHIFT",       action = wezterm.action.ActivateCommandPalette },
        { key = "\"",  mods = "LEADER|SHIFT",       action = wezterm.action { SplitVertical = { domain = "CurrentPaneDomain" } } },
        { key = "%",  mods = "LEADER|SHIFT",       action = wezterm.action { SplitHorizontal = { domain = "CurrentPaneDomain" } } },
        { key = "H",  mods = "LEADER|SHIFT", action = wezterm.action { AdjustPaneSize = { "Left", 5 } } },
        { key = "J",  mods = "LEADER|SHIFT", action = wezterm.action { AdjustPaneSize = { "Down", 5 } } },
        { key = "K",  mods = "LEADER|SHIFT", action = wezterm.action { AdjustPaneSize = { "Up", 5 } } },
        { key = "L",  mods = "LEADER|SHIFT", action = wezterm.action { AdjustPaneSize = { "Right", 5 } } },
    }
end

return module
