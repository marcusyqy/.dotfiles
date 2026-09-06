-- Keep only your personal input overrides here. Uncommented settings below
-- replace Omarchy's defaults.

-- Keyboard layout and options.
-- See https://wiki.hypr.land/Configuring/Basics/Variables/#input
local swap_state_file = io.open(os.getenv("HOME") .. "/.config/hypr/alt-super-swap.state", "r")
local swap_alt_super = swap_state_file and swap_state_file:read("*l") == "1"
if swap_state_file then swap_state_file:close() end

local kb_options = "ctrl:nocaps,compose:caps,shift:both_capslock_cancel,grp:alts_toggle"
if swap_alt_super then kb_options = kb_options .. ",altwin:swap_alt_win" end

hl.config({
  input = {
    -- Use multiple keyboard layouts and switch between them with Left Alt + Right Alt.
    kb_layout = "us",
    kb_options = kb_options,

    -- Use a specific keyboard variant if needed (e.g. intl for international keyboards).
    -- kb_variant = "intl",

    -- Change speed of keyboard repeat.
    repeat_rate = 40,
    repeat_delay = 250,

    -- Start with numlock on by default.
    numlock_by_default = true,

    -- Increase sensitivity for mouse/trackpad (default: 0).
    sensitivity = 0.2,
    scroll_factor = 1.0,

    -- Focus windows only when clicked, not when the pointer moves over them.
    follow_mouse = 0,

    -- Turn off mouse acceleration (default: adaptive).
    accel_profile = "flat",

    touchpad = {
      -- Use natural (inverse) scrolling.
      natural_scroll = true,

      -- Use two-finger clicks for right-click instead of lower-right corner.
      clickfinger_behavior = true,

      -- Control the speed of your scrolling.
      scroll_factor = 0.3,

      -- Enable the touchpad while typing.
      disable_while_typing = true,

      -- Left-click-and-drag with three fingers.
      drag_3fg = 1,
    },
  },
})

-- App-specific touchpad scroll speeds.
-- o.window("(Alacritty|kitty|foot)", { scroll_touchpad = 1.5 })
-- o.window("com.mitchellh.ghostty", { scroll_touchpad = 0.2 })

-- Enable touchpad gestures for changing workspaces.
-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Gestures/
-- hl.gesture({ fingers = 3, direction = "horizontal", action = "workspace" })

-- Enable touchpad gestures for moving focus (helpful on scrolling layout).
-- hl.gesture({ fingers = 3, direction = "left", action = function() hl.dispatch(hl.dsp.focus({ direction = "l" })) end })
-- hl.gesture({ fingers = 3, direction = "right", action = function() hl.dispatch(hl.dsp.focus({ direction = "r" })) end })
