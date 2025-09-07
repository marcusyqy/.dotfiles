local wezterm = require 'wezterm'

local module = {}

function module.apply_config(config)
    config.use_fancy_tab_bar = true
    config.enable_tab_bar = true
    config.hide_tab_bar_if_only_one_tab = false
    config.tab_bar_at_bottom = false
end

return module
