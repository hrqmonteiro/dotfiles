local theme_name = "tokyonight"
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi
local gfs = require("gears.filesystem")
local themes_path = gfs.get_themes_dir()
-- local layout_icon_path = os.getenv("HOME") .. "/.config/awesome/themes/" .. theme_name .. "/layout/"
local titlebar_icon_path = os.getenv("HOME") .. "/.config/awesome/themes/" .. theme_name .. "/titlebar/"
local taglist_icon_path = os.getenv("HOME") .. "/.config/awesome/themes/" .. theme_name .. "/taglist/"

local theme = {}

theme.font          = "SF Pro Display Medium 11"
theme.bg_normal     = "#24283b"
theme.bg_focus      = theme.bg_normal
theme.bg_urgent     = theme.bg_normal
theme.bg_minimize   = theme.bg_normal
theme.bg_systray    = theme.bg_normal
theme.fg_normal     = "#d8dee9"
theme.fg_focus      = theme.fg_normal
theme.fg_urgent     = theme.fg_normal
theme.fg_minimize   = theme.fg_normal
theme.useless_gap   = dpi(7)
theme.border_width  = dpi(0)
theme.titlebar_size = dpi(31)
theme.titlebar_position = "top"

-- Sidebar
-- (Sidebar items can be customized in sidebar.lua)
theme.sidebar_bg = "#242831"
theme.sidebar_fg = theme.fg_normal
theme.sidebar_opacity = 1
theme.sidebar_position = "right" -- left or right
theme.sidebar_width = dpi(300)
theme.sidebar_x = 0
theme.sidebar_y = 0
theme.sidebar_border_radius = dpi(20)
-- theme.sidebar_border_radius = theme.border_radius

-- Mpd song
theme.mpd_song_title_color = theme.fg_normal
theme.mpd_song_artist_color = theme.fg_normal
theme.mpd_song_paused_color = theme.fg_normal

-- Icon taglist
local ntags = 10
theme.taglist_icons_hover = {}
theme.taglist_icons_empty = {}
theme.taglist_icons_noempty = {}
theme.taglist_icons_noempty_hover = {}
theme.taglist_icons_selected = {}
theme.taglist_icons_urgent = {}
-- table.insert(tag_icons, tag)
for i = 1, ntags do
  theme.taglist_icons_hover[i] = taglist_icon_path .. tostring(i) .. "_hover.svg"
  theme.taglist_icons_empty[i] = taglist_icon_path .. tostring(i) .. "_empty.svg"
  theme.taglist_icons_noempty[i] = taglist_icon_path .. tostring(i) .. "_noempty.svg"
  theme.taglist_icons_noempty_hover[i] = taglist_icon_path .. tostring(i) .. "_noempty_hover.svg"
  theme.taglist_icons_selected[i] = taglist_icon_path .. tostring(i) .. "_selected.svg"
  theme.taglist_icons_urgent[i] = taglist_icon_path .. tostring(i) .. "_urgent.svg"
end

-- Define the image to load
theme.titlebar_close_button_normal = titlebar_icon_path .. "close_normal.svg"
theme.titlebar_close_button_focus  = titlebar_icon_path .. "close_focus.svg"

theme.titlebar_minimize_button_normal = titlebar_icon_path .. "minimize_normal.svg"
theme.titlebar_minimize_button_focus  = titlebar_icon_path .. "minimize_focus.svg"

theme.titlebar_ontop_button_normal_inactive = titlebar_icon_path .. "ontop_normal_inactive.svg"
theme.titlebar_ontop_button_focus_inactive  = titlebar_icon_path .. "ontop_focus_inactive.svg"
theme.titlebar_ontop_button_normal_active = titlebar_icon_path .. "ontop_normal_active.svg"
theme.titlebar_ontop_button_focus_active  = titlebar_icon_path .. "ontop_focus_active.svg"

theme.titlebar_sticky_button_normal_inactive = titlebar_icon_path .. "sticky_normal_inactive.svg"
theme.titlebar_sticky_button_focus_inactive  = titlebar_icon_path .. "sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_active = titlebar_icon_path .. "sticky_normal_active.png"
theme.titlebar_sticky_button_focus_active  = titlebar_icon_path .. "sticky_focus_active.png"

theme.titlebar_floating_button_normal_inactive = themes_path.."default/titlebar/floating_normal_inactive.png"
theme.titlebar_floating_button_focus_inactive  = themes_path.."default/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_active = themes_path.."default/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_active  = themes_path.."default/titlebar/floating_focus_active.png"

theme.titlebar_maximized_button_normal_inactive = titlebar_icon_path .. "maximized_normal_inactive.svg"
theme.titlebar_maximized_button_focus_inactive  = titlebar_icon_path .. "maximized_focus_inactive.svg"
theme.titlebar_maximized_button_normal_active = titlebar_icon_path .. "maximized_normal_active.svg"
theme.titlebar_maximized_button_focus_active  = titlebar_icon_path .. "maximized_focus_active.svg"

-- Hover
theme.titlebar_close_button_normal_hover = titlebar_icon_path .. "close_normal_hover.svg"
theme.titlebar_close_button_focus_hover  = titlebar_icon_path .. "close_focus_hover.svg"

theme.titlebar_minimize_button_normal_hover = titlebar_icon_path .. "minimize_normal_hover.svg"
theme.titlebar_minimize_button_focus_hover  = titlebar_icon_path .. "minimize_focus_hover.svg"

theme.titlebar_maximized_button_normal_inactive_hover = titlebar_icon_path .. "maximized_normal_inactive_hover.svg"
theme.titlebar_maximized_button_focus_inactive_hover  = titlebar_icon_path .. "maximized_focus_inactive_hover.svg"
theme.titlebar_maximized_button_normal_active_hover = titlebar_icon_path .. "maximized_normal_active_hover.svg"
theme.titlebar_maximized_button_focus_active_hover  = titlebar_icon_path .. "maximized_focus_active_hover.svg"

theme.titlebar_ontop_button_normal_inactive_hover = titlebar_icon_path .. "ontop_normal_inactive_hover.svg"
theme.titlebar_ontop_button_focus_inactive_hover  = titlebar_icon_path .. "ontop_focus_inactive_hover.svg"
theme.titlebar_ontop_button_normal_active_hover = titlebar_icon_path .. "ontop_normal_active_hover.svg"
theme.titlebar_ontop_button_focus_active_hover  = titlebar_icon_path .. "ontop_focus_active_hover.svg"

-- You can use your own layout icons like this:
theme.layout_fairh = themes_path.."default/layouts/fairhw.png"
theme.layout_fairv = themes_path.."default/layouts/fairvw.png"
theme.layout_floating  = themes_path.."default/layouts/floatingw.png"
theme.layout_magnifier = themes_path.."default/layouts/magnifierw.png"
theme.layout_max = themes_path.."default/layouts/maxw.png"
theme.layout_fullscreen = themes_path.."default/layouts/fullscreenw.png"
theme.layout_tilebottom = themes_path.."default/layouts/tilebottomw.png"
theme.layout_tileleft   = themes_path.."default/layouts/tileleftw.png"
theme.layout_tile = themes_path.."default/layouts/tilew.png"
theme.layout_tiletop = themes_path.."default/layouts/tiletopw.png"
theme.layout_spiral  = themes_path.."default/layouts/spiralw.png"
theme.layout_dwindle = themes_path.."default/layouts/dwindlew.png"
theme.layout_cornernw = themes_path.."default/layouts/cornernww.png"
theme.layout_cornerne = themes_path.."default/layouts/cornernew.png"
theme.layout_cornersw = themes_path.."default/layouts/cornersww.png"
theme.layout_cornerse = themes_path.."default/layouts/cornersew.png"

-- Define the icon theme for application icons. If not set then the icons
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
theme.icon_theme = "Delta"

return theme
