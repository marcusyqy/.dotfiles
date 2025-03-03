local wezterm = require 'wezterm'

local module = {}

function module.apply_config(config)
    config.use_fancy_tab_bar = false
    config.enable_tab_bar = true
    config.hide_tab_bar_if_only_one_tab = true
    config.tab_bar_at_bottom = true
end

return module
