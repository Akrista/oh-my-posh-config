local wezterm = require 'wezterm'
local config = {}


if string.match(wezterm.target_triple, "windows") then
  config.default_prog = { 'powershell', 'pwsh -NoLogo' }
end

config.color_scheme = "MonokaiProRistretto (Gogh)"
config.window_decorations = "RESIZE"
config.font = wezterm.font "MesloLGS NF"
config.enable_tab_bar = false
-- config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = true
-- config.window_frame = {
--   active_titlebar_bf = "#00FFFF",
--   inactive_titlebar_bf = "#00FFFF",
-- }
-- config.colors = {
--   tab_bar = {
--     background = '#FFFFFF',
--     active_tab = {
--       bg_color = '#000000',
--       fg_color = '#00FFFF',
--     }
--   }
-- }
config.window_padding = {
  bottom = "0.5%",
  top = "1%",
  left = "0.5%",
  right = "0%",
}
-- config.window_background_image = "C:/Users/jatlc/Pictures/Backgrounds/FkQzJ2OWAAA0RuQ.jpg"
-- config.window_background_opacity = 0.70
-- config.window_background_image_hsb = {
--   brightness = 0.1,
--   hue = 1.0,
--   saturation = 1.0,
-- }
config.font_size = 14

local background = {
  {
    source = {
      File = "C:/Users/jatlc/Pictures/Backgrounds/FkQzJ2OWAAA0RuQ.jpg",
    },
    hsb = {
      brightness = 0.05,
      hue = 2,
      saturation = 1,
    },
    opacity = 0.9,
    attachment = "Fixed",
  },
}

config.background = background

-- Key Bindings

local keys = {
  {
    key = 's',
    mods = 'ALT',
    action = wezterm.action.SplitPane {
      direction = 'Right',
      size = { Percent = 50 },
    },
  },
  {
    key = 's',
    mods = 'ALT|SHIFT',
    action = wezterm.action.SplitPane {
      direction = 'Down',
      size = { Percent = 50 },
    },
  },
  {
    key = 'x',
    mods = 'ALT',
    action = wezterm.action.CloseCurrentPane {
      confirm = false,
    },
  },
  {
    key = 'l',
    mods = 'ALT',
    action = wezterm.action.ActivatePaneDirection 'Next',
  },
  {
    key = 'l',
    mods = 'ALT|SHIFT',
    action = wezterm.action.ActivatePaneDirection 'Prev',
  },
}

config.keys = keys

-- Return configs

return config
