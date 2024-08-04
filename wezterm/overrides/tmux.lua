local wezterm = require 'wezterm'

local function get_leader()
    return { key =  "Space", mods = "CTRL" }
end

wezterm.on('toggle-leader-for-tmux', function(window, pane)
    wezterm.log_info("toggling the leader")
    local overrides = window:get_config_overrides() or {}
    if not overrides.leader then
        overrides.leader = get_leader()
    else
        overrides.leader = nil
    end
    window:set_config_overrides(overrides)
end
)

return {
    key = 'a',
    mods = 'LEADER',
    action = wezterm.action.EmitEvent 'toggle-leader-for-tmux',
}
