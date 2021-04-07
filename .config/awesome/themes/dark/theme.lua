local awful = require("awful")
local wibox = require("wibox")
local theme_name = "dark"
local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi
local gfs = require("gears.filesystem")
local themes_path = gfs.get_themes_dir()
local layout_icon_path = os.getenv("HOME") .. "/.config/awesome/themes/" .. theme_name .. "/layout/"
local titlebar_icon_path = os.getenv("HOME") .. "/.config/awesome/themes/" .. theme_name .. "/titlebar/"
local taglist_icon_path = os.getenv("HOME") .. "/.config/awesome/themes/" .. theme_name .. "/taglist/"
local xrdb = xresources.get_current_theme()

local theme = {}

theme.font          = "Google Sans NerdFont Medium 11"
theme.bg_normal     = x.background
theme.bg_focus      = x.background
theme.bg_urgent     = x.background
theme.bg_minimize   = x.background
theme.bg_systray    = theme.bg_normal
theme.fg_normal     = x.color15
theme.fg_focus      = x.foreground
theme.fg_urgent     = x.color6
theme.fg_minimize   = x.color15
theme.useless_gap   = dpi(7)
theme.border_width  = dpi(0)
theme.border_normal = "#000000"
theme.border_focus  = "#535d6c"
theme.border_marked = "#91231c"

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

-- Noodle Text Taglist
theme.taglist_text_font = "GoogleSans Nerd Font 11"
theme.taglist_text_empty    = {"","","","","","","","","",""}
theme.taglist_text_occupied = {"","","","","","","","","",""}
theme.taglist_text_focused  = {"","","","","","","","","",""}
theme.taglist_text_urgent   = {"","","","","","","","","",""}
-- theme.taglist_text_urgent   = {"","","","","","","","","",""}
-- theme.taglist_text_urgent   = {"","","","","","","","","",""}

theme.taglist_text_color_empty    = { x.color0, x.color0, x.color0, x.color0, x.color0, x.color0, x.color0, x.color0, x.color0, x.color0 }
theme.taglist_text_color_occupied  = { x.color1.."55", x.color2.."55", x.color3.."55", x.color4.."55", x.color5.."55", x.color6.."55", x.color1.."55", x.color2.."55", x.color3.."55", x.color4.."55" }
theme.taglist_text_color_focused  = { x.color1, x.color2, x.color3, x.color4, x.color5, x.color6, x.color1, x.color2, x.color3, x.color4 }
theme.taglist_text_color_urgent   = { x.color9, x.color10, x.color11, x.color12, x.color13, x.color14, x.color9, x.color10, x.color11, x.color12 }

-- Prompt
theme.prompt_fg = accent_color

-- Text Taglist
theme.taglist_font = "Iosevka Nerd Font 12"
-- theme.taglist_font = theme.font
theme.taglist_bg_focus = x.color0 .. "00"
theme.taglist_fg_focus = x.color14
theme.taglist_bg_occupied = x.color0 .. "00"
theme.taglist_fg_occupied = x.color4
theme.taglist_bg_empty = x.color0 .. "00"
theme.taglist_fg_empty = x.color8
theme.taglist_bg_urgent = x.color0 .. "00"
theme.taglist_fg_urgent = urgent_color
theme.taglist_disable_icon = true
theme.taglist_spacing = dpi(0)
-- Generate taglist squares:
local taglist_square_size = dpi(0)
theme.taglist_squares_sel = theme_assets.taglist_squares_sel(
    taglist_square_size, theme.fg_focus
)
theme.taglist_squares_unsel = theme_assets.taglist_squares_unsel(
    taglist_square_size, theme.fg_normal
)

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

theme.wallpaper = themes_path.."default/background.png"

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
theme.icon_theme = Papirus

return theme

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
