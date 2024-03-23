local wezterm = require 'wezterm'

function scheme_for_appearance(appearance)
  if appearance:find 'Dark' then
    return 'Builtin Solarized Dark'
  else
    return 'Builtin Solarized Light'
  end
end

wezterm.on('window-config-reloaded', function(window, pane)
  local overrides = window:get_config_overrides() or {}
  local appearance = window:get_appearance()
  local scheme = scheme_for_appearance(appearance)
  if overrides.color_scheme ~= scheme then
    overrides.color_scheme = scheme
    window:set_config_overrides(overrides)
  end
end)

return {
  default_prog = tmux,
  enable_tab_bar = false,
  font = wezterm.font({
    family = 'Iosevka Nerd Font',
  }),
  font_size = 15,
  macos_window_background_blur = 70,
  window_background_opacity = 1,
  window_padding = {
    left = 10,
    right = 10,
    top = 10,
    bottom = 10
  },
  -- window_decorations = "RESIZE"
}
