local themes = {
    "dark" -- Neptune Dark --
}

local theme = themes[1]

local icon_themes = {
    "drops" -- 2 -- Pastel + filled
}

            local icon_theme = icon_themes[1]

-- Standard awesome library
local gears = require("gears")
require("awful.autofocus")

-- Keybindings
local keys = require("keys")

-- Window Rules
awful = require("awful")
-- awful.rules.rules = require("rules")

-- Widget and layout library
local wibox = require("wibox")

-- Notification library
local naughty = require("naughty")
local menubar = require("menubar")

-- Theme handling library
local beautiful = require("beautiful")
local xrdb = beautiful.xresources.get_current_theme()

-- User vars
terminal = "alacritty"
floating_terminal = "alacritty --class floating_terminal"
browser = "firefox"
editor = "alacritty --class editor -e nvim"

-- Make DPI function global
dpi = beautiful.xresources.apply_dpi

-- Make .Xresources colors global
x = {
    --           xrdb variable
    background = xrdb.background,
    foreground = xrdb.foreground,
    color0 = xrdb.color0,
    color1 = xrdb.color1,
    color2 = xrdb.color2,
    color3 = xrdb.color3,
    color4 = xrdb.color4,
    color5 = xrdb.color5,
    color6 = xrdb.color6,
    color7 = xrdb.color7,
    color8 = xrdb.color8,
    color9 = xrdb.color9,
    color10 = xrdb.color10,
    color11 = xrdb.color11,
    color12 = xrdb.color12,
    color13 = xrdb.color13,
    color14 = xrdb.color14,
    color15 = xrdb.color15
}

-- Load theme
local theme_dir = os.getenv("HOME") .. "/.config/awesome/themes/" .. theme .. "/"
beautiful.init(theme_dir .. "theme.lua")

-- Initialize icons array and load icon theme
local icons = require("icons")
icons.init(icon_theme)

-- Error handling
-- Check if awesome encountered an error during startup and fell back to
-- another config (This code will only ever execute for the fallback config)
if awesome.startup_errors then
    naughty.notify(
        {
            preset = naughty.config.presets.critical,
            title = "Oops, there were errors during startup!",
            text = awesome.startup_errors
        }
    )
end

-- Handle runtime errors after startup
do
    local in_error = false
    awesome.connect_signal(
        "debug::error",
        function(err)
            -- Make sure we don't go into an endless error loop
            if in_error then
                return
            end
            in_error = true

            naughty.notify(
                {
                    preset = naughty.config.presets.critical,
                    title = "Oops, an error happened!",
                    text = tostring(err)
                }
            )
            in_error = false
        end
    )
end

-- Get screen geometry
-- I am using a single screen setup and I assume that screen geometry will not
-- change during the session.
screen_width = awful.screen.focused().geometry.width
screen_height = awful.screen.focused().geometry.height

-- Layouts
-- Table of layouts to cover with awful.layout.inc, order matters.
awful.layout.layouts = {
    awful.layout.suit.floating,
    awful.layout.suit.tile,
    awful.layout.suit.tile.left,
    awful.layout.suit.tile.bottom,
    awful.layout.suit.tile.top,
    awful.layout.suit.fair,
    awful.layout.suit.fair.horizontal,
    awful.layout.suit.spiral,
    awful.layout.suit.spiral.dwindle,
    awful.layout.suit.max,
    awful.layout.suit.max.fullscreen,
    awful.layout.suit.magnifier,
    awful.layout.suit.corner.nw,
    awful.layout.suit.corner.ne,
    awful.layout.suit.corner.sw,
    awful.layout.suit.corner.se,
}

-- Wallpaper
local function set_wallpaper(s)
    if beautiful.wallpaper then
        -- local wallpaper = beautiful.wallpaper
        -- -- If wallpaper is a function, call it with the screen
        -- if type(wallpaper) == "function" then
        --     wallpaper = wallpaper(s)
        -- end
        -- gears.wallpaper.maximized(wallpaper, s, true)
        awful.spawn.with_shell(os.getenv("HOME") .. "/.fehbg")
    end
end

-- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
screen.connect_signal("property::geometry", set_wallpaper)
awful.screen.connect_for_each_screen(
    function(s)
        -- Wallpaper
        set_wallpaper(s)
    end
)

-- Tags
awful.screen.connect_for_each_screen(
    function(s)
        -- Each screen has its own tag table.
        local l = awful.layout.suit -- Alias to save time :)
        -- Tag layouts
        local layouts = {
            l.tile,
            l.tile.left,
            l.max,
            l.max,
            l.max,
            l.max,
            l.max,
            l.max,
            l.max,
            l.max
        }

        -- Tag names
        local tagnames = beautiful.tagnames or {"1", "2", "3", "4", "5", "6", "7", "8", "9", "10"}
        -- Create all tags at once (without seperate configuration for each tag)
        awful.tag(tagnames, s, layouts)
        -- Create tags with seperate configuration for each tag
        -- awful.tag.add(tagnames[1], {
        --     layout = layouts[1],
        --     screen = s,
        --     master_width_factor = 0.6,
        --     selected = true,
        -- })

        local left_panel = require("panels.left")
        left_panel.create(s)
    end
)

-- Rules
local centered_client_placement = function(c)
    return gears.timer.delayed_call(
        function()
            awful.placement.centered(c, {honor_padding = true, honor_workarea = true})
        end
    )
end

awful.rules.rules = {
    -- All clients will match this rule.
    {
        rule = {},
        properties = {
            border_width = beautiful.border_width,
            border_color = beautiful.border_normal,
            buttons = clientbuttons,
            focus = awful.client.focus.filter,
            honor_padding = true,
            honor_workarea = true,
            keys = clientkeys,
            maximized = false,
            maximized_horizontal = false,
            maximized_vertical = false,
            placement = floating_client_placement,
            raise = true,
            screen = awful.screen.focused,
            size_hints_honor = false
        }
    },
    -- Add titlebars to normal clients and dialogs
    {
        rule_any = {
            type = {
                "normal",
                "dialog"
            },
            role = {
                "conversation"
            }
        },
        properties = {
            titlebars_enabled = true
        }
    },
    -- Titlebars Off
    {
        rule_any = {
            class = {
                "ck2",
                "csgo_linux64",
                "LibreWolf",
                "Lutris",
                "Steam",
                "TelegramDesktop"
            },
            type = {
                "splash"
            }
        },
        properties = {
            titlebars_enabled = false
        }
    },
    -- Floating clients.
    {
        rule_any = {
            instance = {
                "copyq", -- Includes session name in class.
                "Devtools",
                "DTA", -- Firefox addon DownThemAll.
                "floating_terminal",
                "pinentry"
            },
            class = {
                "Galculator",
                "Gpick",
                "Lxappearance",
                "mpv",
                "Mousepad",
                "Nextcloud",
                "Nitrogen",
                "Pavucontrol",
                "SimpleScreenRecorder",
                "Sxiv",
                "URxvt",
                "Viewnior",
                -- "Zathura"
            },
            -- Note that the name property shown in xprop might be set slightly after creation of the client
            -- and the name shown there might not match defined rules here.
            name = {
                "Event Tester", -- xev.
                "Friends List", -- Steam friends list,
                "MetaMask Notification"
            },
            role = {
                "AlarmWindow", -- Thunderbird's calendar.
                "ConfigManager", -- Thunderbird's about:config.
                "GtkFileChooserDialog",
                "pop-up" -- e.g. Google Chrome's (detached) Developer Tools.
            },
            type = {
                "dialog"
            }
        },
        properties = {
            floating = true,
            placement = centered_client_placement
        }
    },
    -- Fullscreen clients
    {
        rule_any = {
            class = {
                "Kodi",
                "dota2"
            },
            instance = {
                "synthetik.exe"
            }
        },
        properties = {fullscreen = true}
    },
    -- Start application on specific workspace --
    -- [1] Browsing
    {
        rule_any = {
            class = {
                "firefox",
                "LibreWolf",
                "Navigator"
            }
        },
        except_any = {
            role = {"GtkFileChooserDialog"},
            instance = {"Toolkit"},
            type = {"dialog"}
        },
        properties = {screen = 1, tag = awful.screen.focused().tags[1]}
    },
    -- [2] Coding/Terminal
    {
        rule_any = {
            class = {
                "alacritty",
                "Atom",
                "Code - OSS",
                "Emacs"
            }
        },
        except_any = {
            class = {"floating_terminal"}
        },
        properties = {screen = 1, tag = awful.screen.focused().tags[2], switchtotag = true}
    },
    -- [3] File Managers
    {
        rule_any = {
            class = {
                "Nemo"
            }
        },
        properties = {screen = 1, tag = awful.screen.focused().tags[3], switchtotag = true}
    },
    -- [4] Joplin/ORG Agenda
    {
        rule_any = {
            class = {
                "Joplin"
            }
        },
        properties = {screen = 1, tag = awful.screen.focused().tags[4]}
    },
    -- [5] Graphics/Font Editing
    {
        rule_any = {
            class = {
                "fontforge",
                "Gimp",
                "Inkscape"
            }
        },
        properties = {screen = 1, tag = awful.screen.focused().tags[5]}
    },
    -- [6] Messaging
    {
        rule_any = {
            class = {
                "discord",
                "Element",
                "Signal",
                "TelegramDesktop",
                "Whalebird"
            }
        },
        properties = {screen = 1, tag = awful.screen.focused().tags[6]}
    },
    -- [7] RSS
    {
        rule_any = {
            class = {
                "Liferea"
            }
        },
        properties = {screen = 1, tag = awful.screen.focused().tags[7]}
    },
    -- [8] Games
    {
        rule_any = {
            class = {
                "Lutris",
                "Steam"
            },
            name = {
                "Steam"
            }
        },
        properties = {screen = 1, tag = awful.screen.focused().tags[8], switchtotag = true}
    },
    -- [9] Music/LBRY
    {
        rule_any = {
            class = {
                "Spotify"
            },
            name = {
                "Spotify Premium"
            }
        },
        properties = {screen = 1, tag = awful.screen.focused().tags[9]}
    },
    -- [10] Misc
    {
        rule_any = {
            class = {
                "torrent",
                "Transmission"
            },
            instance = {
                "torrent"
            }
        },
        except_any = {
            type = {"dialog"}
        },
        properties = {screen = 1, tag = awful.screen.focused().tags[10]}
    }
}

-- Signals
-- Signal function to execute when a new client appears.
client.connect_signal(
    "manage",
    function(c)
        -- Set the windows at the slave,
        -- i.e. put it at the end of others instead of setting it master.
        -- if not awesome.startup then awful.client.setslave(c) end
        if awesome.startup and not c.size_hints.user_position and not c.size_hints.program_position then
            -- Prevent clients from being unreachable after screen count changes.
            awful.placement.no_offscreen(c)
        end
    end
)

-- Titlebars
client.connect_signal(
    "request::titlebars",
    function(c)
        local titlebar =
            awful.titlebar(
            c,
            {
                position = "top",
                size = dpi(33)
            }
        )

        local buttons =
            gears.table.join(
            awful.button(
                {},
                1,
                function()
                    c:emit_signal("request::activate", "titlebar", {raise = true})
                    awful.mouse.client.move(c)
                end
            ),
            awful.button(
                {},
                3,
                function()
                    c:emit_signal("request::activate", "titlebar", {raise = true})
                    awful.mouse.client.resize(c)
                end
            )
        )

                  titlebar:setup {
            {
                -- AwesomeWM native buttons (images loaded from theme)
                                                      wibox.layout.margin(awful.titlebar.widget.closebutton(c), dpi(8), dpi(0), dpi(0), dpi(0)),
                wibox.layout.margin(awful.titlebar.widget.maximizedbutton(c), dpi(-3), dpi(0), dpi(0), dpi(0)),
                wibox.layout.margin(awful.titlebar.widget.minimizebutton(c), dpi(-3), dpi(0), dpi(0), dpi(0)),
                layout = wibox.layout.fixed.horizontal
            },
            {
                buttons = buttons,
                align = "center",
                layout = wibox.layout.flex.horizontal
            },
            {
                -- buttons = buttons,
                wibox.layout.margin(awful.titlebar.widget.ontopbutton(c), dpi(0), dpi(8), dpi(0), dpi(0)),
                -- wibox.layout.margin(awful.titlebar.widget.iconwidget(c), dpi(10), dpi(10), dpi(8), dpi(15)),
                layout = wibox.layout.align.horizontal
            },
            layout = wibox.layout.align.horizontal
        }
    end
)

-- Enable sloppy focus, so that focus follows mouse.
-- client.connect_signal("mouse::enter", function(c)
--     c:emit_signal("request::activate", "mouse_enter", {raise = false})
-- end)

-- client.connect_signal("focus", function(c) c.border_color = beautiful.border_focus end)
-- client.connect_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)
-- }}}

-- Autostart applications
awful.spawn.with_shell(os.getenv("HOME") .. "/.config/awesome/autostart.sh")

-- Garbage collection
-- Enable for lower memory consumption
-- ===================================================================
collectgarbage("setpause", 110)
collectgarbage("setstepmul", 1000)
