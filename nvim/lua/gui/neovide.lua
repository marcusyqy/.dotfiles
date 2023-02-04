if vim.g.neovide then
    -- Put anything you want to happen only in Neovide here
    vim.g.neovide_scale_factor = 1.0

    -- seems to be for mac
    -- Helper function for transparency formatting
    -- local alpha = function()
    --   return string.format("%x", math.floor(255 * vim.g.neovide_transparency_point or 0.8))
    -- end
    -- g:neovide_transparency should be 0 if you want to unify transparency of content and title bar.
    --
    -- vim.g.neovide_transparency = 0.0
    -- vim.g.transparency = 0.8
    -- vim.g.neovide_background_color = "#0f1117" .. alpha()
    --
    vim.g.neovide_floating_blur_amount_x = 2.0
    vim.g.neovide_floating_blur_amount_y = 2.0
    vim.g.neovide_transparency = 0.9
    vim.g.neovide_scroll_animation_length = 0.3
    vim.g.neovide_hide_mouse_when_typing = false
    vim.g.neovide_underline_automatic_scaling = false
    vim.g.neovide_refresh_rate = 144
    vim.g.neovide_refresh_rate_idle = 5
    vim.g.neovide_no_idle = true
    vim.g.neovide_confirm_quit = true
    vim.g.neovide_fullscreen = false
    vim.g.neovide_profiler = false
    vim.g.neovide_input_use_logo = true
    vim.g.neovide_touch_deadzone = 6.0
    vim.g.neovide_touch_drag_timeout = 0.17
    vim.g.neovide_cursor_animation_length = 0.03
    vim.g.neovide_cursor_trail_size = 0.8
    vim.g.neovide_cursor_antialiasing = true
    vim.g.neovide_cursor_vfx_mode = ""
end


local M = {}
M.exists = vim.g.neovide
return M

