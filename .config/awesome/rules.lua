local awful = require("awful")
local beautiful = require("beautiful")
local keys = require("keys")
local gears = require("gears")

local screen_height = awful.screen.focused().geometry.height
local screen_width = awful.screen.focused().geometry.width

-- local rules = {}

local centered_client_placement = function(c)
    return gears.timer.delayed_call(function ()
        awful.placement.centered(c, {honor_padding = true, honor_workarea=true})
    end)
end

return {

-- All clients will match this rule.
{
  rule = { },
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
      "conversation",
    },
  },
  properties = { 
  titlebars_enabled = true,
  }
},

-- Titlebars Off
{ 
  rule_any = {
    class = { 
      "LibreWolf",
      "TelegramDesktop",
      "Lutris",
    },
    type = {
      "splash"
    },
  },
  properties = { 
  titlebars_enabled = false,
  }
},

-- Floating clients.
{
  rule_any = {
    instance = {
      "copyq",  -- Includes session name in class.
      "Devtools",
      "DTA",  -- Firefox addon DownThemAll.
      "floating_terminal",
      "pinentry",
    },
    class = {
      "Galculator",
      "Gpick",
      "Lxappearance",
      "mpv",
      "Nextcloud",
      "Nitrogen",
      "Pavucontrol",
      "Sxiv",
      "Viewnior",
      "Zathura",
    },
-- Note that the name property shown in xprop might be set slightly after creation of the client
-- and the name shown there might not match defined rules here.
    name = {
      "Event Tester",  -- xev.
      "MetaMask Notification",
    },
    role = {
      "AlarmWindow",  -- Thunderbird's calendar.
      "ConfigManager",  -- Thunderbird's about:config.
      "GtkFileChooserDialog",
      "pop-up",       -- e.g. Google Chrome's (detached) Developer Tools.
      },
    type = {
      "dialog",
    }
  },
    properties = {
      floating = true,
      placement = centered_client_placement,
    }
},

-- Fullscreen clients
{
  rule_any = {
    class = {
      "Kodi",
      "dota2",
    },
    instance = {
      "synthetik.exe",
    },
  },
    properties = { fullscreen = true }
  },

-- Start application on specific workspace
-- 1 [Nrowser]
{
  rule_any = {
    class = {
      "Firefox",
      "LibreWolf",
    },
    },
    except_any = {
      role = { "GtkFileChooserDialog" },
      instance = { "Toolkit" },
      type = { "dialog" }
    },
    properties = { screen = 1, tag = awful.screen.focused().tags[1] },
},

-- 2 [Coding, Terminals]
{
    rule = { class = 'code-oss' },
    properties = { screen = 1, tag = awful.screen.focused().tags[2] },
},

}

-- return rules
