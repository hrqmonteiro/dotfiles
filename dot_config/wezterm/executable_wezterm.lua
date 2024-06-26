local wezterm = require 'wezterm'

-- function scheme_for_appearance(appearance)
--   if appearance:find 'Dark' then
--     return 'Catppuccin Macchiato'
--   else
--     return 'Catppuccin Latte'
--   end
-- end

-- wezterm.on('window-config-reloaded', function(window, pane)
--   local overrides = window:get_config_overrides() or {}
--   local appearance = window:get_appearance()
--   local scheme = scheme_for_appearance(appearance)
--   if overrides.color_scheme ~= scheme then
--     overrides.color_scheme = scheme
--     window:set_config_overrides(overrides)
--   end
-- end)


return {
  color_scheme = "Catppuccin Mocha",
  default_prog = tmux,
  enable_tab_bar = false,
  font = wezterm.font({
    family = "Liga LXGWWenKaiMono Nerd Font",
    weight = "DemiBold"
  }),
  font_size = 21,
  -- macos_window_background_blur = 70,
  -- window_background_opacity = 0.85,
  window_padding = {
    left = 2,
    right = 2,
    top = 2,
    bottom = 2
  },
  window_decorations = "RESIZE"
}
