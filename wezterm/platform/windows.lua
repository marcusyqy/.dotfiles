
local wezterm = require 'wezterm'

local module = {}


function module.apply_config(config)
    -- For example, changing the color scheme:
    config.font = wezterm.font 'JetBrainsMono NF'
    config.font_size = 13.0

    -- config.color_scheme = 'Batman'
    config.default_prog = {
        "pwsh"
        -- 'C:\\Users\\Marcus\\AppData\\Local\\Microsoft\\WindowsApps\\Microsoft.PowerShell_8wekyb3d8bbwe\\pwsh.exe'
    }
end


return module;
