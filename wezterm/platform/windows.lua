
local wezterm = require 'wezterm'

local launch_menu = {}
local module = {}

local wezterm = require 'wezterm'

function module.apply_config(config)
    config.default_cwd = "C:\\Users\\Marcus"
    config.default_prog = { "cmd.exe"
        -- "cmd /k 'C:/Program Files/Microsoft Visual Studio/2022/Community/Common7/Tools/VsDevCmd.bat' -startdir=none -arch=x64 -host_arch=x64"
    }
end


return module;
