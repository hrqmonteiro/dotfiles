local awful = require("awful")
local gears = require("gears")
local icons = require("icons")
local wibox = require("wibox")
local beautiful = require("beautiful")
local apps = require("apps")

local helpers = require("helpers")

-- Item configuration
-- ==================
-- Weather widget with text icons
local weather_widget = require("noodle.text_weather")
local weather_widget_icon = weather_widget:get_all_children()[1]
-- weather_widget_icon.font = "Typicons 18"
weather_widget_icon.font = "Victor Mono Nerd Font"
weather_widget_icon.align = "center"
weather_widget_icon.valign = "center"
-- So that content does not get cropped
-- weather_widget_icon.forced_width = dpi(50)
local weather_widget_description = weather_widget:get_all_children()[2]
weather_widget_description.font = "SF Pro Display Medium 11"
local weather_widget_temperature = weather_widget:get_all_children()[3]
weather_widget_temperature.font = "SF Pro Display Medium 11"

local weather = wibox.widget{
    {
        nil,
        weather_widget_description,
        expand = "none",
        layout = wibox.layout.align.horizontal
    },
    {
        nil,
        {
            weather_widget_icon,
            weather_widget_temperature,
            spacing = dpi(5),
            layout = wibox.layout.fixed.horizontal
        },
        expand = "none",
        layout = wibox.layout.align.horizontal
    },
    spacing = dpi(5),
    layout = wibox.layout.fixed.vertical
    -- nil,
    -- weather_widget,
    -- layout = wibox.layout.align.horizontal,
    -- expand = "none"
}

local clock = {
        font = "SF Pro Display Medium 50",
        align = "center",
        valign = "center",
        widget = wibox.widget.textclock(
            "<span font_desc='SF Pro Display 50'>%H</span><span font_desc='SF Pro Display Thin 50'>:%M</span>"
        )
}

-- Calendar
local styles = {}

styles.month   = { padding      = 0,
                   bg_color     = '#00000000',
                   font         = 'SF Pro Display Medium 11',
                   border_width = 2,
}
styles.normal  = { markup = function(t) return t .. "  " end }
styles.focus   = { fg_color = '#2e3440',
                   bg_color = '#88c0d0',
                   markup   = function(t) return '<b>' .. " " .. t .. '</b>' .. " " end,
                   shape = gears.shape.circle
}
styles.header  = { fg_color = '#d8dee9',
                   bg_color = '#00000000',
                   markup   = function(t) return '<span font_desc="SF Pro Display Medium 16">' .. t .. '</span>' end,
}
styles.weekday = { fg_color = '#d8dee9',
                   bg_color = '#00000000',
                   markup   = function(t) return '<span font_desc="SF Pro Display Medium 12">'  .. t .. '</span>' end,
}
local function decorate_cell(widget, flag, date)
    if flag=='monthheader' and not styles.monthheader then
        flag = 'header'
    end
    local props = styles[flag] or {}
    if props.markup and widget.get_text and widget.set_markup then
        widget:set_markup(props.markup(widget:get_text()))
    end
    -- Change bg color for weekends
    local d = {year=date.year, month=(date.month or 1), day=(date.day or 1)}
    local weekday = tonumber(os.date('%w', os.time(d)))
    local default_fg = (weekday==0 or weekday==6) and '#d8dee9' or '#717883'
    local ret = wibox.widget {
        {
            widget,
            margins = (props.padding or 2) + (props.border_width or 0),
            widget  = wibox.container.margin
        },
        shape              = props.shape,
        shape_border_color = props.border_color or '#00000000',
        shape_border_width = props.border_width or 0,
        fg                 = props.fg_color or default_fg,
        bg                 = props.bg_color or "#00000000",
        widget             = wibox.container.background
    }
    return ret
end
local cal = wibox.widget {
    font     = "SF Pro Display Medium 10",
    date     = os.date('*t'),
    fn_embed = decorate_cell,
    widget   = wibox.widget.calendar.month
}

local btc_command = "btc-value -d"
local btc_update_interval = 3600

local btc = wibox.widget {
    align = "center",
    valign = "center",
    font = "SF Pro Display Medium 11",
    text = "Loading BTC price..",
    widget = wibox.widget.textbox
}

local update_btc = function()
    awful.spawn.easy_async_with_shell(btc_command, function(out)
        out = out:gsub('^%s*(.-)%s*$', '%1')
        btc.markup = '  ' .. '<span font_desc="SF Pro Display Medium 11">' .. out .."</span>"
    end)
end

gears.timer {
    autostart = true,
    timeout = btc_update_interval,
    single_shot = false,
    call_now = true,
    callback = update_btc
}

local btc_widget = wibox.widget{
    {
        nil,
        btc,
        layout = wibox.layout.align.horizontal,
    },
    margins = 0,
    color = "#00000000",
    widget = wibox.container.margin
}

local btc_logo = wibox.widget {
    image  = icons.image.btc,
    resize = false,
    width = 5,
    height = 5,
    widget = wibox.widget.imagebox,

}

local bch_logo = wibox.widget {
    image  = icons.image.bch,
    resize = false,
    width = 5,
    height = 5,
    widget = wibox.widget.imagebox,

}

local btc_stats = {
        expand = "none",
        layout = wibox.layout.align.horizontal,
        nil,
        {
            layout = wibox.layout.fixed.horizontal,
            btc_logo,
            btc,
            wibox.container.margin(bch_logo, dpi(15), dpi(0), dpi(0), dpi(0)),
            btc,
        },
        nil
}

mysystray = wibox.widget.systray({

})

beautiful.bg_systray = "#323846"
beautiful.systray_icon_spacing = 25

mysystray:set_horizontal(true)
mysystray:set_base_size(22)

local systray = {
    expand = "none",
    layout = wibox.layout.align.horizontal,
    nil,
    {
      layout = wibox.layout.fixed.horizontal,
      mysystray
    },
    nil,
}

local stoic_command = "quote"
local stoic_update_interval = 3600

local stoic = wibox.widget {
    align = "left",
    valign = "center",
    font = "SF Pro Display Medium 11",
    text = "Loading quote...",
    widget = wibox.widget.textbox
}

local update_stoic = function()
    awful.spawn.easy_async_with_shell(stoic_command, function(out)
        out = out:gsub('^%s*(.-)%s*$', '%1')
        stoic.markup = '  ' .. '<span font_desc="SF Pro Display Medium Italic 11">' .. out .."</span>"
    end)
end

gears.timer {
    autostart = true,
    timeout = stoic_update_interval,
    single_shot = false,
    call_now = true,
    callback = update_stoic
}

local stoic_widget = wibox.widget{
    {
        nil,
        stoic,
        layout = wibox.layout.align.horizontal,
    },
    margins = 0,
    color = "#00000000",
    widget = wibox.container.margin
}

-- Mpd
local mpd_buttons = require("noodle.mpd_buttons")
local spotify_buttons = require("noodle.spotify_buttons")
local mpd_song = require("noodle.mpd_song")
local mpd_widget_children = mpd_song:get_all_children()
local mpd_title = mpd_widget_children[1]
local mpd_artist = mpd_widget_children[2]
mpd_title.font = "SF Pro Display Medium 14"
mpd_artist.font = "SF Pro Display Medium Italic 12"

-- Spotify
local spotify = require("noodle.spotify")

-- Set forced height in order to limit the widgets to one line.
-- Might need to be adjusted depending on the font.
mpd_title.forced_height = dpi(22)
mpd_artist.forced_height = dpi(16)

mpd_song:buttons(gears.table.join(
    awful.button({ }, 1, function ()
        awful.spawn.with_shell("mpc -q toggle")
    end),
    awful.button({ }, 3, apps.music),
    awful.button({ }, 4, function ()
        awful.spawn.with_shell("mpc -q prev")
    end),
    awful.button({ }, 5, function ()
        awful.spawn.with_shell("mpc -q next")
    end)
))

local search_icon = wibox.widget {
    font = "icomoon bold 10",
    align = "center",
    valign = "center",
    widget = wibox.widget.textbox()
}

local reset_search_icon = function ()
    search_icon.markup = helpers.colorize_text("", x.color3)
end
reset_search_icon()

local search_text = wibox.widget {
    -- markup = helpers.colorize_text("Search", x.color8),
    align = "center",
    valign = "center",
    font = "sans 9",
    widget = wibox.widget.textbox()
}

local search_bar = wibox.widget {
    shape = gears.shape.rounded_bar,
    bg = x.color0,
    widget = wibox.container.background()
}

local search = wibox.widget{
    -- search_bar,
    {
        {
            search_icon,
            {
                search_text,
                bottom = dpi(2),
                widget = wibox.container.margin
            },
            layout = wibox.layout.fixed.horizontal
        },
        left = dpi(15),
        widget = wibox.container.margin
    },
    forced_height = dpi(35),
    forced_width = dpi(200),
    shape = gears.shape.rounded_bar,
    bg = x.color0,
    widget = wibox.container.background()
    -- layout = wibox.layout.stack
}

local function generate_prompt_icon(icon, color)
    return "<span font='icomoon 10' foreground='" .. color .."'>" .. icon .. "</span> "
end

function sidebar_activate_prompt(action)
    sidebar.visible = true
    search_icon.visible = false
    local prompt
    if action == "run" then
        prompt = generate_prompt_icon("", x.color2)
    elseif action == "web_search" then
        prompt = generate_prompt_icon("", x.color4)
    end
    helpers.prompt(action, search_text, prompt, function()
        search_icon.visible = true
        if mouse.current_wibox ~= sidebar then
            sidebar.visible = false
        end
    end)
end

local prompt_is_active = function ()
    -- The search icon is hidden and replaced by other icons
    -- when the prompt is running
    return not search_icon.visible
end

search:buttons(gears.table.join(
    awful.button({ }, 1, function ()
        sidebar_activate_prompt("run")
    end),
    awful.button({ }, 3, function ()
        sidebar_activate_prompt("web_search")
    end)
))

-- Create the sidebar
sidebar = wibox({visible = false, ontop = true, type = "dock", screen = screen.primary})
sidebar.bg = "#00000000" -- For anti aliasing
sidebar.fg = beautiful.sidebar_fg or beautiful.wibar_fg or "#FFFFFF"
sidebar.opacity = beautiful.sidebar_opacity or 1
sidebar.height = screen.primary.geometry.height
sidebar.width = beautiful.sidebar_width or dpi(300)
sidebar.y = beautiful.sidebar_y or 0
local radius = beautiful.sidebar_border_radius or 0
if beautiful.sidebar_position == "right" then
    awful.placement.top_right(sidebar)
else
    awful.placement.top_left(sidebar)
end
awful.placement.maximize_vertically(sidebar, { honor_workarea = true, })

sidebar:buttons(gears.table.join(
    -- Middle click - Hide sidebar
    awful.button({ }, 2, function ()
        sidebar_hide()
    end)
))

sidebar_show = function()
    sidebar.visible = true
end

sidebar_hide = function()
    -- Do not hide it if prompt is active
    if not prompt_is_active() then
        sidebar.visible = false
    end
end

sidebar_toggle = function()
    if sidebar.visible then
        sidebar_hide()
    else
        sidebar.visible = true
    end
end

-- Hide sidebar when mouse leaves
if user.sidebar.hide_on_mouse_leave then
    sidebar:connect_signal("mouse::leave", function ()
        sidebar_hide()
    end)
end
-- Activate sidebar by moving the mouse at the edge of the screen
if user.sidebar.show_on_mouse_screen_edge then
    local sidebar_activator = wibox({y = sidebar.y, width = 1, visible = true, ontop = false, opacity = 0, below = true, screen = screen.primary})
    sidebar_activator.height = sidebar.height
    sidebar_activator:connect_signal("mouse::enter", function ()
        sidebar.visible = true
    end)

    if beautiful.sidebar_position == "right" then
        awful.placement.right(sidebar_activator)
    else
        awful.placement.left(sidebar_activator)
    end

    sidebar_activator:buttons(
        gears.table.join(
            awful.button({ }, 4, function ()
                awful.tag.viewprev()
            end),
            awful.button({ }, 5, function ()
                awful.tag.viewnext()
            end)
    ))
end

-- Item placement
sidebar:setup {
    {
        { ----------- TOP GROUP -----------
            {
                helpers.vertical_pad(dpi(30)),
                {
                    nil,
                    {
                        clock,
                        -- spacing = dpi(12),
                        layout = wibox.layout.fixed.horizontal
                    },
                    expand = "none",
                    layout = wibox.layout.align.horizontal,
                },
                wibox.container.margin(weather, dpi(0), dpi(0), dpi(25), dpi(0)),
                wibox.container.margin(btc_stats, dpi(0), dpi(0), dpi(25), dpi(0)),
                {
                    nil,
                    expand = "none",
                    layout = wibox.layout.align.horizontal,
                },
                helpers.vertical_pad(dpi(30)),
                wibox.container.margin(cal, dpi(20), dpi(25), dpi(0), dpi(0)),
                layout = wibox.layout.fixed.vertical
            },
            layout = wibox.layout.fixed.vertical,
        },
                { ----------- MIDDLE GROUP -----------
            {
                {
                    {
                        spotify_buttons,
                        spotify,
                        spacing = dpi(5),
                        layout = wibox.layout.fixed.vertical,
                    },
                    top = dpi(40),
                    bottom = dpi(60),
                    left = dpi(20),
                    right = dpi(20),
                    widget = wibox.container.margin
                },
                {
                    nil,
                    {
                        spacing = dpi(5),
                        -- layout = wibox.layout.fixed.vertical
                        layout = wibox.layout.fixed.horizontal
                    },
                    expand = "none",
                    layout = wibox.layout.align.horizontal
                },
                helpers.vertical_pad(dpi(25)),
                layout = wibox.layout.fixed.vertical
            },
            bg = "#00000000",
            widget = wibox.container.background
        },
        { ----------- BOTTOM GROUP -----------
            {
                {
                    {
                        nil,
                        wibox.container.margin(stoic_widget, dpi(25), dpi(25), dpi(25), dpi(25)),
                        expand = "none",
                        layout = wibox.layout.align.horizontal,
                    },
                    systray,
                    {
                        nil,
                        expand = "none",
                        layout = wibox.layout.align.horizontal,
                    },
                    layout = wibox.layout.fixed.vertical
                },
                left = dpi(0),
                right = dpi(0),
                bottom = dpi(0),
                widget = wibox.container.margin
            },
            shape = helpers.prrect(beautiful.sidebar_border_radius, false, true, false, false),
            bg = "#2e3440",
            widget = wibox.container.background
        },
        layout = wibox.layout.align.vertical,
    },
    shape = helpers.prrect(beautiful.sidebar_border_radius, true, false, false, false),
    bg = beautiful.sidebar_bg,
    widget = wibox.container.background
}
